{ pkgs, ... }:
{
	# Configure keyd system-wide to remap keys
	services.keyd = {
		enable = true;
		keyboards.default = {
			ids = [ "*" ];
			settings = {
				main = {
					capslock 	= "overload(control, esc)";
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
