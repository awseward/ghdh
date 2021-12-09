let imports = ../../../imports.dhall

let Prelude = imports.Prelude

let Opt = Prelude.Optional

let Parseable = { Type = ./Type.dhall }

let Runs = { Type = ../Type.dhall }

let base = λ(parseable : Parseable.Type) → parseable.{ `using` }

let mustText =
    -- TODO: Figure out something better here than using this bottom value…

      Opt.default Text "__INVALID_missing_required_value__"

let toJavascript
    : Parseable.Type → Runs.Type
    = λ(parseable : Parseable.Type) →
        let mkUnionValue = Runs.Type.Javascript

        in  mkUnionValue
              (   base parseable
                ⫽ parseable.{ post, post-if, pre, pre-if }
                ⫽ { main = mustText parseable.main }
              )

let toDocker
    : Parseable.Type → Runs.Type
    = λ(parseable : Parseable.Type) →
        let mkUnionValue = Runs.Type.Docker

        in  mkUnionValue
              (   base parseable
                ⫽ parseable.{ args
                            , entrypoint
                            , env
                            , post-entrypoint
                            , pre-entrypoint
                            }
                ⫽ { image = mustText parseable.image }
              )

let toComposite
    : Parseable.Type → Runs.Type
    = λ(parseable : Parseable.Type) →
        let mkUnionValue = Runs.Type.Composite

        let steps = parseable.steps

        in  mkUnionValue (base parseable ⫽ { steps })

let isSome = λ(a : Type) → λ(x : Optional a) → Opt.null a x == False

let toUnion
    : Parseable.Type → Runs.Type
    = λ(parseable : Parseable.Type) →
        if    isSome Text parseable.main
        then  toJavascript parseable
        else  if isSome Text parseable.image
        then  toDocker parseable
        else  toComposite parseable

in  toUnion
