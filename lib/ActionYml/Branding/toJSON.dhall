let imports = ../../imports.dhall

let Branding = ./Type.dhall

let Prelude = imports.Prelude

let JSON = Prelude.JSON

let toJSON
    : Branding → JSON.Type
    = λ(branding : Branding) →
        JSON.object
          ( toMap
              { color = JSON.string branding.color
              , icon = JSON.string branding.icon
              }
          )

in  toJSON
