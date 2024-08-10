{
  ...
}:
{
  perSystem = { pkgs, self', ... }: {
    devShells.default = pkgs.callPackage ./shell.nix { fnix = self'.packages.default; };
    packages.default = pkgs.callPackage ./package.nix {};
  };
}
