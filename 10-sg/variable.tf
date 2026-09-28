variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "frontend_sg_name" {
    default = "frontend"
}


variable "sg_tags" {
  type    = map(string)
  default = {}
}

variable "frontend_sg_description" {
    default = "created sg for frontend instance"
}

variable "vpc_id" {
    default = ""
}

variable "bastion_sg_name" {
    default = "bastion"
}

variable "bastion_sg_description" {
    default = "created sg for bastion instance"

}

variable "backend_alb_sg_name" {
    default = "backend_alb"
}

variable "backend_alb_sg_description" {
    default = "created sg for backend_alb instance"
}

variable "mongodb_sg_name" {
    default = "mongodb"
}

variable "mongodb_sg_description" {
    default = "created sg for mongodb instance"

}

variable "redis_sg_name" {
    default = "redis"
}

variable "redis_sg_description" {
    default = "created sg for redis instance"

}

variable "mysql_sg_name" {
    default = "mysql"
}

variable "mysql_sg_description" {
    default = "created sg for mysql instance"

}

variable "rabbitmq_sg_name" {
    default = "rabbitmq"
}

variable "rabbitmq_sg_description" {
    default = "created sg for rabbitmq instance"
}

variable "catalogue_sg_name" {
    default = "catalogue"
}

variable "catalogue_sg_description" {
    default = "created sg for catalogue instance"
}

variable "mongodb_ports_vpn" {
    default = [22, 27017]
}

variable "catalogue_ports_vpn" {
    default = [22, 8080]
}