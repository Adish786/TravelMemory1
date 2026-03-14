resource "aws_instance" "adish_web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.adish-web_sg.id]
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  key_name                    = aws_key_pair.mern_keypair.key_name

  tags = {
    Name = var.tags_name_web
  }
}


resource "aws_instance" "adish_db" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  subnet_id            = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.adish-db_sg.id]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  key_name             = aws_key_pair.mern_keypair.key_name

  tags = {
    Name = var.tags_name_db
  }
}
