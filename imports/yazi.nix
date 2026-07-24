{ pkgs, ... }:
{
	# enable yazi and configure some basic settings
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

	# Create desktop entry to launch yazi inside foot.
	xdg.desktopEntries.yazi = {
    name = "Yazi";
    genericName = "File Manager";
    exec = "foot -e yazi %f";
    icon = "yazi";
    terminal = false;  # false because we're already wrapping in foot ourselves
    categories = [ "System" "FileManager" ];
    mimeType = [ "inode/directory" ];
  };

	# Register yazi as default file manager.
	xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "yazi.desktop" ];
      "x-scheme-handler/file" = [ "yazi.desktop" ];
    };
  };
}
