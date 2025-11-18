{ config, pkgs, lib, ... }:
{
    # Enable the X11 windowing system
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment
    services.xserver.displayManager.gdm = {
	enable = true;
	autoSuspend = false;
    }

    services.xserver.desktopManager.gnome.enable = true;

     services.displayManager.autoLogin = {
        enable = true;
        user = "bmacs";
    };

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    environment.gnome.excludePackages = with pkgs; [
        gnome-tour
    ];



    # Enable touchpad support (enabled by default in most desktopManager)
    # services.xserver.libinput.enable = true;
}

