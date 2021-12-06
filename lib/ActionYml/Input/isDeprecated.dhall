let Input = ./Type.dhall

in  λ(input : Input) →
      merge { None = False, Some = λ(_ : Text) → True } input.deprecationMessage
