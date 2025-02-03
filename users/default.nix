{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "r3z";
  home.homeDirectory = "/home/r3z";

  home.stateVersion = "24.11"; # Please read the comment before changing.
  
  programs.git = {
    enable = true;
    userEmail = "yurandarezky@atmaluhur.ac.id";
    userName = "Rezky Yuranda";
  };

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
