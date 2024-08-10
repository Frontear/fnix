{
  lib,
  stdenv,
  zig,
}:
stdenv.mkDerivation {
  pname = "fnix";
  version = "0.1.0";

  src = let fs = lib.fileset; in fs.toSource {
    root = ../.;
    fileset = fs.unions [
      ../src
      ../build.zig
      ../build.zig.zon
    ];
  };

  nativeBuildInputs = [
    zig.hook
  ];

  postInstall = ''
    mv $out/bin/{*,nixos-rebuild}
  '';

  meta = with lib; {
    description = "A drop-in replacement for `nixos-rebuild`.";
    homepage = "https://github.com/Frontear/fnix";
    license = licenses.acsl14;
    mainProgram = "nixos-rebuild";
  };
}
