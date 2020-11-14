;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2020 Oleg Pykhalov <go.wigust@gmail.com>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(use-modules (gnu packages base)
             (gnu packages compression)
             (guix build-system trivial)
             (guix gexp)
             ((guix licenses) #:prefix license:)
             (guix packages))

(define-public githunt
  (package
    (name "githunt")
    (version "3.0-2")
    (source (local-file (string-append (dirname (current-filename))
                                       "/githunt-" version ".tar.gz")))
    (build-system trivial-build-system)
    (native-inputs
     `(("gzip" ,gzip)
       ("tar" ,tar)))
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (setenv "PATH" (string-append
                         (assoc-ref %build-inputs "tar") "/bin" ":"
                         (assoc-ref %build-inputs "gzip") "/bin"))
         (let ((githunt (string-append (assoc-ref %outputs "out") "/share/githunt")))
           (mkdir-p githunt)
           (invoke "tar" "xvf" (assoc-ref %build-inputs "source") "-C" githunt "--strip-components=1"))
         #t)))
    (home-page "https://github.com/kamranahmedse/githunt")
    (synopsis "Hunt the most starred projects on GitHub")
    (description "GitHunt is a react application and a chrome extension that
lets you explore the most starred projects on GitHub.")
    (license license:expat)))

githunt
