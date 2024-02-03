variable "region" {
  description = "Region for AWS CLI"
  type        = string
  default     = "us-east-1"
}
variable "instance_type" {
  description = "Type for the ansible instance"
  type        = string
  default     = "t3.large"
}
variable "instance_name" {
  description = "Name for ansible ec2"
  type        = string
  default     = "central"
}
variable "key_name" {
  description = "Name for key"
  type        = string
  default     = "knight-cmu"

}
