# METADATA
# title: Task 2
# description: Package with all policies for task 2
package task2

import data.task2.utils as lib

# METADATA
# title: Display a warning if there is no USER at last stage
# description: There must be USER instruction at last stage
# related_resources:
# - https://www.docker.com/blog/understanding-the-docker-user-instruction/
warn contains msg if {
	some resource in input
	lib.is_last_stage(resource.Stage)
	not lib.is_scratch_stage(resource.Stage)

	not has_user_in_last_stage(resource.Stage)

	msg := "В Dockerfile должна быть команда 'USER'"
}

has_user_in_last_stage(last_stage) if {
	some resource in input
	resource.Cmd == "user"
	resource.Stage == last_stage
}