{ config, pkgs, ... }:

let
  MyAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    homein = "home-manager switch --flake ~/.dotfiles";
    upgrade = "nix flake update --flake ~/.dotfiles && sudo nixos-rebuild switch --flake ~/.dotfiles";
  };
in

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = MyAliases;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "steeef";
    };
  };
}
