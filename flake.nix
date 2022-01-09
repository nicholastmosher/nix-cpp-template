{
  description = "A basic CPP nix project";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-21.11";
    utils.url = "github:numtide/flake-utils";
    utils.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, utils, ... }: utils.lib.eachSystem [
    "x86_64-linux" "aarch64-linux"
  ] (system:
    let pkgs = import nixpkgs {
      inherit system;
    };
    in {
      devShell = pkgs.mkShell rec {
        name = "cpp-practice";
        packages = with pkgs; [
          llvmPackages_11.clang
          cmake
        ];
      };

      defaultPackage = pkgs.callPackage ./default.nix {};
    }
  );
}
