variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "instance_ami" {
  type    = string
  default = "ami-0665ce57d172e712e"
}
variable "key_name" {
  type    = string
  default = "ganga"
} 