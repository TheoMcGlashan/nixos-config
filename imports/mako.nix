{ pkgs, ... }:
{
	services.mako = {
    enable = true;
    settings = {
      font = "JetBrainsMono Nerd Font 10";
      background-color = "#1a1b26e6";
      text-color = "#c0caf5";
      border-color = "#bb9af7";
      border-size = 2;
      border-radius = 6;
      width = 300;
      height = 110;
      margin = "10";
      padding = "10";
      default-timeout = 5000;
      layer = "overlay";
      anchor = "top-right";

      "urgency=high" = {
        border-color = "#f7768e";
        default-timeout = 0;
      };
    };
  };
}
