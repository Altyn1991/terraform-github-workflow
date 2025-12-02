variable "s3_backend_bucket" {
  description = "The name of the S3 bucket for Terraform remote state."
  type        = string
}

variable "s3_backend_key" {
  description = "The path/key in the S3 bucket for the state file."
  type        = string
}

variable "s3_backend_region" {
  description = "The AWS region for the S3 backend."
  type        = string
}
variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c94855ba95c71c99" # Amazon Linux 2 for us-east-1
}
