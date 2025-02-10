{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.

  imports = [
    ./apps/zsh.nix
  ];

  home.username = "r3z";
  home.homeDirectory = "/home/r3z";

  home.stateVersion = "24.11"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true; 

  home.packages = with pkgs;[
    remmina
    obsidian
    aria2
    zotero
    telegram-desktop
    vlc

    libreoffice
    hunspell
    hunspellDicts.en_US
   
    android-studio

    jetbrains.phpstorm
    jetbrains.jdk
    jetbrains.goland
    jetbrains.datagrip

    gnome-tweaks
    tela-circle-icon-theme
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock  
    gnomeExtensions.caffeine
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.battery-health-charging
  ];

  # git
  programs.git = {
    enable = true;
    userEmail = "yurandarezky@atmaluhur.ac.id";
    userName = "Rezky Yuranda";
  };

  # Dconf
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/mutter" = {
        experimental-features = [ "scale-monitor-framebuffer"  "xwayland-native-scaling" ];
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          caffeine.extensionUuid
          dash-to-dock.extensionUuid
          #vitals.extensionUuid 
          tray-icons-reloaded.extensionUuid
          battery-health-charging.extensionUuid
        ];
      };
      "org/gnome/desktop/background" = {
        color-shading-type = "solid";
        picture-uri = "file:///home/r3z/Pictures/nature.jpg";
        picture-uri-dark = "file:///home/r3z/Pictures/nature.jpg";
      };

      "org/gnome/desktop/interface" = {
        icon-theme = "Tela-circle-dark";
      };
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
