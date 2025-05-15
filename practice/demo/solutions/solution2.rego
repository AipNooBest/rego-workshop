package solutions

warn contains msg if {
	some aquarium in input.aquarium
	not aquarium.water_type == "Mixed"

	some fish in aquarium.fish
	fish.is_salty == true
	aquarium.water_type == "Fresh"

	msg := sprintf("Рыба %s %s должна жить в солёной воде!", [fish.species, fish.name])
}

deny contains msg if {
	some aquarium in input.aquarium
	not aquarium.water_type == "Mixed"

	some fish in aquarium.fish
	fish.is_salty == false
	aquarium.water_type == "Salty"

	msg := sprintf("Рыба %s %s должна жить в пресной воде!", [fish.species, fish.name])
}
