{ pkgs, ... }:
{
	programs.niri.enable = true;

	security.polkit.enable = true;

	hardware.graphics.enable = true;

	fonts.packages = with pkgs; [
		noto-fonts
		noto-fonts-color-emoji
		font-awesome
		nerd-fonts.jetbrains-mono
	];

  # Ensure Vesktop has the necessary permissions and configurations
  programs.niri.extraConfig = ''
    [Network]
    AllowLocalhost=true
    AllowLAN=true
    AllowWAN=true
  '';
}
