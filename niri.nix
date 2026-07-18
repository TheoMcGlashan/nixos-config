{ pkgs, ... }:
{
	programs.niri.enable = true;

	services.greetd = {
		enable = true;
		settings = {
			default_session = {
				command = "${pkgs.niri}/bin/niri-session";
				user = "thoe";
			};
		};
	};

	security.polkit.enable = true;

	hardware.graphics.enable = true;

	fonts.packages = with pkgs; [
		noto-fonts
		noto-fonts-color-emoji
		font-awesome
		nerd-fonts.jetbrains-mono
	];
}
