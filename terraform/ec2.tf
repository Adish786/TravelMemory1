resource "aws_instance" "adish_web" {
  ami                  = "ami-018ff7ece22bf96db"
  instance_type        = "t2.medium"
  subnet_id            = aws_subnet.public_subnet.id
  key_name             = aws_key_pair.mern_keypair.key_name
  security_groups      = [aws_security_group.adish-web_sg.id]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "adish-mern-web-server"
  }
}

resource "aws_instance" "adish_db" {
  ami                  = "ami-018ff7ece22bf96db"
  instance_type        = "t3.medium"
  subnet_id            = aws_subnet.private_subnet.id
  key_name             = aws_key_pair.mern_keypair.key_name
  security_groups      = [aws_security_group.adish-db_sg.id]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "adish-mern-db-server"
  }
}
