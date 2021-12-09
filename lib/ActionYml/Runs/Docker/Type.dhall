-- https://web.archive.org/web/20211128221846/https://docs.github.com/en/actions/creating-actions/metadata-syntax-for-github-actions#runs-for-docker-actions
let imports = ../../../imports.dhall

let Prelude = imports.Prelude

let YmlPrimitive = ../../../YmlPrimitive/package.dhall

in  { `using` : Text
    , image : Text
    , env : Prelude.Map.Type Text YmlPrimitive.Type
    , pre-entrypoint : Optional Text
    , entrypoint : Optional Text
    , post-entrypoint : Optional Text
    , args : List Text
    }
