{ config, pkgs, lib, ... }:
{
    imports = [
        ./hardware-configuration.nix
        ../../common.nix
        ../../desktop/gnome.nix
        ../../packages/packages.nix
        ../../packages/steam.nix
        ../../services/jenkins.nix
        ../../services/ssh.nix
        ../../users/bmacs.nix
        ../../hardware/nvidia.nix
    ];

    # Host-specific settings
    networking.hostName = "nixos-desktop";
    time.timeZone = "America/New_York";
    system.stateVersion = "25.05";

    # Bootloader (moved from your old configuration.nix)
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
}

