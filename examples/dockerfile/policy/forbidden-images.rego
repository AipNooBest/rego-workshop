package main
import rego.v1

denylist := ["openjdk"]

warn contains msg if {
	some i
	input[i].Cmd == "from"
	val := input[i].Value
	contains(val[i], denylist[_])

	msg = sprintf("unallowed image found %s", [val])
}