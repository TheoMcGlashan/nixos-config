{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
	
  services.displayManager.ly.enable = true;
  services.displayManager.defaultSession = "niri";
}
