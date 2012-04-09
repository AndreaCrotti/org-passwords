;;; org-contacts.el --- Contacts management

;; Copyright (C) 2010, 2011 Andrea Crotti <andrea.crotti.0@gmail.com>

;; Author: Andrea Crotti <andrea.crotti.0@gmail.com>
;; Keywords: passwords, outlines
;;
;; This file is NOT part of GNU Emacs.
;;
;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:

;; This file contains the code for managing your passwords with Org-mode

;; To enter new passwords, you can use `org-capture' and a template just like
;; this:

;;         ("p" "password" entry (file "~/org/secrets.org.gpg")
;;          "* %(org-passwords-template-name)
;; :PROPERTIES:
;; :username: %(org-passwords-template-username)
;; :password: %(org-passwords-template-password)
;; :END:")))
;;
;;; Code:

(require 'org)

(defgroup org-passwords nil
  "Options regarding password management"
  :group 'org)

(defcustom org-passwords-password-property "password"
  "Property for password"
  :type 'string
  :group 'org-passwords)

(defcustom org-passwords-username-property "username"
  "Property for username"
  :type 'string
  :group 'org-passwords)

(defcustom org-passwords-files nil
  "List of org files storing passwords"
  :type '(repat file)
  :group 'org-passwords)

(defun org-passwords-template-password ()
  (concat "%^{" org-passwords-password-property "}p"))

(defun org-passwords-template-username ()
  (concat "%^{" org-passwords-username-property "}p"))

(defun org-passwords-template-name ()
  "%^{Account}")

;TODO: give a list of possible services to look up first
(defun org-passwords-get-password (service)
  "Get the password for a given service"
  (interactive "M")
  (org-entry-get (point) service))

(provide 'org-passwords)
