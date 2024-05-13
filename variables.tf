variable "instance_variables" {
  description = "Gitlab instance variables"
  type = list(object({
    key           = string                      // The name of the variable.
    value         = string                      // The value of the variable.
    masked        = optional(bool, false)       // If set to true, the value of the variable will be hidden in job logs.
    protected     = optional(bool, false)       // If set to true, the variable will be passed only to pipelines running on protected branches and tags.
    raw           = optional(bool, false)       // Whether the variable is treated as a raw string
    variable_type = optional(string, "env_var") // The type of a variable. Valid values are: env_var, file
  }))
  default = []
}

variable "applications" {
  description = "Gitlab instance apps"
  type = list(object({
    name         = string               // Name of the application.
    redirect_url = string               // The URL gitlab should send the user to after authentication.
    scopes       = set(string)          // Scopes of the application. Valid options are: api, read_api, read_user, read_repository, write_repository, read_registry, write_registry, sudo, admin_mode, openid, profile, email
    confidential = optional(bool, true) // The application is used where the client secret can be kept confidential.
  }))
}

variable "topics" {
  description = "Gitlab topics"
  type = list(object({
    name        = string           // The topic's name.
    avatar      = optional(string) // A local path to the avatar image to upload.
    avatar_hash = optional(string) // The hash of the avatar image.
    description = optional(string) // A text describing the topic.
    title       = optional(string) // The topic's description.
  }))
  default = []
}

variable "system_hooks" {
  description = "Gitlab system hooks"
  type = list(object({
    url                      = string           // The hook URL.
    enable_ssl_verification  = optional(bool)   // Do SSL verification when triggering the hook.
    merge_requests_events    = optional(bool)   // Trigger hook on merge requests events.
    push_events              = optional(bool)   // When true, the hook fires on push events.
    repository_update_events = optional(bool)   // Trigger hook on repository update events.
    tag_push_events          = optional(bool)   // When true, the hook fires on new tags being pushed.
    token                    = optional(string) // Secret token to validate received payloads; this isn’t returned in the response.
  }))
  default = []
}

/*
variable "global_level_notifications" {
  description = "Gitlab global level notifications"
  type = list(object({
    close_issue                  = optional(bool) // Enable notifications for closed issues. Can only be used when level is custom
    close_merge_request          = optional(bool) // Enable notifications for closed merge requests. Can only be used when level is custom.
    failed_pipeline              = optional(bool) // Enable notifications for failed pipelines. Can only be used when level is custom
    fixed_pipeline               = optional(bool) // Enable notifications for fixed pipelines. Can only be used when level is custom
    issue_due                    = optional(bool) // Enable notifications for due issues. Can only be used when level is custom
    level                        = optional(string) // The level of the notification. Valid values are: disabled, participating, watch, global, mention, custom.
    merge_merge_request          = optional(bool) // Enable notifications for merged merge requests. Can only be used when level is custom.
    merge_when_pipeline_succeeds = optional(bool) // Enable notifications for merged merge requests when the pipeline succeeds. Can only be used when level is custom
    moved_project                = optional(bool) // Enable notifications for moved projects. Can only be used when level is custom
    new_issue                    = optional(bool) // Enable notifications for new issues. Can only be used when level is custom.
    new_merge_request            = optional(bool) // Enable notifications for new merge requests. Can only be used when level is custom.
    new_note                     = optional(bool) // Enable notifications for new notes on merge requests. Can only be used when level is custom.
    push_to_merge_request        = optional(bool) // Enable notifications for push to merge request branches. Can only be used when level is custom.
    reassign_issue               = optional(bool) // Enable notifications for issue reassignments. Can only be used when level is custom.
    reassign_merge_request       = optional(bool) // Enable notifications for merge request reassignments. Can only be used when level is custom.
    reopen_issue                 = optional(bool) // Enable notifications for reopened issues. Can only be used when level is custom.
    reopen_merge_request         = optional(bool) // Enable notifications for reopened merge requests. Can only be used when level is custom.
    success_pipeline             = optional(bool) // Enable notifications for successful pipelines. Can only be used when level is custom.
  }))
  validation {
    condition     = length(var.global_level_notifications) == 0 ? true : alltrue([for l in var.global_level_notifications: contains(["disabled", "participating", "watch", "global", "mention", "custom"], l.level) if l.level != null ])
    error_message = "Valid values are: `disabled`, `participating`, `watch`, `global`, `mention`, `custom`"
  }
  default = []
}
*/