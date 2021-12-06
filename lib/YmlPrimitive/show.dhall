let imports = ../imports.dhall

let YmlPrimitive = ./Type.dhall

let Prelude = imports.Prelude

let show
    : YmlPrimitive → Text
    = λ(x : YmlPrimitive) →
        merge
          { Bool = Prelude.Bool.show
          , Double = Double/show
          , Integer = Integer/show
          , Text = Prelude.Function.identity Text
          }
          x

in  show
