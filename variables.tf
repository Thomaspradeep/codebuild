variable aws_account{
    type = string
}
variable "aws_region" {
    type = string
    default = "ap-south-1"
    description = "Mumbai location"
}

variable "bucket_name" {
    type = string
    default = "matthews-bucket-091423"
    description = "Creating bucket on 14/09/2023 for learning purpose"
}

variable "environment" {
    type = string
    default = "preprod" 
}

variable "clients_list"{
    type = map(any)
}

variable "lambda_role"{
    type = string
}
