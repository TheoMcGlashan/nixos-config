{ pkgs, ... }:
{
  networking.hostName = "desktop";

  hardware.graphics.enable32Bit = true;

	# Enable ollama for local llms.
	services.ollama = {
		enable = true;
		package = pkgs.ollama-rocm;
	};
}
