{ pkgs, ... }:

{

  imports = [
    # Importa todos os arquivos .nix de programs/ e services/
    (lib.my.importFolder ./programs)
    (lib.my.importFolder ./services)
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

    bash = {
      enable = true;
      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };
    };
  };

  # Serviços do usuário (e.g., ssh-agent)
  # services = {
  #   ssh-agent.enable = true;
  # };

  config = {
    # Disable if you don't want unfree packages
    allowUnfree = true;
  };

}
