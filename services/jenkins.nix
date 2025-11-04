{ config, pkgs, lib, ... }:
{
    # Jenkins CI
    services.jenkins.enable = true;
    networking.firewall.allowedTCPPorts = [ 8080 ];

    # OPTIONAL: allow Jenkins to use Docker for builds
    # virtualisation.docker.enable = true;
    # users.users.jenkins.extraGroups = [ "docker" ];
}

