let Runs = { Type = ./Type.dhall }

let isDocker
    : Runs.Type → Bool
    = λ(runs : Runs.Type) →
        merge
          { Composite = λ(_ : ./Composite/Type.dhall) → True
          , Docker = λ(_ : ./Docker/Type.dhall) → False
          , Javascript = λ(_ : ./Javascript/Type.dhall) → False
          }
          runs

in  isDocker
