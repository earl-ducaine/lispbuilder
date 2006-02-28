%insert("lisphead") 
%{
;;;; SDL CFFI lisp wrapper
;;;; Part of the CL-Gardeners project
;;;; http://wiki.alu.org/Application_Builder
;;;; (C)2006 Justin Heyes-Jones
;;;; See COPYING for license

(in-package :sdl)

;;;; the SDL_Event is a union which doesn't work yet with swig
;;;; todo need some way to handle this better
(defcstruct SDL_Event
	(type :unsigned-char)	
	(pada :int)	
	(padb :int)	
	(padc :int)	
	(padd :int)	
	(pade :int)	
	(padf :int)	
	(padg :int))

;;;; This is to handle a C macro where 1 is shifted left n times
(defun 1<<(x) (ash 1 x))

;;;; Macro to handle defenum (thanks to Frank Buss for this SWIG/CFFI feature
; this handles anonymous enum types differently

(defmacro defenum (&body enums)	
 `(progn ,@(loop for value in enums
                 for index = 0 then (1+ index)
                 when (listp value) do (setf index (second value)
                                             value (first value))
                 collect `(defconstant ,value ,index))))


%}

%module sdl
%{

%include "begin_code.h"
%include "SDL_types.h"
%include "SDL.h"
%include "SDL_video.h"
%include "SDL_events.h"

// function args of type void become pointer  (note this does not work yet)
%typemap(cin) void* ":pointer";


%}

%include "begin_code.h"
%include "SDL_types.h"
%include "SDL.h"
%include "SDL_video.h"
%include "SDL_events.h"





 