variable "instances" {
    type = map
}

variable "domain_name" {
    default = "telugudevops.online"
}

variable "zone_id" {
    default = "Z0873413X28XY5FKMLIP"
}

variable "common_tags" {
    default = {
        Project = "expense"
    }
}

variable "tags" {
    type = map
}

variable "environment" {
    
}