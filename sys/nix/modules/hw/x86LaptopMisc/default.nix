# x86LaptopMisc/default.nix
#
{
  services = {
    pulseaudio.enable = false;
    upower = {
      enable = true;
      criticalPowerAction = "HybridSleep"; # one of "PowerOff", "Hibernate", "HybridSleep"
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
    libinput.enable = true; # Touchpad support
    printing.enable = true; # Enable CUPS to print documents
    joycond.enable = true;
  };
  security.rtkit.enable = true;
}
