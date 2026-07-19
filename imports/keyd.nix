{ pkgs, ... };
{
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
}
