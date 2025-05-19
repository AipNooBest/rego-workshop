package task2.utils

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