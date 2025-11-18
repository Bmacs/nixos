{ config, pkgs, lib, vicinae, system, ... }:
{
    # Allow proprietary software
    nixpkgs.config.allowUnfree = true;

    # Firefox as a managed program
    programs.firefox.enable = true;

    # System-wide packages
    environment.systemPackages = with pkgs; [
        # CLI essentials
	nodejs
	pciutils
	spotify
	syncthing
	usbutils
        curl
        fastfetch
        fzf
        ghostty
        git
        htop
        jq
        lsd
        neovim
        tmux
        tree
        unzip
        vim
        wget
        zellij
        zip
        zsh

        # Desktop apps
        gnome-tweaks
	obsidian
        vlc
	vivaldi
        gimp
        # google-chrome   # needs allowUnfree = true
        # vscode          # needs allowUnfree = true

        # Add Vicinae from flake input
        vicinae.packages.${system}.default


    ];
}

