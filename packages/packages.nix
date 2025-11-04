{ config, pkgs, lib, vicinae, system, ... }:
{
    # Allow proprietary software
    nixpkgs.config.allowUnfree = true;

    # Firefox as a managed program
    programs.firefox.enable = true;

    # System-wide packages
    environment.systemPackages = with pkgs; [
        # CLI essentials
        fastfetch
        neovim
        zsh
        curl
        fzf
        git
        ghostty
        htop
        jq
        lsd
	spotify
	syncthing
        tmux
        tree
	pciutils
	usbutils
        unzip
        vim
        wget
        zip
        zellij

        # Desktop apps
        gnome-tweaks
        vlc
	vivaldi
        gimp
        # google-chrome   # needs allowUnfree = true
        # vscode          # needs allowUnfree = true

        # Add Vicinae from flake input
        vicinae.packages.${system}.default


    ];
}

