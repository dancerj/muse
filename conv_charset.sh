#!/bin/sh -x
CHARSET_IC=EUC-JP
CHARSET_OC=UTF-8

find . -name "*.muse" -exec nkf --ic=${CHARSET_IC} --oc=${CHARSET_OC} --overwrite {} \;
find . -name "*.el" -exec nkf --ic=${CHARSET_IC} --oc=${CHARSET_OC} --overwrite {} \;
sed -i "s/${CHARSET_IC}/${CHARSET_OC}/g" muse-config.el
