variable "image-url" {
  type = string
}

variable "private-subnet-ids" {
  type = list(string)
}

variable "public-subnet-ids" {
  type = list(string)
}

variable "vpc-id" {
  type = string
}

variable "module-name" {
  type = string
}

variable "permissions-boundary-arn" {
  type = string
  default = ""
}

variable "container-port" {
  type = number
  descript = "The port exposed from your container"
  default = 8080
}

variable "host-port" {
  type = number
  description = "The port mapped on the host from the container"
  default = 8080
}