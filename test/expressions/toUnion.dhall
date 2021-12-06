let imports = ./imports.dhall

let ActionYml = imports.lib.ActionYml

let action = env:DHALL_TEST_INPUT : ActionYml.Type

in  ActionYml.Runs.Parseable.toUnion action.runs
