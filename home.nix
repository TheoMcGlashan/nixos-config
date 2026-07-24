{ pkgs, hostName, ... }:
{
	imports = [
		./imports/yazi.nix
		./imports/foot.nix
		./imports/fuzzel.nix
		./imports/mako.nix
		./imports/niri-home.nix
	];

	# Set basic information and enable home manager
	home.username = "thoe";
	home.homeDirectory = "/home/thoe";
	home.stateVersion = "26.05";
	programs.home-manager.enable = true;

	programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

	programs.fzf = {
		enable = true;
		enableZshIntegration = true;
	};

	programs.zoxide = {
		enable = true;
		enableZshIntegration = true;
		options = [ "--cmd cd" ];
	};

	programs.starship = {
		enable = true;
		settings = {
			add_newline = false;
		};
	};

	programs.firefox.enable = true;

	programs.neovim = {
		enable = true;
		defaultEditor = true;
	};

	programs.waybar = {
		enable = true;
		settings.mainBar = builtins.fromJSON (builtins.readFile ./waybar/config);
		style = builtins.readFile ./waybar/style.css;
	};

	home.sessionVariables = {
		TERMINAL = "foot";
	};
	
	home.packages = with pkgs; [
		qbittorrent
		protonvpn-gui
		proton-pass
		proton-authenticator
		lutris
		localsend
		psmisc
		pavucontrol
		tree-sitter
		biber
		xdotool
		brightnessctl
		libnotify
		swaybg
		swaylock
		swayidle
		blueman
		swayidle
		xwayland-satellite
		polkit_gnome
		vesktop
		spotify
		git
		ripgrep
		fd
		gcc
		texliveMedium
		zathura
		lua-language-server
		pyright
		rust-analyzer
		texlab
		ffmpegthumbnailer
		poppler-utils
		imagemagick
		jq
		ueberzugpp
	];


	# Set location for wallpaper.
	xdg.configFile."wallpaper/DiscoWallpaper.png".source = ./wallpaper/DiscoWallpaper.png;

	# Import neovim configuration from these files.
	xdg.configFile = {
		"nvim/init.lua".source              = ./nvim/init.lua;
		"nvim/lua/plugins.lua".source       = ./nvim/lua/plugins.lua;
		"nvim/lua/configs.lua".source       = ./nvim/lua/configs.lua;
		"nvim/lua/options.lua".source       = ./nvim/lua/options.lua;
		"nvim/lua/lsp.lua".source           = ./nvim/lua/lsp.lua;
		"nvim/lua/keybinds.lua".source      = ./nvim/lua/keybinds.lua;
		"nvim/lua/snippets/tex.lua".source  = ./nvim/lua/snippets/tex.lua;
	};

	# Make a desktop entry to launch steam with the right flags for niri.
	xdg.desktopEntries.steam = {
		name = "Steam";
		genericName = "Game Launcher";
		exec = "steam -system-composer %U";
		icon = "steam";
		terminal = false;
		categories = [ "Network" "FileTransfer" "Game" ];
	};
}
