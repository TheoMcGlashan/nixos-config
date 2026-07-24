{ config, pkgs, ... }:
{
  imports =
    [
      ./imports/niri-system.nix
      ./imports/keyd.nix
			./imports/xfce.nix
    ];

  # Define a user account.
  users.users."thoe" = {
    isNormalUser = true;
    description = "Theo McGlashan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

	# Define the keyboard layout.
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

	# Set timezone and locales
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

	# Bluetooth support, GUI and applet.
	services.blueman.enable = true;
	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	};

	# Services for printing support.
	services.printing.enable = true;
	services.avahi = {
		enable = true;
		nssmdns4 = true;
	};

	# Allow firmware updates.
	services.fwupd.enable = true;

	# Enable wifi through network manager.
  networking.networkmanager.enable = true;

	# Enable localsend to share files
	networking.firewall.allowedTCPPorts = [ 53317 ];
	networking.firewall.allowedUDPPorts = [ 53317 ];

	# Enable zsh and make it default
	programs.zsh.enable = true;
	users.users.thoe.shell = pkgs.zsh;

	# Enable steam, with necessary configurations.
	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = false;
	};
	programs.gamescope = {
		enable = true;
		enableWsi = true;
	};
	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};

	# Enable flakes, and some flake commands, like update
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Automatically remove old generations.
	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 30d";
	};
	# Optimize stored system versions
	nix.optimise.automatic = true;
	nix.optimise.dates = [ "weekly" ];
	# Cap the number of generations shown in bootloader to 10.
  boot.loader.systemd-boot = {
		enable = true;
		configurationLimit = 10;
	};
  boot.loader.efi.canTouchEfiVariables = true;

	# Nixos system version. Don't mess with this.
  system.stateVersion = "26.05";
}
