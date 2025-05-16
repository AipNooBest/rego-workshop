package task2

warn contains msg if {
	some resource in input
	is_last_stage(resource.Stage)
	not is_scratch_stage(resource.Stage)

	not has_user_in_last_stage(resource.Stage)

	msg := "В Dockerfile должна быть команда 'USER'"
}

has_user_in_last_stage(last_stage) if {
	some resource in input
	resource.Cmd == "user"
	resource.Stage == last_stage
}

is_last_stage(current_stage) if {
	stage_list := {resource.Stage | some resource in input}
	last_stage := max(stage_list)
	current_stage == last_stage
}

is_scratch_stage(current_stage) if {
	stage_list := {resource.Stage |
		some resource in input
		resource.Cmd == "from"
		resource.Value[0] == "scratch"
	}
	count(stage_list) > 0
	current_stage in stage_list
}