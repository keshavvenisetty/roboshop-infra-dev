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
<<<<<<< HEAD
=======
>>>>>>> 6fec1ab4e9c5d341b83bb8ef31abd459591c8164
variable "sg_tags" {
  type    = map(string)
  default = {}
}

<<<<<<< HEAD
=======
>>>>>>> 5175811 (inra)
>>>>>>> 6fec1ab4e9c5d341b83bb8ef31abd459591c8164
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
<<<<<<< HEAD
=======
>>>>>>> 6fec1ab4e9c5d341b83bb8ef31abd459591c8164
}

variable "backend_alb_sg_name" {
    default = "backend_alb"
}

variable "backend_alb_sg_description" {
    default = "created sg for backend_alb instance"
<<<<<<< HEAD
=======
>>>>>>> 5175811 (inra)
>>>>>>> 6fec1ab4e9c5d341b83bb8ef31abd459591c8164
}