nix run nixpkgs#nix-prefetch-git -- --url https://codeberg.org/wh1tepearl/vxwm.git --rev main 2>&1 | grep -oP 'hash: \K.*' > /tmp/hash.txt
sed -i '1d' configuration.nix
sed -i '2d' configuration.nix
sed -i '3d' configuration.nix
nix-shell -p curl --run  'curl -s -o /tmp/temp.txt https://raw.githubusercontent.com/prizduk/vxwm-on-NixOS/refs/heads/main/vstavka.txt'
nix-shell -p coreutils --run 'cat /tmp/temp.txt configuration.nix > /tmp/merged && mv /tpm/merged configuration.nix'
rm /tmp/temp.txt
awk -v r="$(cat /tmp/hash.txt)" '{gsub(/00000000000000000000000000000000/, r)}1' configuration.nix > tmp && mv tmp configuration.nix
rm /tmp/hash.txt
nixos-rebuild switch