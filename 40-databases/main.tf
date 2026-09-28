resource "aws_instance" "mongodb" {
  ami           = local.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [local.mongodb_sg_id]
  subnet_id = local.database_subnet_id

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-mongodb"
    }
  )
}

resource "terraform_data" "mongodb"{
  triggers_replace = [
    aws_instance.mongodb.id    #this will trigger the resources after creation of mongodb instance
  ]

provisioner "file" {
  source      = "bootstrap.sh"
  destination = "/tmp/bootsrap.sh"
}
 connection {
  type     = "ssh"
  user     = "ec2-user"
  password = "DevOps321"
  host     = aws_instance.mongodb.private_ip
  }

  provisioner "remote-exec" {
  inline = [ 
    "chmod +x /tmp/bootstrap.sh",
    "sudo sh /tmp/bootstrap.sh mongodb"
  ]
}
}

resource "aws_instance" "redis" {
  ami           = local.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [local.redis_sg_id]
  subnet_id = local.database_subnet_id

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-redis"
    }
  )
}

resource "terraform_data" "redis"{
  triggers_replace = [
    aws_instance.redis.id    #this will trigger the resources after creation of redis instance
  ]

provisioner "file" {
  source      = "bootstrap.sh"
  destination = "/tmp/bootsrap.sh"
}
 connection {
  type     = "ssh"
  user     = "ec2-user"
  password = "DevOps321"
  host     = aws_instance.redis.private_ip
  }

  provisioner "remote-exec" {
  inline = [ 
    "chmod +x /tmp/bootstrap.sh",
    "sudo sh /tmp/bootstrap.sh redis"
  ]
}
}

resource "aws_instance" "mysql" {
  ami           = local.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [local.mysql_sg_id]
  subnet_id = local.database_subnet_id

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-mysql"
    }
  )
}

resource "terraform_data" "mysql"{
  triggers_replace = [
    aws_instance.mysql.id    #this will trigger the resources after creation of mysql instance
  ]

provisioner "file" {
  source      = "bootstrap.sh"
  destination = "/tmp/bootsrap.sh"
}
 connection {
  type     = "ssh"
  user     = "ec2-user"
  password = "DevOps321"
  host     = aws_instance.mysql.private_ip
  }

  provisioner "remote-exec" {
  inline = [ 
    "chmod +x /tmp/bootstrap.sh",
    "sudo sh /tmp/bootstrap.sh mysql"
  ]
}
}

resource "aws_instance" "rabbitmq" {
  ami           = local.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [local.rabbitmq_sg_id]
  subnet_id = local.database_subnet_id

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-rabbitmq"
    }
  )
}

resource "terraform_data" "rabbitmq"{
  triggers_replace = [
    aws_instance.rabbitmq.id    #this will trigger the resources after creation of rabbitmq instance
  ]

provisioner "file" {
  source      = "bootstrap.sh"
  destination = "/tmp/bootsrap.sh"
}
 connection {
  type     = "ssh"
  user     = "ec2-user"
  password = "DevOps321"
  host     = aws_instance.rabbitmq.private_ip
  }

  provisioner "remote-exec" {
  inline = [ 
    "chmod +x /tmp/bootstrap.sh",
    "sudo sh /tmp/bootstrap.sh rabbitmq"
  ]
}
}