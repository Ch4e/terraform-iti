resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "key-01"          
  public_key = tls_private_key.pk.public_key_openssh
}
