{ pkgs, hostName, ... }:
{
	programs.foot = {
    enable = true;
    settings = {
      main = {
        font = if hostName == "laptop"
					then "JetBrainsMono Nerd Font:size=9"
					else "JetBrainsMono Nerd Font:size=14";
        dpi-aware = "yes";
      };

      colors-dark = {
        background = "1a1b26";
        foreground = "c0caf5";

        # normal palette
        regular0 = "15161e"; # black
        regular1 = "f7768e"; # red
        regular2 = "9ece6a"; # green
        regular3 = "e0af68"; # yellow
        regular4 = "7aa2f7"; # blue
        regular5 = "bb9af7"; # magenta
        regular6 = "73daca"; # cyan
        regular7 = "a9b1d6"; # white

        # bright palette
        bright0 = "414868";
        bright1 = "f7768e";
        bright2 = "9ece6a";
        bright3 = "e0af68";
        bright4 = "7aa2f7";
        bright5 = "bb9af7";
        bright6 = "73daca";
        bright7 = "c0caf5";
      };

      cursor = {
        style = "beam";
        blink = "yes";
      };
    };
  };
}
