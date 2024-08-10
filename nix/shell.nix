{
  mkShell,
  fnix,
  rust-analyzer
}:
mkShell {
  inputsFrom = [ fnix ];

  packages = [
    rust-analyzer
  ];

  # https://github.com/NixOS/nixpkgs/issues/270415
  shellHook = ''
    unset ZIG_GLOBAL_CACHE_DIR 
  '';
}
