 ## **Cloud DNS Module**
This module makes it easy to create Google Cloud DNS zones of different types, 
and manage their records. It supports creating public, private, forwarding, and peering zones.



## **Usage**


## **Inputs**

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|default_key_specs_key | Object containing default key signing specifications| any | {} |no
|default_key_specs_zone | Object containing default zone signing specifications | any |	{} | no
|dnssec_config | Object containing   kind, non_existence, state. |	any |	{}	|no
|domain |	Zone domain, must end with a period.|	string	|n/a	|yes
|force_destroy |	Set this true to delete all records in the zone.| bool |	false |no
|labels |	A set of key/value label pairs to assign to this ManagedZone |	map(any) |	{} |	no
|name | Zone name, must be unique within the project.|	string |	n/a	| yes
|private_visibility_config_networks |	List of VPC self links that can see this zone.	| list(string) |[] | no
|project_id |	Project id for the zone. |	string | n/a |yes
target_name_server_addresses | 	List of target name servers for forwarding zone.|	list(map(any)) |	[]	| no
target_network |	Peering network. |string |	"" | no


## **Outputs**

| Name | Description |
|------|-------------|
|domain |	The DNS zone domain.
|name |	The DNS zone name.
|name_servers |The DNS zone name servers.
|type |	The DNS zone type.


