#|------------------------------------------------------------*-Scheme-*--|
 | File:    sshell
 |
 |          Copyright (C)2016 evilbinary <rootdebug@163.com>
 |
 | File version:     1.2
 | File mod date:    2016-04-30
 | System build:     v0.7.3.4-b7u, 2007-04-30
 |
 `------------------------------------------------------------------------|#

,(use repl editinp)

(define *top-level* #f)
(define-thread-var *eval-loop* #f)

(define *my-output-port* #f)
(define *my-input-port* #f)
(define *my-error-port* #f)
(define *my-prefix* "")
(define (top-init)
	;(set! *my-output-port* (open-output-append-file "foo") )
	(set! *my-output-port* 	(open-output-string) )
	;(set! *my-output-port* (current-input-port) )
	(set! *my-input-port* (current-input-port) )
	(set! *my-error-port* (current-error-port) )
	;(set! *my-error-port* (open-output-append-file "error.log") )
)

(define (my-condition-handler c next-h)
  (with-edit-port
  	*my-input-port*
  	*my-output-port*
     *my-error-port*
    (lambda ()
      (format #t "********** error detected **********\n~a\n" c)
      (format #t "************************************\n")
      (format #t "************ Continuation backtrace:\n")
      (with-module repl
      	(ccbt)
      	)
      )
      ;(next-h)
    )
  (*eval-loop* (get-output-string *my-output-port*) )
)
(define call/cc call-with-current-continuation )

(define (my-eval str)
	(call/cc (lambda(e)
	(set! *eval-loop* e)	
	(set! *my-output-port* 	(open-output-string) )
	 (with-edit-port
		 *my-input-port*
		 *my-output-port*
		 *my-error-port*
	  	(lambda () 
	  		(handler-bind (<condition> my-condition-handler)

	  		 ;(eval (with-input-from-string str read) *top-level*)
	  		 ;(eval-string  str *top-level* )
	  		 ;(eval-print (with-input-from-string str read) *top-level*)
	  		 (with-objects-from-port
			   (open-input-string str)
			   (lambda (o)
			     (eval-print o *top-level*)))
			)
		)
	)

	(let ((ret (get-output-string *my-output-port*)))
		(close-output-port *my-output-port*)
		ret
	)
	)
	)
	
)

(define (display-values v)
  (let ((line-len (current-display-limit)))
    (if (and (pair? v) (null? (cdr v)))
	(let ((p (current-output-port)))
	  (write-string p *my-prefix* )
          (call-with-markup p 
                            '(repl-value)
                            (lambda ()
                              (display (object->bounded-string 
                                        (if line-len 
                                            (+ line-len 3) 
                                            #f) 
                                        (car v))
                                       p)))
	  (newline p))
	(let loop ((i 0) (v v))
	  (if (not (null? v))
              (let ((p (current-output-port)))
		(format p *my-prefix* i)
                (call-with-markup p 
                                  (list 'repl-value i)
                                  (lambda ()
                                    (display 
                                     (object->bounded-string line-len 
                                                             (car v))
                                     p)))
		(newline p)
		(loop (add1 i) (cdr v))))))))




(define (main args)
  (set! *top-level* (make-user-initial))
  (top-init)
  my-eval)

(restart-with "sys.img" main)