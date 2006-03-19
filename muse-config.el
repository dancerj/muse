;; configuraton for muse

(require 'muse-mode)
(require 'muse-html)
(require 'muse-project)

(setq muse-project-alist
      `(("Debian-study"			
	 (,default-directory :default "index")
	 (:base "html" :path ,(concat default-directory "html")))))
(setq muse-html-style-sheet "<link rel=\"stylesheet\" type=\"text/css\" href=\"debianmeeting.css\">")
