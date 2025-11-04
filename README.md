# Clone your config
git clone https://github.com/Bmacs/nixos.git
cd nixos

# Generate hardware config for their machine
sudo nixos-generate-config --show-hardware-config > hosts/nixos-desktop/hardware-configuration.nix

# Apply your config with flake
sudo nixos-rebuild switch --flake .#nixos-desktop
