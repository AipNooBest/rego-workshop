package k8s

warn contains msg if {
	input.kind == "Pod"
	some container in input.spec.containers
	not container.resources.requests
	msg := sprintf("У контейнера %s не указаны requests", [container.name])
}
