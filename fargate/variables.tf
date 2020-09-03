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
}