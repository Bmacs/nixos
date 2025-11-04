{ config, pkgs, ... }:
{
    imports = [
    ];

    # Add this line to enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

