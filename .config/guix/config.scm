;; Import nonfree linux module.

(use-modules (gnu)
             (gnu system nss)
             (gnu packages linux)
             (gnu services docker)
             (nongnu packages linux)
             (nongnu system linux-initrd))

(use-service-modules desktop
                     networking
                     ssh
                     docker
                     xorg)

(operating-system
 (kernel linux)
 (initrd microcode-initrd)
 (firmware (list linux-firmware))
 (locale "en_US.utf8")
 (timezone "Europe/Stockholm")
 (keyboard-layout (keyboard-layout "us,se" "dvorak,svdvorak"
                                   #:options '("ctrl:nocaps" "grp:win_space_toggle")))
 (host-name "t14s")

 (groups (append (list (user-group (name "nixbld")))
                 %base-groups))

 (users (cons* (user-account
                (name "peter")
                (comment "Peter Lejon")
                (group "users")
                (home-directory "/home/peter")
                (supplementary-groups
                 '("wheel"
                   "netdev"
                   "docker"
                   "audio"
                   "video")))
               %base-user-accounts))

 (packages (append (map specification->package
                        '("gnome"
                          "gcc-toolchain"
                          "dunst"
                          "zlib"
                          "fuse"
                          "nix"
                          "stumpwm-with-slynk"
                          "sbcl"
                          "sbcl-stumpwm-swm-gaps"
                          "sbcl-slime-swank"
                          "flatpak"
                          "nss-certs"))
                   %base-packages))

 (services (cons* (set-xorg-configuration
                   (xorg-configuration
                    (keyboard-layout keyboard-layout)))
                  (service docker-service-type)
                  %desktop-services))

 (bootloader
  (bootloader-configuration
   (bootloader grub-efi-bootloader)
   (target "/boot/efi")
   (keyboard-layout keyboard-layout)))

 (mapped-devices
  (list (mapped-device
         (source
          (uuid "c7cceff5-6a32-40a3-bf86-2907ae86f30a"))
         (target "my-root")
         (type luks-device-mapping))))

 (file-systems
  (cons* (file-system
          (mount-point "/boot/efi")
          (device (uuid "BA22-979F" 'fat32))
          (type "vfat"))
         (file-system
          (mount-point "/")
          (device (file-system-label "my-root"))
          (type "ext4")
          (dependencies mapped-devices))
         %base-file-systems))

 (swap-devices (list "/mnt/swapfile")))
