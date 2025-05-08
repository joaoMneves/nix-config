{ pkgs, ... }:

{
  home.sessionVariables = {
    NVIM_APPNAME = "../../nvim-config/nvim-config/";
  };

  home.packages = [
    pkgs.neovim
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;

  };

}
