{
  description = "My Neovim config as a flake!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux"; # Replace with your system architecture if different
      pkgs = import nixpkgs { inherit system; };
    in
    {
      # Define the overlay for custom modules
      overlays = [
        (final: prev: {
          myNeovimModule = { config, lib, ... }: with lib; {
            options.programs.neovim.nvimzox.enable = mkOption {
              type = types.bool;
              default = false;
              description = "Enable the nvimzox configuration for Neovim.";
            };

            config = mkIf config.programs.neovim.nvimzox.enable {
              programs.neovim.enable = true;

              home.file.".config/nvim/init.lua".source = ./init.lua;
              home.file.".config/nvim/lua".source = ./lua;
            };
          };
        })
      ];
    };
}
