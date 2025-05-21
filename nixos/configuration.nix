# use this to create hardware-configuration.nix
# nixos-generate-config --root /mnt

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix # Arquivo gerado durante a instalação
  ];

  # Bootloader (ajuste para seu sistema)
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };

  # Configurações gerais
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "pt_BR.UTF-8";

  # Usuário principal
  users.users.joao = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Pacotes básicos
  environment.systemPackages = with pkgs; [
    git
    wget
  ];

  # Serviços
  services.openssh.enable = true;
  networking.networkmanager.enable = true;
  config.allowUnfree = true;

  # Garbage Collector
  gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}

