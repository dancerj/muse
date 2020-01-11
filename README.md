# tokyodebian-team.pages.debian.net

This is the main repo for https://tokyodebian-team.pages.debian.net web site.

There are other related repos for some large sub-directory:

- pdf2005, pdf2006, ...
- html2005, html2006, ...

For each year, create those new repos from the template repo using create_sub_repo.sh.
You need to enter your Personal Access Token (https://salsa.debian.org/profile/personal_access_tokens) with `api' Scope.

Example:

```
$ ./create_sub_repo.sh pdf2019
Your Personal Access Token: <copy-paste your token>
{"id":xxxxx,"description":"monthly report pdf files for year 2019","name":"pdf2019","name_with_namespace":"tokyodebian / pdf2019","path":"pdf2019","path_with_namespace":"tokyodebian-team/pdf2019","created_at":...
https://salsa.debian.org/tokyodebian-team/pdf2019.git
$ 
```
