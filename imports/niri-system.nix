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
}
