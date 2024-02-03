variable "region" {
  description = "Region for AWS CLI"
  type        = string
  default     = "us-east-1"
}
variable "ansible_instance_type" {
  description = "Type for the ansible instance"
  type        = string
  default     = "t3.large"
}
variable "ansible_instance_name" {
  description = "Name for ansible ec2"
  type        = string
  default     = "ansible"
}
variable "as_instance_type" {
  description = "Type for the app server instance"
  type        = string
  default     = "t2.micro"
}
variable "as_instance_name" {
  description = "Name for app server ec2"
  type        = string
  default     = "app-server"
}
variable "key_name" {
  description = "Name for key"
  type        = string
  default     = "knight-cmu"

}
