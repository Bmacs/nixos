{ config, pkgs, lib, ... }:
{
    # Networking
    networking.networkmanager.enable = true;

    # Locale settings
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };

    # Printing
    services.printing.enable = true;

    # Audio with pipewire - enhanced version
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
        wireplumber.enable = true;  # Moved here, more organized
    };

    environment.systemPackages = with pkgs; [
        # Essential audio packages for browser compatibility
        pavucontrol
        pulseaudio         # PulseAudio client tools  
        wireplumber        # PipeWire session manager
    ];

    # Environment variables for audio compatibility
    environment.sessionVariables = {
        PULSE_SERVER = "unix:/run/user/1000/pulse/native";
    };
}

