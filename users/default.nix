{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "r3z";
  home.homeDirectory = "/home/r3z";

  home.stateVersion = "24.11"; # Please read the comment before changing.
  
  home.packages = with pkgs;[
    tela-circle-icon-theme
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock  
    gnomeExtensions.vitals
    gnomeExtensions.caffeine
  ];

  programs.git = {
    enable = true;
    userEmail = "yurandarezky@atmaluhur.ac.id";
    userName = "Rezky Yuranda";
  };

  gtk = {
    enable = true;
    iconTeheme = {
      package = pkgs.tela-circle-icon-theme;
      name = "Tela-circle-icon-theme";
    };
  };

  # Dconf
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/mutter" = {
        experimental-features = [ "scale-monitor-framebuffer" ];
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          caffeine.extensionUuid
          dash-to-dock.extensionUuid
          vitals.extensionUuid 
        ];
      };
    };
  };


  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
