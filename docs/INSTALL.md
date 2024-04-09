#### How to install?

My entire [home-manager](https://github.com/nix-community/home-manager) configuration can be installed on any machine running Nix. At least
that's what I think. Assuming you're already using flakes, below are the commands to install it:

```nix
bash -i
export NIXPKGS_ALLOW_UNFREE=1
NIX_CONFIG="experimental-features = nix-command flakes"
nix shell nixpkgs#home-manager nixpkgs#git
nix run home-manager/master -- init --switch
home-manager switch --impure --flake .
```

None of this was tested.
