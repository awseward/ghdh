let imports = ../../../../imports.dhall

let YmlPrimitive = ../../../../YmlPrimitive/package.dhall

let Prelude = imports.Prelude

in  { run : Optional Text
    , shell : Optional Text
    , id : Optional Text
    , env : Prelude.Map.Type Text YmlPrimitive.Type
    , working-directory : Optional Text
    , uses : Optional Text
    , `with` : Prelude.Map.Type Text YmlPrimitive.Type
    }
