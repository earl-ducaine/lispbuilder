;;; -*- lisp -*-

(defpackage #:lispbuilder-sdl-base-system
  (:use #:cl #:asdf))
(in-package #:lispbuilder-sdl-base-system)

(defsystem lispbuilder-sdl-base
    :description "lispbuilder-sdl-base: SDL library wrapper providing a base set of functionality."
    :long-description
    "The lispbuilder-sdl-base prackage provides a base set of functionality on top of the CFFI bndings of lispbuilder-sdl-wrapper."
    :version "0.9.8"
    :author "Lispbuilder Mailing List <lispbuilder@googlegroups.com>"
    :maintainer "Lispbuilder Mailing List <lispbuilder@googlegroups.com>"
    :licence "MIT"
    :depends-on (cffi lispbuilder-sdl-cffi)
    :components
    ((:module "base"
	      :components
	      ((:file "package")
               (:file "pixel")
	       (:file "util")
	       (:file "rectangle")
	       (:file "surfaces")
	       (:file "rwops")
	       (:file "sdl-util"))
	      :serial t)))
