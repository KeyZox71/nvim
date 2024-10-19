{inputs}: final: prev:
with final.pkgs.lib; let
  pkgs = final;

 pkgs-wrapNeovim = inputs.nixpkgs.legacyPackages.${pkgs.system};

  mkNeovim = pkgs.callPackage ./mkNeovim.nix { inherit pkgs-wrapNeovim; };

  all-plugins = with pkgs.vimPlugins; [
  ];

  extraPackages = with pkgs; [
    # language servers
    lua-language-server # Lua LSP
    nil # nix LSP
	clang-tools # C/C++ LSP

	# other tools
	ripgrep # For greping in all files
	bear # bear
  ];
in {
  nvim-pkg = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };
}
