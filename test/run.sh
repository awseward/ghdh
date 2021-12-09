#!/usr/bin/env bash

set -euo pipefail

parse_loose() {
  dhall text <<< "$1 as Text" \
    | yaml-to-dhall --records-loose --omissible-lists ./lib/ActionYml/Type.dhall
}

parse_stricter() {
  local -r subject_location="$1"
  local -r test_expr="$2"

  local tempfile; tempfile="$(mktemp)"; readonly tempfile
  # >&2 echo "${tempfile}"
  parse_loose "${subject_location}" > "${tempfile}"

  >&2 echo -n "DHALL_TEST_INPUT='${tempfile}' "
  DHALL_TEST_INPUT="${tempfile}" xargs -t \
    dhall --explain --file <<< "${test_expr}"
}

parse_sample_action() {
  parse_stricter "./test/data/actions/$1/action.yml" ./test/expressions/toUnion.dhall
}

# ---

run_one() {
  local -r line="$*"
  [ "$(echo "${line}" | xargs)" = '' ] && return
  (echo "${line}" | grep -E '^\s*#' > /dev/null) && return

  >&2 echo ">>>>>>>> $0 ${line}"
  # shellcheck disable=SC2086
  "$0" $line
  echo
}

run_many() {
  # This nonsense is necessary to be able to use the `-d` flag…
  local _xargs='xargs'
  type gxargs >/dev/null 2>&1 && _xargs='gxargs'
  readonly _xargs

  "${_xargs}" -P4 -n1 -d $'\n' -t "$0" run_one
}

_choose_cases() {
  fzf \
    --delimiter $'\n' \
    --multi \
    --header 'Select test cases (hint: TAB for multi-select)' \
    --header-first \
    --layout='reverse-list'
}

cases() { grep -E -v '^\s*$' < ./test/cases.txt ; }

pick() { cases | _choose_cases | "$0" run_many ; }

all() { cases | "$0" run_many ; }

"${@:-pick}"
