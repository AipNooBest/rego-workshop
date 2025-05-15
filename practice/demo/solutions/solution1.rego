package solutions

warn contains msg if {
	some aquarium in input.aquarium
	not aquarium.name == "Coral Haven"

	some fish in aquarium.fish
	fish.color == "Multicolor"

	msg := sprintf("Разноцветная рыба %s %s достойна жить только в Coral Haven!", [fish.species, fish.name])
}
