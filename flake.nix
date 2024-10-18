{
	description = "KeyZox's neovim config";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = { nixpkgs, flake-utils, ... }: flake-utils.lib.eachDefaultSystem (system:
		let 
			pkgs = nixpkgs.legacyPackages.${system};
		in
		{
			devShells = ( {
				default = pkgs.mkShell.override
				{}
				{
					packages = with pkgs; [
						nil
						lua-language-server
					];
				};
			});
		}
	);
}
