#! /bin/sh
yyyy="$1"
if [ x = x"$yyyy" ]; then
    yyyy=`date +%Y`
fi
if ! echo "$yyyy" | grep -q -E '^[0-9]{4,}'; then
    echo "Usage: $0 [YYYY]"
    exit 1
fi
if [ x = x"$private_token" ]; then
    read -p 'Your Personal Access Token: ' private_token
fi

api="https://salsa.debian.org/api/v4"

gitlab_api () {
    local method="$1"
    local url="$2"
    local data="$3"
    curl -s --request "$method" --header "Content-Type: application/json" --header "PRIVATE-TOKEN: ${private_token}" "${api}${url}" --data "$data"
}

path="tokyodebian-team"

name="pdf${yyyy}"
description="monthly report pdf files for year ${yyyy}"
visibility="internal"
import_url="https://salsa.debian.org/tokyodebian-team/pdfyyyy.git"

namespace_id=`gitlab_api GET "/namespaces/${path}" | sed -n 's/^.*"id":\([0-9]*\),.*$/\1/p'`

if [ x = x"$namespace_id" ]; then
    echo ERROR: unknown namespace_id >&2
    exit 1
fi

if gitlab_api GET "/projects/${path}%2F${name}" | grep -q '"id":'; then
    echo "$name already exists"
    exit 0
fi

gitlab_api POST "/projects" "{\"name\":\"${name}\",\"namespace_id\":${namespace_id},\"description\":\"${description}\",\"visibility\":\"${visibility}\",\"import_url\":\"${import_url}\"}"
