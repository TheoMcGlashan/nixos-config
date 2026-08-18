{ configs, pkgs, ... }:
{
  networking.hostName = "desktop";

  hardware.graphics.enable32Bit = true;

	fileSystems."/disk2" = {
		device = "/dev/disk/by-uuid/4b0f208f-901c-47c1-b3eb-ae1920b28748";
		fsType = "ext4";
		options = [ "defaults" "noatime" ];
	};

	# Enable ollama for local llms.
	services.ollama = {
		enable = true;
		package = pkgs.ollama-rocm;
	};
}
