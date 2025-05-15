package solutions

warn contains msg if {
	some aquarium in input.aquarium
	some fish in aquarium.fish

	species := fish.species

	total := sum([inner_fish.amount |
		some inner_aquarium in input.aquarium
		some inner_fish in inner_aquarium.fish
		inner_fish.species == species
	])

	msg := sprintf("Рыб вида %s всего: %d", [species, total])
}
