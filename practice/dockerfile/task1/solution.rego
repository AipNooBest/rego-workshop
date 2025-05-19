package task1

warn contains msg if {
	some resource in input
	resource.Cmd == "from"
	not resource.Value[0] == "scratch"
	contains(resource.Value[0], ":latest")

	msg := sprintf("Обнаружено: FROM %s || Версия не должна быть 'latest'", [resource.Value[0]])
}
