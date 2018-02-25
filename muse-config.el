;; configuraton for muse

(require 'muse-mode)
(require 'muse-html)
(require 'muse-project)

(setq muse-project-alist
      `(("Debian-study"			
	 (,default-directory :default "index")
	 (:base "html" :path ,(concat default-directory "html")))))
(setq muse-html-style-sheet "<link rel=\"stylesheet\" type=\"text/css\" href=\"debianmeeting.css\">")

(setq muse-html-header
      (concat 
"<!DOCTYPE html>
<html lang=\"ja\">
  <head>
    <title><lisp>
  (concat (muse-publishing-directive \"title\")
          (let ((author (muse-publishing-directive \"author\")))
            (if (not (string= author (user-full-name)))
                (concat \" (by \" author \")\"))))</lisp></title>
    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <meta charset=\"UTF-8\">
    <meta name=\"generator\" content=\"muse.el\">
    <lisp>
      (let ((maintainer (muse-style-element :maintainer)))
        (when maintainer
          (concat \"<link rev=\\\"made\\\" href=\\\"\" maintainer \"\\\">\")))
    </lisp>
    <lisp>muse-html-style-sheet</lisp>
  </head>
  <body>
    <p><a href=\"index.html\"><img src=\"https://www.debian.org/logos/openlogo-nd-25.png\" alt=\"debian-open-logo-nd\">東京エリアDebian勉強会</a></p>
    <h1><lisp>
  (concat (muse-publishing-directive \"title\")
          (let ((author (muse-publishing-directive \"author\")))
            (if (not (string= author (user-full-name)))
                (concat \" (by \" author \")\"))))</lisp></h1>
    <div class=\"bodydiv\">
    <!-- Page published by Emacs Muse begins here -->
"))

(setq muse-html-footer (concat 
"<!-- Page published by Emacs Muse ends here -->
    </div>
  </body>
</html>\n"))
