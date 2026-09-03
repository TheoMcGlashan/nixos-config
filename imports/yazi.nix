{ pkgs, ... }:
{
	programs.yazi = {
		enable = true;
		enableZshIntegration = true;

		settings = {
			opener = {
				pdf-viewer = [
					{
						run = ''zathura "$@"'';
						desc = "Open with Zathura";
						block = true;
						for = "unix"
					}
				];
			};

			open = {
				rules = [
					{
						mime = "application/pdf";
						use = [ "pdf-viewer" "reveal" ];
					}
				];
			};

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
}
