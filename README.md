To-DO
- Setup impermanace to achieve a perfectly reproducible system.
- Implement an options.nix file for others to easily install the dotfiles.

>> Improve
- /home/firefox.nix
    * userChrome.css should be fetched from [0fie/trash](github.com/0fie/trash)
    * Declare bookmarks
    * Declare settings

- /home/waybar.nix
    * should not be compiled manually during initial installation or updates.

- /system/hardware.nix
    * create tmpfs on /tmp for faster rebuilds

>> Configure
- Waybar 
- SDDM
- Plymouth
