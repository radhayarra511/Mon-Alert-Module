##  **Load Balancer Terraform Module**
 HTTPS load balancing provides global load balancing for HTTPS requests destined for the instances. 
This means that the applications are available to the customers at a single anycast IP address, 
which simplifies the DNS setup. HTTPS load balancing balances HTTP and HTTPS traffic across multiple backend instances and across multiple regions




## **Usage**

```HCL

```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address | Existing IPv4 address to use (the actual IP address value) | `string` | `null` | no |
| backends | Map backend indices to list of backend maps. | <pre>map(object({<br>    protocol  = string<br>    port      = number<br>    port_name = string<br><br>    description             = string<br>    enable_cdn              = bool<br>    security_policy         = string<br>    custom_request_headers  = list(string)<br>    custom_response_headers = list(string)<br><br>    timeout_sec                     = number<br>    connection_draining_timeout_sec = number<br>    session_affinity                = string<br>    affinity_cookie_ttl_sec         = number<br><br>    health_check = object({<br>      check_interval_sec  = number<br>      timeout_sec         = number<br>      healthy_threshold   = number<br>      unhealthy_threshold = number<br>      request_path        = string<br>      port                = number<br>      host                = string<br>      logging             = bool<br>    })<br><br>    log_config = object({<br>      enable      = bool<br>      sample_rate = number<br>    })<br><br>    groups = list(object({<br>      group = string<br><br>      balancing_mode               = string<br>      capacity_scaler              = number<br>      description                  = string<br>      max_connections              = number<br>      max_connections_per_instance = number<br>      max_connections_per_endpoint = number<br>      max_rate                     = number<br>      max_rate_per_instance        = number<br>      max_rate_per_endpoint        = number<br>      max_utilization              = number<br>    }))<br>    iap_config = object({<br>      enable               = bool<br>      oauth2_client_id     = string<br>      oauth2_client_secret = string<br>    })<br>  }))</pre> | n/a | yes |
| cdn | Set to `true` to enable cdn on backend. | `bool` | `false` | no |
| certificate | Content of the SSL certificate. Required if `ssl` is `true` and `ssl_certificates` is empty. | `string` | `null` | no |
| create\_address | Create a new global IPv4 address | `bool` | `true` | no |
| create\_ipv6\_address | Allocate a new IPv6 address. Conflicts with "ipv6\_address" - if both specified, "create\_ipv6\_address" takes precedence. | `bool` | `false` | no |
| create\_url\_map | Set to `false` if url\_map variable is provided. | `bool` | `true` | no |
| enable\_ipv6 | Enable IPv6 address on the CDN load-balancer | `bool` | `false` | no |
| firewall\_networks | Names of the networks to create firewall rules in | `list(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| firewall\_projects | Names of the projects to create firewall rules in | `list(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| http\_forward | Set to `false` to disable HTTP port 80 forward | `bool` | `true` | no |
| https\_redirect | Set to `true` to enable https redirect on the lb. | `bool` | `false` | no |
| ipv6\_address | An existing IPv6 address to use (the actual IP address value) | `string` | `null` | no |
| labels | The labels to attach to resources created by this module | `map(string)` | `{}` | no |
| managed\_ssl\_certificate\_domains | Create Google-managed SSL certificates for specified domains. Requires `ssl` to be set to `true` and `use_ssl_certificates` set to `false`. | `list(string)` | `[]` | no |
| name | Name for the forwarding rule and prefix for supporting resources | `string` | n/a | yes |
| private\_key | Content of the private SSL key. Required if `ssl` is `true` and `ssl_certificates` is empty. | `string` | `null` | no |
| project | The project to deploy to, if not set the default provider project is used. | `string` | n/a | yes |
| quic | Set to `true` to enable QUIC support | `bool` | `false` | no |
| random\_certificate\_suffix | Bool to enable/disable random certificate name generation. Set and keep this to true if you need to change the SSL cert. | `bool` | `false` | no |
| security\_policy | The resource URL for the security policy to associate with the backend service | `string` | `null` | no |
| ssl | Set to `true` to enable SSL support, requires variable `ssl_certificates` - a list of self\_link certs | `bool` | `false` | no |
| ssl\_certificates | SSL cert self\_link list. Required if `ssl` is `true` and no `private_key` and `certificate` is provided. | `list(string)` | `[]` | no |
| ssl\_policy | Selfink to SSL Policy | `string` | `null` | no |
| target\_service\_accounts | List of target service accounts for health check firewall rule. Exactly one of target\_tags or target\_service\_accounts should be specified. | `list(string)` | `[]` | no |
| target\_tags | List of target tags for health check firewall rule. Exactly one of target\_tags or target\_service\_accounts should be specified. | `list(string)` | `[]` | no |
| url\_map | The url\_map resource to use. Default is to send all traffic to first backend. | `string` | `null` | no |
| use\_ssl\_certificates | If true, use the certificates provided by `ssl_certificates`, otherwise, create cert from `private_key` and `certificate` | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| backend\_services | The backend service resources. |
| external\_ip | The external IPv4 assigned to the global fowarding rule. |
| external\_ipv6\_address | The external IPv6 assigned to the global fowarding rule. |
| http\_proxy | The HTTP proxy used by this module. |
| https\_proxy | The HTTPS proxy used by this module. |
| ipv6\_enabled | Whether IPv6 configuration is enabled on this load-balancer |
| url\_map | The default URL map used by this module. |
