{ config, pkgs, ... }:
{
  imports =
    [
      ./hosts/laptop/hardware-configuration.nix
      ./niri.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot = {
		enable = true;
		configurationLimit = 10;
	};
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

	hardware.bluetooth = {
		enable = true;
		powerOnBoot = true;
	};

	services.blueman.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

	# Configure keyd system-wide to remap keys
	services.keyd = {
		enable = true;
		keyboards.default = {
			ids = [ "*" ];
			settings = {
				main = {
					shift 		= "oneshot(shift)";
					meta 			= "oneshot(meta)";
					control 	= "oneshot(control)";

					leftalt 	= "oneshot(alt)";
					rightalt 	= "oneshot(altgr)";

					capslock 	= "overload(control, esc)";
					esc				= "capslock";
					insert		= "S-insert";
				};
				alt = {
					h = "left";
					k = "up";
					j = "down";
					l = "right";
				};
			};
		};
	};

	services.tlp.enable = true;
	services.printing.enable = true;
	services.avahi = {
		enable = true;
		nssmdns4 = true;
	};
	services.fwupd.enable = true;

	services.power-profiles-daemon.enable = false;

	services.logind.settings.Login = {
		HandleLidSwitch = "suspend";
		HandleLidSwitchExternalPower = "suspend";
	};

  # Define a user account.
  users.users."thoe" = {
    isNormalUser = true;
    description = "Theo McGlashan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

	# Keep vim around system-wide, just in case
  environment.systemPackages = with pkgs; [
    vim
	];

	# Enable zsh and make it default
	programs.zsh.enable = true;
	users.users.thoe.shell = pkgs.zsh;

	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = false;
	};

	hardware.graphics = {
		enable = true;
		enable32Bit = true;
	};

	# Enable flakes, and some flake commands, like update
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Automatically remove old system versions
	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 30d";
	};
	# Optimize stored system versions
	nix.optimise.automatic = true;
	nix.optimise.dates = [ "weekly" ];

	# Nixos system version. Don't mess with this.
  system.stateVersion = "26.05";
}
