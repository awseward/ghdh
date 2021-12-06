let Input = ./Type.dhall

let YmlPrimitive = ../../YmlPrimitive/Type.dhall

in  λ(input : Input) →
      merge { None = False, Some = λ(_ : YmlPrimitive) → True } input.default
