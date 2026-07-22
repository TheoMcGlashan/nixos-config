{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
	
	services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.displayManager.defaultSession = "niri";
}
