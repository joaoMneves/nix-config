{ pkgs, ... }:

let
  importFolder = dir:
    builtins.attrValues
      (builtins.mapAttrs
        (name: type:
          if type == "regular" && builtins.match ".*\\.nix$" name != null
          then import (dir + "/${name}")
          else null
        )
        (builtins.readDir dir)
      );
in

{

  imports = [
    # Importa todos os arquivos .nix de programs/ e services/
    (importFolder ./programs)
    (importFolder ./services)
  ];

  home.username = "joao";
  home.homeDirectory = "/home/joao";
  home.stateVersion = "23.11"; # Mantenha compatível com a versão do NixOS

  # Pacotes instalados apenas para o usuário
  home.packages = with pkgs; [
    htop
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    # TERMINAL = "alacritty";
    SHELL = "zsh";
  };

  # Configuração de programas (dotfiles)
  programs = {
    git = {
      enable = true;
      userName = "João Miguel Neves Da silva";
      userEmail = "joaomiguelneves2007@proton.me";
    };

  };

  # Serviços do usuário (e.g., ssh-agent)
  # services = {
  #   ssh-agent.enable = true;
  # };
nixpkgs = {
  config = {
    # Disable if you don't want unfree packages
    allowUnfree = true;
  };
};

}
