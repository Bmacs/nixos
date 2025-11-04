{ config, pkgs, lib, ... }:
{
    users.users.bmacs = {
        isNormalUser = true;
        description = "bmacs";
        extraGroups = [ "networkmanager" "wheel" "gamemode"];
        packages = with pkgs; [
            # thunderbird  # example — uncomment to install for this user only
        ];
    };

     security.sudo.extraRules = [
        {
            users = [ "bmacs" ];
            commands = [
                {
                    command = "ALL";
                    options = [ "NOPASSWD" ];
                }
            ];
        }
    ];
}

