{ pkgs, ... }:
{
	# Import niri config files, combining files depending on host
	xdg.configFile."niri/config.kdl".text =
	  builtins.readFile ./niri/config-common.kdl
	  + "\n"
	  + builtins.readFile (
	      if hostName == "laptop"
	      then ./niri/config-laptop.kdl
	      else ./niri/config-desktop.kdl
	    );
}
