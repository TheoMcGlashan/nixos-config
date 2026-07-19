{ pkgs, ... }:
{
	programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=12";
        terminal = "foot";
        layer = "overlay";
        width = 40;
        lines = 10;
      };

      colors = {
        background = "1a1b26e6";
        text = "c0caf5ff";
        match = "bb9af7ff";
        selection = "414868ff";
        selection-text = "c0caf5ff";
        border = "bb9af7ff";
      };

      border = {
        width = 2;
        radius = 8;
      };
    };
  };
}
