{ pkgs, ... }:
{
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

	programs.yazi = {
		enable = true;
		enableZshIntegration = true;

		settings = {
			mgr = {
				ration = [ 1 3 4 ];
				sort_by = "alphabetical";
				sort_dir_first = true;
				show_hidden = false;
			};

			preview = {
				max_width = 1000;
				max_height = 1000;
			};
		};

		keymap = {
			mgr.prepend_keymap = [
				{
					on = [ "g" "h" ];
					run = "cd ~";
					desc = "Go home";
				}
			];
		};
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

	programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=9";
        dpi-aware = "yes";
      };

      colors-dark = {
        background = "1a1b26";
        foreground = "c0caf5";

        # normal palette
        regular0 = "15161e"; # black
        regular1 = "f7768e"; # red
        regular2 = "9ece6a"; # green
        regular3 = "e0af68"; # yellow
        regular4 = "7aa2f7"; # blue
        regular5 = "bb9af7"; # magenta
        regular6 = "73daca"; # cyan
        regular7 = "a9b1d6"; # white

        # bright palette
        bright0 = "414868";
        bright1 = "f7768e";
        bright2 = "9ece6a";
        bright3 = "e0af68";
        bright4 = "7aa2f7";
        bright5 = "bb9af7";
        bright6 = "73daca";
        bright7 = "c0caf5";
      };

      cursor = {
        style = "beam";
        blink = "yes";
      };
    };
  };
	
	programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=12";
        terminal = "foot";
        layer = "overlay";
        width = 40;
        lines = 10;
      };

      colors = {
        background = "1a1b26e6";
        text = "c0caf5ff";
        match = "bb9af7ff";
        selection = "414868ff";
        selection-text = "c0caf5ff";
        border = "bb9af7ff";
      };

      border = {
        width = 2;
        radius = 8;
      };
    };
  };

	programs.firefox.enable = true;

	services.mako = {
    enable = true;
    settings = {
      font = "JetBrainsMono Nerd Font 10";
      background-color = "#1a1b26e6";
      text-color = "#c0caf5";
      border-color = "#bb9af7";
      border-size = 2;
      border-radius = 6;
      width = 300;
      height = 110;
      margin = "10";
      padding = "10";
      default-timeout = 5000;
      layer = "overlay";
      anchor = "top-right";

      "urgency=high" = {
        border-color = "#f7768e";
        default-timeout = 0;
      };
    };
  };

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
		pavucontrol
		brightnessctl
		libnotify
		swaybg
		blueman

		git
		ripgrep
		fd
		gcc

		lua-language-server
		pyright
		rust-analyzer
		texlab

		texliveMedium
		zathura

		ffmpegthumbnailer
		poppler-utils
		imagemagick
		jq
		ueberzugpp
	];

	xdg.configFile."niri/config.kdl".source = ./niri-config.kdl;
	xdg.configFile."wallpaper/DiscoWallpaper.png".source = ./wallpaper/DiscoWallpaper.png;
	xdg.configFile = {
		"nvim/init.lua".source              = ./nvim/init.lua;
		"nvim/lua/plugins.lua".source       = ./nvim/lua/plugins.lua;
		"nvim/lua/configs.lua".source       = ./nvim/lua/configs.lua;
		"nvim/lua/options.lua".source       = ./nvim/lua/options.lua;
		"nvim/lua/lsp.lua".source           = ./nvim/lua/lsp.lua;
		"nvim/lua/keybinds.lua".source      = ./nvim/lua/keybinds.lua;
		"nvim/lua/snippets/tex.lua".source  = ./nvim/lua/snippets/tex.lua;
	};
}
