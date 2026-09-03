{ pkgs, ... }:
{
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
}
