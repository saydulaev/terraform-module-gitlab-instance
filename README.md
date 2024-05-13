<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.9 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | 16.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | 16.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [gitlab_application.this](https://registry.terraform.io/providers/gitlabhq/gitlab/16.11.0/docs/resources/application) | resource |
| [gitlab_instance_variable.this](https://registry.terraform.io/providers/gitlabhq/gitlab/16.11.0/docs/resources/instance_variable) | resource |
| [gitlab_system_hook.this](https://registry.terraform.io/providers/gitlabhq/gitlab/16.11.0/docs/resources/system_hook) | resource |
| [gitlab_topic.this](https://registry.terraform.io/providers/gitlabhq/gitlab/16.11.0/docs/resources/topic) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_applications"></a> [applications](#input\_applications) | Gitlab instance apps | <pre>list(object({<br>    name         = string               // Name of the application.<br>    redirect_url = string               // The URL gitlab should send the user to after authentication.<br>    scopes       = set(string)          // Scopes of the application. Valid options are: api, read_api, read_user, read_repository, write_repository, read_registry, write_registry, sudo, admin_mode, openid, profile, email<br>    confidential = optional(bool, true) // The application is used where the client secret can be kept confidential.<br>  }))</pre> | n/a | yes |
| <a name="input_instance_variables"></a> [instance\_variables](#input\_instance\_variables) | Gitlab instance variables | <pre>list(object({<br>    key           = string                      // The name of the variable.<br>    value         = string                      // The value of the variable.<br>    masked        = optional(bool, false)       // If set to true, the value of the variable will be hidden in job logs.<br>    protected     = optional(bool, false)       // If set to true, the variable will be passed only to pipelines running on protected branches and tags.<br>    raw           = optional(bool, false)       // Whether the variable is treated as a raw string<br>    variable_type = optional(string, "env_var") // The type of a variable. Valid values are: env_var, file<br>  }))</pre> | `[]` | no |
| <a name="input_system_hooks"></a> [system\_hooks](#input\_system\_hooks) | Gitlab system hooks | <pre>list(object({<br>    url                      = string           // The hook URL.<br>    enable_ssl_verification  = optional(bool)   // Do SSL verification when triggering the hook.<br>    merge_requests_events    = optional(bool)   // Trigger hook on merge requests events.<br>    push_events              = optional(bool)   // When true, the hook fires on push events.<br>    repository_update_events = optional(bool)   // Trigger hook on repository update events.<br>    tag_push_events          = optional(bool)   // When true, the hook fires on new tags being pushed.<br>    token                    = optional(string) // Secret token to validate received payloads; this isn’t returned in the response.<br>  }))</pre> | `[]` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | Gitlab topics | <pre>list(object({<br>    name        = string           // The topic's name.<br>    avatar      = optional(string) // A local path to the avatar image to upload.<br>    avatar_hash = optional(string) // The hash of the avatar image.<br>    description = optional(string) // A text describing the topic.<br>    title       = optional(string) // The topic's description.<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_applications"></a> [applications](#output\_applications) | Gitlab instance apps |
| <a name="output_hooks_id"></a> [hooks\_id](#output\_hooks\_id) | Gitlab system hooks |
| <a name="output_instance_variables_id"></a> [instance\_variables\_id](#output\_instance\_variables\_id) | Gitlab instance variables |
| <a name="output_topics"></a> [topics](#output\_topics) | Gitlab topics |
<!-- END_TF_DOCS -->