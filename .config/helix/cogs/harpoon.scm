(require "helix/editor.scm")
(require "helix/misc.scm")

(provide !)

(define harpoon-file (lambda ()
  (let ((root (or (project-root) (current-directory))))
    (path-join root ".helix" "harpoon.txt"))))

(define ensure-harpoon-dir (lambda ()
  (let ((harpoon-path (harpoon-file)))
    (let ((dir (path-dirname harpoon-path)))
      (unless (directory-exists? dir)
        (create-directory dir))))))

(define read-harpoon-list (lambda ()
  (let ((path (harpoon-file)))
    (ensure-harpoon-dir)  ; Ensure directory exists before reading
    (if (file-exists? path)
        (with-input-from-file path
          (lambda ()
            (let loop ((lines '()))
              (let ((line (read-line)))
                (if (eof-object? line)
                    (reverse lines)
                    (loop (cons line lines))))))))
        '()))) ; Return empty list if file doesn't exist

(define write-harpoon-list (lambda (file-list)
  (let ((path (harpoon-file)))
    (ensure-harpoon-dir)
    (with-output-to-file path
      (lambda ()
        (for-each
         (lambda (file-path)
           (display file-path)
           (newline))
         file-list))))))

(define mark-current-file (lambda ()
  (let* ((current-path (file-path))
         (harpoon-list (read-harpoon-list))
         (existing-index (list-index current-path harpoon-list equal?)))
    (if existing-index
        (message "File already marked.")
        (begin
          (write-harpoon-list (cons current-path harpoon-list))
          (message "File marked."))))))

(define edit-harpoon-file (lambda ()
  (let ((path (harpoon-file)))
    (ensure-harpoon-dir) ; Ensure the directory exists.
    (edit path)))) ; Use Helix's built-in edit

(define pick-from-harpoon (lambda ()
  (let ((harpoon-list (read-harpoon-list)))
    (if (null? harpoon-list)
        (message "No files marked in Harpoon.")
        (picker harpoon-list
                (lambda (picked-path)
                  (if picked-path
                      (edit picked-path)
                      (message "Harpoon pick cancelled."))))))))

(define register-cog (lambda ()
  (register-command "harpoon-mark" mark-current-file)
  (register-command "harpoon-edit" edit-harpoon-file)
  (register-command "harpoon-pick" pick-from-harpoon)
  (register-keymap "normal"
                   '((key "space m" command "harpoon-mark" description "Harpoon: Mark File")
                     (key "space e" command "harpoon-edit" description "Harpoon: Edit Harpoon File")
                     (key "space p" command "harpoon-pick" description "Harpoon: Pick from Harpoon")))))

(register-cog)
