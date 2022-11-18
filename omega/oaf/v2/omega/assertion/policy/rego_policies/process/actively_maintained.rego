package openssf.omega.policy.process.actively_maintained

# Metadata (YAML)
# ---
# title: Subject is marked as deprecated.
# methodology: >
#   This policy is used to determine if a project is deprecated, based on
#   the openssf.omega.metadata assertion.
# version: 0.1.0
# last_updated:
#   date: 2022-11-16
#   author: Michael Scovetta <michael.scovetta@gmail.com>
# ---

default pass = false
default applies = false

# Identify whether this policy applies to a given data object
applies := true {
    input.predicate.generator.name == "openssf.omega.security_scorecards"
    input.predicateType == "https://github.com/ossf/alpha-omega/v0.1"
}

pass := true {
    to_number(input.predicate.content.scorecard_data.maintained) >= 7
}
