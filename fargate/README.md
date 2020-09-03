# Fargate

## Usage
```hcl-terraform
module "my-awesome-app-on-fargate" {
  source = "git::ssh://git@github.com/kelseymok/terraform-modules.git//fargate"

  module-name = "my-awesome-app"
  vpc-id = "some-vpc-id"
  image-url = "kb1rd/hello-world"
  private-subnet-ids = ["private-subnet1-id", "private-subnet2-id"]
  public-subnet-ids = ["public-subnet1-id", "public-subnet2-id"]
}
```

## Inputs
| **Name** | **Description** | **Type** | **Required** | Default **Value** |
| --- | --- | --- | --- | --- |
| module-name | The address of the application | string | yes | |
| vpc-id | The VPC ID | string | yes | |
| image-url | The image url of the application to be deployed on Fargate | string | yes | |
| private-subnet-ids | List of private subnet IDs associated the VPC | list(string) | yes | |
| public-subnet-ids | List of private subnet IDs associated the VPC | string | yes | |
| permissions-boundary-arn | A permissions boundary arn for service/instance roles | string | no | "" |


## Outputs
| **Name** | **Description** | **Value** |
| --- | --- | --- |
| alb_public_address | The address of the application | string |