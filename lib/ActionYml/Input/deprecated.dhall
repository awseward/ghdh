let imports = ../../imports.dhall

let Input = ./Type.dhall

let YmlPrimitive = ../../YmlPrimitive/Type.dhall

let Prelude = imports.Prelude

let deprecated =
      λ(deprecationMessage : Text) →
      λ(default : Text) →
          { default = Some (YmlPrimitive.Text default)
          , deprecationMessage = Some deprecationMessage
          , description = deprecationMessage
          , required = False
          }
        : Input

let example1 =
      let JSON = Prelude.JSON

      let renderYAML = λ(input : Input) → JSON.renderYAML (./toJSON.dhall input)

      in    assert
          :   renderYAML
                (deprecated "Do not use. Prefer <other_thing>" "some_default")
            ≡ ''
              "default": "some_default"
              "deprecationMessage": "Do not use. Prefer <other_thing>"
              "description": "Do not use. Prefer <other_thing>"
              "required": false
              ''

in  deprecated
