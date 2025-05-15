package solutions

warn contains msg if {
	some aquarium in input.aquarium

	fish_amount := [fish.amount |
		some fish in aquarium.fish
	]

	total_fish := sum(fish_amount)
	total_fish > aquarium.max_fish

	# regal ignore:line-length
	msg := sprintf("В аквариуме %s %d рыб. Максимальная вместимость этого аквариума: %d рыб", [aquarium.name, total_fish, aquarium.max_fish])
}
