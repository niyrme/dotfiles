{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Grub
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
  };

  # Networking
  networking = {
    hostName = "niyooomBox";
    useDHCP = false;
    # NOTE: add interface name/id here
    interfaces.<INTERFACE>.useDHCP = true;
  };

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "de";
  };

  services = {
    openssh.enable = true;

    # X11
    xserver = {
      enable = true;
      layout = "de";

      # Login
      displayManager = {
        # Use lightdm to log in
        lightdm.enable = true;
        # Set i3 as default session
        defaultSession = "none+i3";
      };

      # Desktop
      desktopManager = {
        plasma5.enable = true;
      };

      # Window Manager
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3status
          i3lock
        ];
      };
    };
  };

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Users
  users.users.niyrme = {
    isNormalUser = true;
    # Allow sudo
    extraGroups = [ "wheel" ];
    createHome = true;
    # Default shell
    shell = pkgs.fish;
    packages = with pkgs; [
      # Programming Tools
      git
      lazygit
      gcc

      # Programming Languages
      go
      python39
      crystal

      # IDEs/Text Editors
      jetbrains.pycharm-community
      vscode

      discord
      spotify
      thunderbird
      authy
    ];
  };

  # Allow unfree (e.g. for spotify)
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    nano
    vim
    wget

    fira-code
    fira-code-symbols

    firefox
    notepadqq
  ];

  programs = {
    mtr.enable = true;

    # Add gnupg for GPG/PGP key signing
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    fish.enable = true;
  };

  system.stateVersion = "21.05";
}
