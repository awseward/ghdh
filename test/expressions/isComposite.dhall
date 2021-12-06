let imports = ./imports.dhall

let ActionYml = imports.lib.ActionYml

let runs =
      let action = env:DHALL_TEST_INPUT : ActionYml.Type

      in  ActionYml.Runs.Parseable.toUnion action.runs

let test0 = assert : ActionYml.Runs.isComposite runs ≡ True

let test1 = assert : ActionYml.Runs.isDocker runs ≡ False

let test2 = assert : ActionYml.Runs.isJavascript runs ≡ False

in  < OK >
