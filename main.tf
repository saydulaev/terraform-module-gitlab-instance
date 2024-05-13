resource "gitlab_instance_variable" "this" {
  for_each = {
    for variable in var.instance_variables : variable.key => variable
    if length(var.instance_variables) > 0
  }

  key           = each.value.key
  value         = each.value.value
  protected     = each.value.protected
  masked        = each.value.masked
  raw           = each.value.raw
  variable_type = each.value.variable_type
}

resource "gitlab_application" "this" {
  for_each = {
    for app in var.applications : app.name => app
    if length(var.applications) > 0
  }

  name         = each.value.name
  redirect_url = each.value.redirect_url
  scopes       = each.value.scopes
  confidential = each.value.confidential
}

resource "gitlab_topic" "this" {
  for_each = {
    for topic in var.topics : topic.name => topic
    if length(var.topics) > 0
  }

  name        = each.value.name
  title       = each.value.title
  description = each.value.description
  avatar      = each.value.avatar
  avatar_hash = each.value.avatar != null ? filesha256(each.value.avatar) : null // filesha256(coalesce(each.value.avatar_hash, each.value.avatar))
}


resource "gitlab_system_hook" "this" {
  for_each = {
    for hook in var.system_hooks : hook.url => hook
    if length(var.system_hooks) > 0
  }

  url                      = each.value.url
  enable_ssl_verification  = each.value.enable_ssl_verification
  merge_requests_events    = each.value.merge_requests_events
  push_events              = each.value.push_events
  repository_update_events = each.value.repository_update_events
  tag_push_events          = each.value.tag_push_events
  token                    = each.value.token
}

/*
resource "gitlab_global_level_notifications" "this" {
  for_each = {
    for level in var.global_level_notifications : index(var.global_level_notifications, level) => level
    if length(var.global_level_notifications) > 0 && contains(["disabled", "participating", "watch", "global", "mention", "custom"], level.level)
  }

  close_issue = try(each.value.level, "") == "custom" ? each.value.close_issue : null
  close_merge_request = try(each.value.level, "") == "custom" ? each.value.close_merge_request : null
  failed_pipeline = try(each.value.level, "") == "custom" ? each.value.failed_pipeline : null 
  fixed_pipeline = try(each.value.level, "") == "custom" ? each.value.fixed_pipeline : null 
  issue_due = try(each.value.level, "") == "custom" ? each.value.issue_due : null 
  level = try(each.value.level, null)
  merge_merge_request = try(each.value.level, "") == "custom" ? each.value.merge_merge_request : null 
  merge_when_pipeline_succeeds = try(each.value.level, "") == "custom" ? each.value.merge_when_pipeline_succeeds : null 
  moved_project = try(each.value.level, "") == "custom" ? each.value.moved_project : null 
  new_issue = try(each.value.level, "") == "custom" ? each.value.new_issue : null 
  new_merge_request = try(each.value.level, "") == "custom" ? each.value.new_merge_request : null 
  new_note = try(each.value.level, "") == "custom" ? each.value.new_note : null 
  push_to_merge_request = try(each.value.level, "") == "custom" ? each.value.push_to_merge_request : null 
  reassign_issue = try(each.value.level, "") == "custom" ? each.value.reassign_issue : null 
  reassign_merge_request = try(each.value.level, "") == "custom" ? each.value.reassign_merge_request : null 
  reopen_issue = try(each.value.level, "") == "custom" ? each.value.reopen_issue : null 
  reopen_merge_request = try(each.value.level, "") == "custom" ? each.value.reopen_merge_request : null 
  success_pipeline = try(each.value.level, "") == "custom" ? each.value.success_pipeline : null 
}
*/