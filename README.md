# vxwm-on-NixOS
nix-os: https://nixos.org

WARNING! YOU USE THIS AT YOUR OWN RISK! THIS IS YOUR RESPONSIBILITY! <br>
DO NOT USE `nixosstal.sh` IT'S DON'T WORK NOW !!!!! <br>
( idk it's work on my machine :/ )
___________________________________________________________________________________________________________
To install vxwm on NixOS, you will need to add this code to your configuration.nix file:
```bash
   { config, pkgs, ... }: 
   let 
      title_at_your_discretion = pkgs.stdebv.mkDerivation { 
         pname = "vxwm"; 
         version = "latest"; 
         src = pkgs.fetchFromCodeberg { 
            owner = "wh1tepearl"; 
            repo = "vxwm"; 
            rev = "main"; 
            hash = "sha256-00000000000000000000000000000000"; 
						# After running the `nixos-rebuild switch` command, an error will occur referencing the correct hash. 
						# Just copy it and paste instead of 00000...
          }; 
        buildInputs = with pkgs; [ libX11 libXft libXinerama ]; 
        preBuild = '' 
           cp ${your_way_to_config_vxwm} config.h 
        ''; 
        makeFlags = [ "PREFIX=$(out)" "BIN=vxwm" ]; 
        installPhase = '' 
            mkdir -p $out/bin 
            cp vxwm $out/bin 
         ''; 
         }; 
    in { 
         # Your config... 
    } 
```
After all this run `nixos-rebuild switch` aaaand.. done! <br>
You can download config.h from my friend TextCoffin (https://github.com/TextCoffin/vxwm-keybinds-config/blob/main/config.h) <br>
