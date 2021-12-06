let imports = ../../imports.dhall

let Input = ./Type.dhall

let Prelude = imports.Prelude

let JSON = Prelude.JSON

let toJSONString =
      λ(a : Type) →
      λ(fn : a → Text) →
      λ(x : Optional a) →
        merge { None = JSON.null, Some = λ(x_ : a) → JSON.string (fn x_) } x

let optString = toJSONString Text (Prelude.Function.identity Text)

let optYmlPrimitive =
      let YmlPrimitive = ../../YmlPrimitive/package.dhall

      in  toJSONString YmlPrimitive.Type YmlPrimitive.show

in  λ(input : Input) →
        JSON.object
          ( toMap
              { default = optYmlPrimitive input.default
              , deprecationMessage = optString input.deprecationMessage
              , description = JSON.string input.description
              , required = JSON.bool input.required
              }
          )
      : JSON.Type
