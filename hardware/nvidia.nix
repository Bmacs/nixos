{ config, pkgs, ... }:
{
    # RTX 2080 specific config
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };

    # Load nvidia driver
    services.xserver.videoDrivers = [ "nvidia" ];

    # Blacklist nouveau (conflicts with nvidia)
    boot.blacklistedKernelModules = [ "nouveau" ];

    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        
        # RTX 2080 supports open kernel modules
        open = true;
        
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    # Force X11 (more stable)
    services.xserver.displayManager.gdm.wayland = false;
}
