{
	description = "KeyZox's neovim config";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = inputs@{ self, nixpkgs, flake-utils, ... }: let
		neovim-overlay = import ./nix/neovim-overlay.nix {inherit inputs;};
	in
		flake-utils.lib.eachDefaultSystem (system: let
			pkgs = import nixpkgs {
				inherit system;
				overlays = [
					neovim-overlay
				];
			};
			in {
				defaultPackage = pkgs.nvim-pkg;
				packages.nvim = pkgs.nvim-pkg;
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
				overlays.default = neovim-overlay;
			}
		);
}
