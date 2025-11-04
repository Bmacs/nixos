{ config, pkgs, lib, ... }:
{
    services.openssh = {
        enable = true;
        settings = {
            PermitRootLogin = "no";
            PasswordAuthentication = true;   # or false if you only use keys
        };
    };
}

