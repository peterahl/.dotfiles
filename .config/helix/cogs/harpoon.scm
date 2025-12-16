(require "helix/editor.scm")
(require "helix/misc.scm")
(require (prefix-in helix.static. "helix/static.scm"))
(require "helix/commands.scm")

(provide harpoon-add
         harpoon-remove
         harpoon-toggle
         harpoon-clear
         harpoon-list
         harpoon-quick-jump
         harpoon-jump-to-1
         harpoon-jump-to-2
         harpoon-jump-to-3
         harpoon-jump-to-4
         harpoon-jump-to-5
         harpoon-open-menu
         set-harpoon-file-location!
         get-harpooned-files) ;; Helper function for creating numbered keybindings

;; Helper function to create a range of numbers
(define (range n)
  (define (range-helper i acc)
    (if (= i n)
        (reverse acc)
        (range-helper (+ i 1) (cons i acc))))
  (range-helper 0 '()))

;; Configuration
(define MAX-HARPOON-COUNT 10)
(define HARPOON-FILE ".helix/harpoon-files.txt")

;; Helper function to set custom harpoon file location
(define (set-harpoon-file-location! path)
  (set! HARPOON-FILE path))

;; Read harpooned files from disk
(define (read-harpoon-files)
  (unless (path-exists? ".helix")
    (create-directory! ".helix"))

  (cond
    [(path-exists? HARPOON-FILE)
     (call-with-input-file HARPOON-FILE (lambda (f) (~> f read-port-to-string read!)))]
    [else '()]))

(define *harpooned-files* (read-harpoon-files))

;; Get harpooned files list
(define (get-harpooned-files)
  *harpooned-files*)

;; Write harpooned files to disk
(define (write-harpoon-files!)
  (ensure-helix-dir!)
  (call-with-output-file HARPOON-FILE (lambda (port) (write *harpooned-files* port))))

;; Get current file path
(define (get-current-file-path)
  (helix.static.cx->current-file))

;; Normalize file path to absolute path
(define (normalize-path path)
  (cond
    [(and (> (string-length path) 0) (equal? (substring path 0 1) "/")) path] ; Already absolute
    [else (let ([workspace (helix-find-workspace)]) (string-append workspace "/" path))]))

;; Check if file is already harpooned
(define (file-harpooned? filepath)
  (let ([normalized-path (normalize-path filepath)]) (member normalized-path *harpooned-files*)))

;; Add current file to harpoon list
(define (harpoon-add)
  (let ([current-file (get-current-file-path)])
    (if current-file
        (let ([normalized-path (normalize-path current-file)])
          (unless (file-harpooned? current-file)
            (set! *harpooned-files*
                  (take (cons normalized-path *harpooned-files*)
                        (min (length (cons normalized-path *harpooned-files*)) MAX-HARPOON-COUNT)))
            (write-harpoon-files!)
            (displayln (string-append "Harpooned: " current-file)))
          (displayln "No file to harpoon")))))

;; Remove current file from harpoon list
(define (harpoon-remove)
  (let ([current-file (get-current-file-path)])
    (if current-file
        (let ([normalized-path (normalize-path current-file)])
          (if (file-harpooned? current-file)
              (begin
                (set! *harpooned-files*
                      (filter (lambda (f) (not (equal? f normalized-path))) *harpooned-files*))
                (write-harpoon-files!)
                (displayln (string-append "Removed harpoon: " current-file))
                (displayln (string-append "File not harpooned: " current-file)))
              (displayln "No file to remove from harpoon")))))

  ;; Clear all harpooned files
  (define (harpoon-clear)
    (set! *harpooned-files* '())
    (write-harpoon-files!)
    (displayln "Cleared all harpooned files"))

  ;; Toggle current file in harpoon list
  (define (harpoon-toggle)
    (let ([current-file (get-current-file-path)])
      (if current-file
          (if (file-harpooned? current-file)
              (harpoon-remove)
              (harpoon-add))
          (displayln "No file to toggle harpoon")))))

;; Jump to specific harpoon index (1-based)
(define (harpoon-jump-to-index index)
  (let ([files *harpooned-files*])
    (cond
      [(null? files) (displayln "No harpooned files")]
      [(>= (- index 1) (length files))
       (displayln (string-append "Only " (number->string (length files)) " files harpooned"))]
      [else
       (let ([file-to-open (list-ref files (- index 1))])
         (if (path-exists? file-to-open)
             (open file-to-open)
             (begin
               ;; Remove non-existent file from harpoon list
               (set! *harpooned-files*
                     (filter (lambda (f) (not (equal? f file-to-open))) *harpooned-files*))
               (write-harpoon-files!)
               (displayln (string-append "File no longer exists, removed from harpoon: "
                                         file-to-open)))))])))

;; Quick jump functions for numbered access
(define (harpoon-jump-to-1)
  (harpoon-jump-to-index 1))
(define (harpoon-jump-to-2)
  (harpoon-jump-to-index 2))
(define (harpoon-jump-to-3)
  (harpoon-jump-to-index 3))
(define (harpoon-jump-to-4)
  (harpoon-jump-to-index 4))
(define (harpoon-jump-to-5)
  (harpoon-jump-to-index 5))

;; Generic quick jump with picker
(define (harpoon-quick-jump)
  (let ([files *harpooned-files*])
    (cond
      [(null? files) (displayln "No harpooned files")]
      [else (harpoon-list)])))

;; Show harpoon list using displayln for now (picker component not readily available)
(define (harpoon-list)
  (let ([files *harpooned-files*])
    (cond
      [(null? files) (displayln "No harpooned files")]
      [else
       ;; Filter existing files and update list
       (let ([existing-files (filter path-exists? files)])
         ;; Update the list if some files were removed
         (when (not (= (length existing-files) (length files)))
           (set! *harpooned-files* existing-files)
           (write-harpoon-files!))

         (if (null? existing-files)
             (displayln "No existing harpooned files")
             (begin
               (displayln "Harpooned files:")
               (map (lambda (file i) (displayln (string-append (number->string (+ i 1)) ": " file)))
                    existing-files
                    (range (length existing-files))))))])))

;; Open harpoon menu (interactive management)
(define (harpoon-open-menu)
  (harpoon-list))

;; Initialize harpoon system - read files at startup
(define (harpoon-init)
  (set! *harpooned-files* (read-harpoon-files)))

;; Auto-initialize when module is loaded
(harpoon-init)
