{
  description = ''Functions for string validation'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-validator-master.flake = false;
  inputs.src-validator-master.owner = "Adeohluwa";
  inputs.src-validator-master.ref   = "refs/heads/master";
  inputs.src-validator-master.repo  = "validator";
  inputs.src-validator-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-validator-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-validator-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}