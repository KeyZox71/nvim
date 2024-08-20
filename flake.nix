{
  description = "My neovim config as a flake !";

  outputs = _: {
    nvimzox = {
		xdg.configFile.neovim.source = ./;
	};
  };
}
