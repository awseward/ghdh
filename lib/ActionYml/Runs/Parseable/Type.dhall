let imports = ../../../imports.dhall

let Prelude = imports.Prelude

let YmlPrimitive = ../../../YmlPrimitive/package.dhall

let Common = { `using` : Text }

let Composite = { steps : List ../Composite/Step/Type.dhall }

let Docker =
      { image : Optional Text
      , env : Prelude.Map.Type Text YmlPrimitive.Type
      , pre-entrypoint : Optional Text
      , entrypoint : Optional Text
      , post-entrypoint : Optional Text
      , args : List Text
      }

let Javascript =
      { main : Optional Text
      , pre : Optional Text
      , pre-if : Optional Text
      , post : Optional Text
      , post-if : Optional Text
      }

in  Common ⩓ Composite ⩓ Docker ⩓ Javascript
