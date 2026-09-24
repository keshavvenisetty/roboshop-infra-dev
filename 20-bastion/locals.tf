locals {
  ami_id = data.aws_ami.joindevops.id
  bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
  public_subnet_ids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]

<<<<<<< HEAD
=======
<<<<<<< HEAD
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
=======
>>>>>>> 6fec1ab4e9c5d341b83bb8ef31abd459591c8164
common_tags = {
    Project = var.project
    Environment = var.environment
    Terraform = "true"
}
<<<<<<< HEAD

=======
>>>>>>> 5175811 (inra)
>>>>>>> 6fec1ab4e9c5d341b83bb8ef31abd459591c8164
}