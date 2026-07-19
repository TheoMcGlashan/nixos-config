{ pkgs, ... }:
{
  networking.hostName = "laptop";

  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 80;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    };
  };
  services.power-profiles-daemon.enable = false;

  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "suspend";
  };
}
