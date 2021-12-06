let imports = ../imports.dhall

let Input = ./Input/package.dhall

let Output = ./Output/package.dhall

let Branding = ./Branding/package.dhall

let Runs/Parseable = ./Runs/Parseable/package.dhall

let Prelude = imports.Prelude

in  { name : Text
    , author : Optional Text
    , description : Text
    , inputs : Prelude.Map.Type Text Input.Type
    , outputs : Prelude.Map.Type Text Output.Type
    , runs : Runs/Parseable.Type
    , branding : Optional Branding.Type
    }
