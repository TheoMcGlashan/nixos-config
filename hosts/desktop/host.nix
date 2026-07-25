{ pkgs, ... }:
{
  networking.hostName = "desktop";

  hardware.graphics.enable32Bit = true;

  services.protonvpn = {
    enable = true;
    username = "your-protonvpn-username";
    passwordFile = "/etc/protonvpn/password";
  };

  environment.systemPackages = with pkgs; [
    vdesktop
    protonvpn-cli
  ];

  systemd.services.vdesktop = {
    enable = true;
    description = "Vesktop Service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.vdesktop}/bin/vdesktop";
      Restart = "always";
    };
  };

  networking.networkmanager.unmanagedDevices = [ "eth0" ]; # Adjust the device name as necessary
}
