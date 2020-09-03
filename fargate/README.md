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