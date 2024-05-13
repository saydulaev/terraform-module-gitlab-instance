output "instance_variables_id" {
  description = "Gitlab instance variables"
  value       = values(gitlab_instance_variable.this)[*].id
}

output "applications" {
  description = "Gitlab instance apps"
  value = {
    for app in var.applications : app.name => gitlab_application.this[app.name]
  }
}

output "topics" {
  description = "Gitlab topics"
  value = {
    for topic in var.topics : topic.name => gitlab_topic.this[topic.name]
  }
}

output "hooks_id" {
  description = "Gitlab system hooks"
  value       = values(gitlab_system_hook.this)[*].id
}

/*
output "global_level_notifications_id" {
  description = "Gitlab global level notifications"
  value       = values(gitlab_global_level_notifications.this)[*].id
}
*/