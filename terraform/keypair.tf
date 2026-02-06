# Generate SSH key pair
resource "tls_private_key" "mern_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create AWS key pair
resource "aws_key_pair" "mern_keypair" {
  key_name   = var.key_name
  public_key = tls_private_key.mern_key.public_key_openssh
}

# Save private key to local file
resource "local_file" "private_key" {
  filename        = "${path.module}/MERNAppDeployment.pem"
  content         = tls_private_key.mern_key.private_key_pem
  file_permission = "700"
}
