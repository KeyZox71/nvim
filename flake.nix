{
	description = "KeyZox's neovim config";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = inputs@{ self, nixpkgs, flake-utils, ... }: let
		supportedSystems = [
			"x86_64-linux"
			"aarch64-linux"
			"x86_64-darwin"
			"aarch64-darwin"
		];
		neovim-overlay = import ./nix/neovim-overlay.nix {inherit inputs;};
	in
		flake-utils.lib.eachSystem supportedSystems (system: let
			pkgs = import nixpkgs {
				inherit system;
				overlays = [
					neovim-overlay
				];
			};
			in {
				packages = rec {
					default = nvim;
					nvim = pkgs.nvim-pkg;
				};
				devShells = ({
					default = pkgs.mkShell.override
					{}
					{
						packages = with pkgs; [
							nil
							lua-language-server
							nvim-pkg
						];
					};
				});
		})
		// {
			# You can add this overlay to your NixOS configuration
			overlays.default = neovim-overlay;
		};
}
