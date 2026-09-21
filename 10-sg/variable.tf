variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "frontend_sg_name" {
    default = "frontend"
}

<<<<<<< HEAD
=======
variable "sg_tags" {
  type    = map(string)
  default = {}
}

>>>>>>> 5175811 (inra)
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
<<<<<<< HEAD
=======
}

variable "backend_alb_sg_name" {
    default = "backend_alb"
}

variable "backend_alb_sg_description" {
    default = "created sg for backend_alb instance"
>>>>>>> 5175811 (inra)
}