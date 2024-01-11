# Database Structure

## Tables

comunity
	id
	comunity_id
	comunity_time
	comunity_name
	comunity_user
	comunity_mail
	comunity_pass

projects
	id
	project_id
	project_time
	project_name
	project_description
	project_client_name
	project_client_mail
	project_client_auth
	comunity_id

stages
	id
	stage_id
	stage_time
	stage_name
	stage_description
	stage_start
	stage_end
	stage_status
	stage_slim
	stage_public
	project_id

tasks
	id
	task_id
	task_time
	task_name
	task_description
	task_start
	task_end
	task_status
	task_public
	stage_id

comments
	id
	comment_id
	comment_time
	comment_content
	stage_id
	comunity_id

unreads
	id
	unread_id
	comment_id
	comunity_id
