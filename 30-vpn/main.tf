resource "aws_key_pair" "openvpn" {
  key_name   = "openvpn"
  public_key = file("C:\\Users\\sriam\\devops\\aws\\openvpn.pub")
}

resource "aws_instance" "vpn" {
  ami           = local.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [local.vpn_sg_id]
  subnet_id = local.public_subnet_ids
  key_name = aws_key_pair.openvpn.key_name
  user_data = file("openvpn.sh")
  
  
  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-vpn"
    }
  )
}
