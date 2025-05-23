{ pkgs, ... }:

{
  home.sessionVariables = {
    NVIM_APPNAME = "../../nvim-config/nvim-config/";
  };

  home.packages = [
    pkgs.unstable.neovim
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;

  };

}
