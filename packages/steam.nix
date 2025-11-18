{ config, pkgs, lib, ... }:
{
    # Enable Steam and gaming support
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;      # Open ports for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server
        localNetworkGameTransfers.openFirewall = true; # Open ports for Steam Local Network Game Transfers
    };

    # Enable GameMode for better gaming performance
    programs.gamemode.enable = true;

    # Hardware support for controllers and VR
    hardware.steam-hardware.enable = true;

    # 32-bit library support (needed for most Steam games)
    hardware.graphics = {
        enable = true;
    };

    # Additional gaming packages
    environment.systemPackages = with pkgs; [
        # Steam utilities
        steamcmd
        steam-run
        
        # Gaming tools
        gamemode
        gamescope        # Gaming compositor
        mangohud         # Performance overlay

	vulkan-tools
	vulkan-loader
        
        # Controller support
        antimicrox       # Controller to keyboard/mouse mapping
	jstest-gtk
	evtest
        
        # Wine for Windows games (optional)
        # wineWowPackages.stable
        # winetricks
        
        # Lutris for game management (optional)
        # lutris
    ];

    # Audio latency improvements for gaming
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;  # Enable JACK for low-latency audio
    };

    services.udev.packages = with pkgs; [
        steam
        game-devices-udev-rules  # Extra controller support
    ];


    # Kernel parameters for gaming performance (optional)
    # boot.kernel.sysctl = {
    #     "vm.max_map_count" = 2147483642;  # Needed for some games
    # };

    # Additional firewall rules for gaming (if needed)
    # networking.firewall.allowedTCPPorts = [ 27015 27036 ];
    # networking.firewall.allowedUDPPorts = [ 27015 27031 27036 ];
}

