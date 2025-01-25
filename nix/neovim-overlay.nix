{ inputs }:
final: prev:
with final.pkgs.lib;
let
  pkgs = final;

  pkgs-wrapNeovim = inputs.nixpkgs.legacyPackages.${pkgs.system};

  mkNeovim = pkgs.callPackage ./mkNeovim.nix { inherit pkgs-wrapNeovim; };

  all-plugins = with pkgs.vimPlugins; [ ];

  extraPackages = with pkgs; [
    # language servers
    lua-language-server # Lua LSP
    nixd # nix LSP
    clang-tools # C/C++ LSP

    # formatting
    nixfmt-rfc-style # nix formatting

    # other tools
    ripgrep # For greping in all files
    bear # bear
  ];
in
{
  keyznvim = mkNeovim {
    plugins = all-plugins;
    inherit extraPackages;
  };
}
