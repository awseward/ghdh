let Runs = { Type = ./Type.dhall }

let isDocker
    : Runs.Type → Bool
    = λ(runs : Runs.Type) →
        merge
          { Composite = λ(_ : ./Composite/Type.dhall) → False
          , Docker = λ(_ : ./Docker/Type.dhall) → True
          , Javascript = λ(_ : ./Javascript/Type.dhall) → False
          }
          runs

in  isDocker
