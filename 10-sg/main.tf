module "frontend" {
    #source = "../../../terraform-aws-securitygroup"
    source = "git::https://github.com/keshavvenisetty/terraform-aws-securitygroup.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.frontend_sg_name
    sg_description = var.frontend_sg_description
    vpc_id = local.vpc_id
<<<<<<< HEAD
    sg_tags = var.sg_tags

=======
<<<<<<< HEAD
=======
    sg_tags = var.sg_tags
>>>>>>> 5175811 (inra)
>>>>>>> 6fec1ab4e9c5d341b83bb8ef31abd459591c8164
}

module "bastion" {
    #source = "../../../terraform-aws-securitygroup"
<<<<<<< HEAD
    source = "git::https://github.com/keshavvenisetty/terraform-aws-securitygroup.git?ref=main"
=======
<<<<<<< HEAD
    source = "git::https://github.com/keshavvenisetty/terraform-aws-securitygroup.git?ref=main"
=======
   source = "git::https://github.com/keshavvenisetty/terraform-aws-securitygroup.git?ref=main"
>>>>>>> 5175811 (inra)
>>>>>>> 6fec1ab4e9c5d341b83bb8ef31abd459591c8164
    project = var.project
    environment = var.environment
    sg_name = var.bastion_sg_name
    sg_description = var.bastion_sg_description
    vpc_id = local.vpc_id
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> 6fec1ab4e9c5d341b83bb8ef31abd459591c8164
    sg_tags = var.sg_tags
}

module "backend_alb" {
    #source = "../../../terraform-aws-securitygroup"
    source = "git::https://github.com/keshavvenisetty/terraform-aws-securitygroup.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.backend_alb_sg_name
    sg_description = var.backend_alb_sg_description
    vpc_id = local.vpc_id
    sg_tags = var.sg_tags
}

module "vpn" {
    #source = "../../../terraform-aws-securitygroup"
    source = "git::https://github.com/keshavvenisetty/terraform-aws-securitygroup.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = "vpn"
    sg_description = "for VPN connections"
    vpc_id = local.vpc_id
    sg_tags = var.sg_tags
<<<<<<< HEAD
=======
>>>>>>> 5175811 (inra)
>>>>>>> 6fec1ab4e9c5d341b83bb8ef31abd459591c8164
}

# bastion accepting connections from my laptop
resource "aws_security_group_rule" "bastion_laptop" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.bastion.sg_id
}
<<<<<<< HEAD

=======
<<<<<<< HEAD
=======
>>>>>>> 6fec1ab4e9c5d341b83bb8ef31abd459591c8164

# backend_alb accepting connections from bastion host on port no. 80
resource "aws_security_group_rule" "backend_alb_bastion" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id  #source from bastion
  security_group_id = module.backend_alb.sg_id          #destination to backend_alb
}

# VPN ports 22, 443, 1194, 943 need to be opened for VPN connections 
resource "aws_security_group_rule" "vpn_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "vpn_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "vpn_1194" {
  type              = "ingress"
  from_port         = 1194
  to_port           = 1194
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "vpn_ports_943" {
  type              = "ingress"
  from_port         = 943
  to_port           = 943
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}
<<<<<<< HEAD

=======
>>>>>>> 5175811 (inra)
>>>>>>> 6fec1ab4e9c5d341b83bb8ef31abd459591c8164
