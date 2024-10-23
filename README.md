# My nixxed neovim config :snowflake:

## Installation

### Via Nix

#### You can install via nix profile
```bash
nix profile install github:keyzox71/nvim 
```

#### Or with an overlay via the flake

*Add the input to your flake*
```nix
keyznvim.url = "github:keyzox71/nvim";
```
*And add the overlay to your nixpkgs*
```nix
nixpkgs.overlays = [
	inputs.keyznvim.overlays.default
];
```
*And finally add the package to your home or nixos package*
```
nixpkgs.keyznvim
```
#### Or you can just run the flake

```bash
nix run github:keyzox71/nvim
```

### Standalone installation

Just clone the repo into the nvim config
```bash
git clone https://github.com/keyzox71/nvim ~/.config/nvim
```

## Liscence and credit

For nixxing [kickstart-nix.nvim](https://github.com/nix-community/kickstart-nix.nvim) was used and modified to fit my need\
Base config [bonsthie.nvim](https://github.com/bonsthie/nvim) early version but heavily modified to fit my need
