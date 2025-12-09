# zone example

This is an example on how to create a compute placement zone within a region of an existing cloud account. 

## Getting Started

There are variables which need to be added to terraform.tfvars. The first are for connecting to the vRealize Automation (vRA) endpoint. There are names of cloud_account, region, already setup in vRA.

* `url` - The URL for the vRealize Automation (vRA) endpoint
* `refresh_token` - The refresh token for the vRA account
* `cloud_account` - The name of the cloud account added in vRA
* `region` - The region within in the cloud account

To facilitate adding these variables, a sample tfvars file can be copied first:
```shell
cp terraform.tfvars.sample terraform.tfvars
```
To create a zone, a cloud account must be setup in vRA and the region must be identified within which the zone will be created.

Follow these examples for setting up specific cloud accounts:

* Setup [cloud\_account\_aws](../cloud_account_aws/README.md)
* Setup [cloud\_account\_azure](../cloud_account_azure/README.md)
* Setup [cloud\_account\_gcp](../cloud_account_gcp/README.md)
* Setup [cloud\_account\_vsphere](../cloud_account_vsphere/README.md)

Once the information is added to `terraform.tfvars`, the zones can be created via:

```shell
terraform init
terraform apply
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.14.0 |
| <a name="requirement_vra"></a> [vra](#requirement\_vra) | >= 0.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vra"></a> [vra](#provider\_vra) | >= 0.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vra_zone.this](https://registry.terraform.io/providers/vmware/vra/latest/docs/resources/zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capability_tags"></a> [capability\_tags](#input\_capability\_tags) | Capability tags to be applied to the Cloud Zone | `list(map(string))` | `[]` | no |
| <a name="input_compute_ids"></a> [compute\_ids](#input\_compute\_ids) | List of compute IDs (clusters, hosts, etc.) to associate with the Cloud Zone | `list(string)` | `[]` | no |
| <a name="input_custom_properties"></a> [custom\_properties](#input\_custom\_properties) | Custom properties to apply to the Cloud Zone | `map(string)` | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the Cloud Zone | `string` | `null` | no |
| <a name="input_folder"></a> [folder](#input\_folder) | The folder relative path to the datacenter where resources are deployed (vSphere only) | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Cloud Zone | `string` | n/a | yes |
| <a name="input_placement_policy"></a> [placement\_policy](#input\_placement\_policy) | Placement policy for the Cloud Zone | `string` | `"DEFAULT"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region ID where the Cloud Zone is created | `string` | n/a | yes |
| <a name="input_tags_to_match"></a> [tags\_to\_match](#input\_tags\_to\_match) | Tags to match for filtering clusters | `list(map(string))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloud_zone"></a> [cloud\_zone](#output\_cloud\_zone) | n/a |
<!-- END_TF_DOCS -->