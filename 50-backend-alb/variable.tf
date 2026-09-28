variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "backend_alb_sg_tags" {
  type    = map(string)
  default = {}
}

variable "zone_id" {
    default = "Z10348461496EXVCGS8OZ"
}