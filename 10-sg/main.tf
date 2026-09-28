module "frontend" {
    #source = "../../../terraform-aws-securitygroup"
    source = "git::https://github.com/keshavvenisetty/terraform-aws-securitygroup.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.frontend_sg_name
    sg_description = var.frontend_sg_description
    vpc_id = local.vpc_id
    sg_tags = var.sg_tags

}

module "bastion" {
    #source = "../../../terraform-aws-securitygroup"
    source = "git::https://github.com/keshavvenisetty/terraform-aws-securitygroup.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.bastion_sg_name
    sg_description = var.bastion_sg_description
    vpc_id = local.vpc_id
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
}

module "mongodb" {
    #source = "../../../terraform-aws-securitygroup"
    source = "git::https://github.com/keshavvenisetty/terraform-aws-securitygroup.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.mongodb_sg_name
    sg_description = var.mongodb_sg_description
    vpc_id = local.vpc_id
    sg_tags = var.sg_tags
}

module "redis" {
    #source = "../../../terraform-aws-securitygroup"
    source = "git::https://github.com/keshavvenisetty/terraform-aws-securitygroup.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.redis_sg_name
    sg_description = var.redis_sg_description
    vpc_id = local.vpc_id
    sg_tags = var.sg_tags
}

module "mysql" {
    #source = "../../../terraform-aws-securitygroup"
    source = "git::https://github.com/keshavvenisetty/terraform-aws-securitygroup.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.mysql_sg_name
    sg_description = var.mysql_sg_description
    vpc_id = local.vpc_id
    sg_tags = var.sg_tags
}

module "rabbitmq" {
    #source = "../../../terraform-aws-securitygroup"
    source = "git::https://github.com/keshavvenisetty/terraform-aws-securitygroup.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.rabbitmq_sg_name
    sg_description = var.rabbitmq_sg_description
    vpc_id = local.vpc_id
    sg_tags = var.sg_tags
}

module "catalogue" {
    #source = "../../../terraform-aws-securitygroup"
    source = "git::https://github.com/keshavvenisetty/terraform-aws-securitygroup.git?ref=main"
    project = var.project
    environment = var.environment
    sg_name = var.catalogue_sg_name
    sg_description = var.catalogue_sg_description
    vpc_id = local.vpc_id
    sg_tags = var.sg_tags
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

resource "aws_security_group_rule" "mongodb_vpn_ssh" {
  count             = length(var.mongodb_ports_vpn)
  type              = "ingress"
  from_port         = var.mongodb_ports_vpn[count.index]  #22,27017
  to_port           = var.mongodb_ports_vpn[count.index]  #22,27017
  protocol          = "tcp"
  source_security_group_id = module.vpn.sg_id  #source from VPN
  security_group_id = module.mongodb.sg_id 
}

# redis accepting connections from vpn on port no. 6379
resource "aws_security_group_rule" "redis_vpn" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id  #source from bastion
  security_group_id = module.redis.sg_id          #destination to backend_alb
}

# mysql accepting connections from vpn on port no. 3306
resource "aws_security_group_rule" "mysql_vpn" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id  #source from bastion
  security_group_id = module.mysql.sg_id          #destination to backend_alb
}

# rabbitmq accepting connections from vpn on port no. 5672
resource "aws_security_group_rule" "rabbitmq_vpn" {
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id  #source from bastion
  security_group_id = module.rabbitmq.sg_id          #destination to backend_alb
}

# catalogue accepting connections from backend_alb on port no. 8080
resource "aws_security_group_rule" "catalogue_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = module.backend_alb.sg_id  #source from backend_alb
  security_group_id = module.catalogue.sg_id          #destination to catalogue
}

# catalogue accepting connections from vpn on port no. 8080 and 22
resource "aws_security_group_rule" "catalogue_vpn" {
  count             = length(var.catalogue_ports_vpn)
  type              = "ingress"
  from_port         = var.catalogue_ports_vpn[count.index]
  to_port           = var.catalogue_ports_vpn[count.index]
  protocol          = "tcp"
  source_security_group_id = module.vpn.sg_id  #source from vpn
  security_group_id = module.catalogue.sg_id          #destination to catalogue
}

# catalogue accepting connections from bastion on port no. 22
resource "aws_security_group_rule" "catalogue_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_id  #source from bastion
  security_group_id = module.catalogue.sg_id          #destination to catalogue
}

# mongodb accepting connections from catalogue on port no. 27017
resource "aws_security_group_rule" "mongodb_catalogue" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id = module.catalogue.sg_id  #source from catalogue
  security_group_id = module.mongodb.sg_id          #destination to mongodb
}