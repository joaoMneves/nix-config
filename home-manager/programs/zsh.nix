# home/programs/obsidian.nix
{ pkgs, ... }:

{
  home.packages = [
    pkgs.zsh
    pkgs.sheldon
    pkgs.starship
  ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      eval "$(${pkgs.sheldon}/bin/sheldon source)"
    '';


    shellGlobalAliases = {
      # Aliases globais (opcional)
      nv = "nvim .";
    };

    sheldon = {
      enable = true;
      plugins = [
        {
          name = "zsh-autosuggestions";
          github = "zsh-users/zsh-autosuggestions";
        }
        {
          name = "zsh-autocomplete";
          github = "marlonrichert/zsh-autocomplete";
        }
        {
          name = "zsh-syntax-highlighting";
          github = "zsh-users/zsh-syntax-highlighting";
        }
      ];

      initExtraFirst = ''
        export STARSHIP_CONFIG=${./programs/starship.toml}
        eval "$(${pkgs.starship}/bin/starship init zsh)"
      '';

    };

    history = {
      save = 100000; # Número máximo de linhas no arquivo
      size = 100000; # Número máximo de entradas na memória
      expireDuplicates = true; # Remove entradas duplicadas
      share = true; # Compartilha histórico entre sessões
      ignoreSpace = true; # Ignora comandos que começam com espaço
    };

  };
}
