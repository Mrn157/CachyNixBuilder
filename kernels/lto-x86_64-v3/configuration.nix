{ pkgs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;

  # Change this configuration to your own
  boot = {
    kernelPackages = pkgs.linuxPackages_cachyos-lto.cachyOverride { mArch = "GENERIC_V3"; };
    # Add/Remove modules you need here:
    extraModulePackages = with config.boot.kernelPackages; [
      rtw88
    ];
    loader.systemd-boot.enable = true;
  };

}
