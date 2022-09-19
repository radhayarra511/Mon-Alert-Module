## **Google-cloud-router**


This module handles opinionated Google Cloud Platform routing.



## Usage


```hcl
module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 0.4"



 name    = "example-router"
  project = "<PROJECT ID>"
  region  = "us-central1"
  network = "default"
}
```


## **Inputs**



| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bgp | BGP information specific to this router. | `any` | `null` | no |
| description | An optional description of this resource | `string` | `null` | no |
| name | Name of the router | `string` | n/a | yes |
| nats | NATs to deploy on this router. | `any` | `[]` | no |
| network | A reference to the network to which this router belongs | `string` | n/a | yes |
| project | The project ID to deploy to | `string` | n/a | yes |
| region | Region where the router resides | `string` | n/a | yes |



## **Outputs**



| **Name** | **Description** |
|------|-------------|
| router | The created router |



