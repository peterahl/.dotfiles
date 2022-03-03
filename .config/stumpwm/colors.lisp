

(setf *colors*
      '("#ffffff"                       ; ^0 ; White
        "#131220"                       ; ^1 ; Dark Blue
        "#f72f33"                       ; ^2 ; Red
        "#689d6a"                       ; ^3 ; Light Green
        "#62bfef"                       ; ^4 ; Light Blue
        "#fabd2f"))      ; ^5 ; Yellow / Help map keys

(defparameter *mode-line-bg-color* (nth 1 *colors*))
(defparameter *mode-line-fg-color* (nth 0 *colors*))
(defparameter *msg-bg-color* (nth 1 *colors*))
(defparameter *msg-fg-color* (nth 0 *colors*))
(defparameter *msg-border-color* (nth 2 *colors*))
