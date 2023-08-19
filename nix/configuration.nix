# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, options, home-manager, ... }:
#{ config, pkgs, ...}:
let
  #overlay = (builtins.fetchGit { 
  #url = https://github.com/niwhsa9/env-setup.git;
	#rev = "a0a3446b85b300e4eadcb73fce76d7c5aca7d4af";
  #ref = "main";
  #rev = "d7628e69e66e130fb0d3421bf2846d1419aa8a51";
  #});
  #home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
in
{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #./home-manager
      (import "${home-manager}/nixos")
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.devices = ["nodev"];


  networking.hostName = "ashwin-desktop"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/Detroit";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;

 #----=[ Fonts ]=----#
  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [ 
      ubuntu_font_family
    ];
  };
  

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  
  # overlay
  nixpkgs.overlays = (import ./ashwin-nixpkgs/default.nix);

  nix.nixPath =
    # Prepend default nixPath values.
    options.nix.nixPath.default ++
    [ "nixpkgs-overlays=/home/ashwin/source/env-setup/nix/ashwin-nixpkgs/default.nix" ]

    # Append our nixpkgs-overlays.
  ;
  hardware.opengl.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ashwin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      i3-gaps
      i3status
      dmenu
      git
      tmux
      polybar
      google-chrome
      flameshot
      discord
      feh
      st
      neovim
      gnumake
      gcc
      vscode
      clang 
      cargo
    ];
  };

  home-manager.users.ashwin = {pkgs, ...} : {
    programs.bash.enable = true;
    home.stateVersion = "23.05";

    programs.git = {
      enable = true;
      userName = "Ashwin Gupta";
      userEmail = "ashwingupta2000@gmail.com";
      lfs.enable = true;
    };

    home.file = {
      ".config/test" = {
        text = "lol";
      };

      ".config/polybar/config.ini" = {
        source = ../dotfiles/polybar/config.ini;
      };

      ".config/i3" = {
        source = ../dotfiles/i3;
        recursive = true;
      };

    };

    #nixpkgs.overlays = [(import ./ashwin-nixpkgs/default.nix)];
    #services.polybar.config = 

  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  hardware.bluetooth.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

