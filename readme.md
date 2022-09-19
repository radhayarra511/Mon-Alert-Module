## **Monitoring-Alert Module

A Terraform module that helps setting up Monitoring in GCP.



## **Usage**

Example folder covers how to create Monitoring Alert policies.
The simplest config to get Alert policies created and added notifications:

module "Monitoring-Module" {
source = ""
  
  display_name = "storage-alert-policy"
  combiner = "OR"
  project-id = "cnr-sciotelecom-npd-5k9i"
  conditions = {
     "GCS Bucket - Sent bytes" = {
      condition_threshold = {
      filter     = "metric.type=\"storage.googleapis.com/network/sent_bytes_count\" AND resource.type=\"gcs_bucket\""
      duration   = "60s"
      comparison = "COMPARISON_GT"
      threshold_value = "46000"
      aggregations_enabled            = "true"
       aggregations_alignment_period   = "300s"
       aggregations_per_series_aligner = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
    }
  }
  }
} 

## Inputs

| **Name** | **Description** | **Type** | **Default** | **Required** |
|------|-------------|------|---------|:--------:|
|display_name |	A Unique name for alert display name | string |	-	| yes |
|project_id |	Project ID where alert policy will be created. |string | "" |no
|combiner | how to combine the results of multiple conditions to determine  | string | " " | yes
|condition | resource metric condition  | string |  "" | yes
|filter |  fileter | where the metric type defined | string | ""  |yes 
|duration | The amount of time that a time series must fail to report new data to be considered failing|   string |  "" |yes
|threshold |A threshold is a performance value you can set for a metric | string | " " | yes
|aggregation | The approach to be used to align individual time series | srting | " " | no


## Outputs

| **Name** | **Description** |
|------|-------------|
| alert | The created alert policy |
| name | alert name. |
| id | alert id. |

