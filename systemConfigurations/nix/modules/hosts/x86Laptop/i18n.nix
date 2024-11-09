

# x86Laptop/i18n.nix

{
  time.timeZone = "Asia/Tokyo";
  console.useXkbConfig = true;  # Use xkb config in console
  services = {
    xserver.xkb = {
      layout = "jp";
      variant = "";
      options = "ctrl:swapcaps";   # Swap control and capslock in X11 (seems not to be usable in wayland?)
    };
  };
  i18n = {
    defaultLocale = "C.UTF-8";    # DON'T SET TO ANYTHING other than C or en_XX for the characters probably NOT showing correctly in consle!!!
    extraLocaleSettings = {
      LC_NAME = "ja_JP.UTF-8";
      LC_TIME = "ja_JP.UTF-8";
      LC_PAPER = "ja_JP.UTF-8";
      LC_NUMERIC = "ja_JP.UTF-8";
      LC_ADDRESS = "ja_JP.UTF-8";
      LC_MONETARY = "ja_JP.UTF-8";
      LC_TELEPHONE = "ja_JP.UTF-8";
      LC_MEASUREMENT = "ja_JP.UTF-8";
      LC_IDENTIFICATION = "ja_JP.UTF-8";
    };
  };
}
