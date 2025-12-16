(require-builtin helix/core/buffers as helix.buffers.)
(require-builtin helix/core/commands as helix.commands.)

(provide conjure-connect
         conjure-send-code
         conjure-open-log
         conjure-close-log)

(define *nrepl-host* "localhost")
(define *nrepl-port* 7888)
(define *log-buffer* #f)

;; Connect to nREPL server
(define (conjure-connect host port)
  (set! *nrepl-host* host)
  (set! *nrepl-port* port)
  (displayln (string-append "Connected to nREPL at " host ":" (number->string port))))

;; Send code to nREPL and log result
(define (conjure-send-code code)
  (if *log-buffer*
      (begin
        (helix.buffers.append-to-buffer *log-buffer* (string-append "Sent: " code "\n"))
        ;; Simulate sending to nREPL (in a real implementation, use networking)
        (let ((result (simulate-nrepl-eval code)))
          (helix.buffers.append-to-buffer *log-buffer* (string-append "Result: " result "\n"))))
      (displayln "Log buffer not open. Use :conjure-open-log first.")))

;; Open log buffer
(define (conjure-open-log)
  (set! *log-buffer* (helix.buffers.create-buffer "conjure-log" "text"))
  (helix.buffers.append-to-buffer *log-buffer* "Conjure log started.\n"))

;; Close log buffer
(define (conjure-close-log)
  (if *log-buffer*
      (begin
        (helix.buffers.close-buffer *log-buffer*)
        (set! *log-buffer* #f))
      (displayln "No log buffer open.")))

;; Simulate nREPL evaluation (placeholder)
(define (simulate-nrepl-eval code)
  ;; In a real implementation, this would send code to nREPL and get response
  (string-append "Evaluated: " code))

;; Register commands
(helix.commands.register-command "conjure-connect" conjure-connect)
(helix.commands.register-command "conjure-send-code" conjure-send-code)
(helix.commands.register-command "conjure-open-log" conjure-open-log)
(helix.commands.register-command "conjure-close-log" conjure-close-log)