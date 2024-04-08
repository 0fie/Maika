#### How to install?

My entire [home-manager](https://github.com/nix-community/home-manager) configuration can be installed on any machine running Nix. At least
that's what I think. Assuming you're already using flakes, below are the commands to install it:

<!--
TODO: After allowing unfree software, experimental features should be enabled too.
      See if the last line can be modified to run using a link to the Maika repo instead of a local path.
-->

```nix
bash -i
export NIXPKGS_ALLOW_UNFREE=1
nix shell nixpkgs#home-manager nixpkgs#git
nix run home-manager/master -- init --switch
home-manager switch --impure --flake /home/me/Projects/Maika
```
