###create private key with pem file and save .pem file to my VSC
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
# key pair create
resource "aws_key_pair" "key_pair" {
  key_name   = "ganga" # Create a "ganga" keyname to AWS!!
  public_key = tls_private_key.private_key.public_key_openssh
}

resource "local_file" "ssh_key" {
  filename = "${aws_key_pair.key_pair.key_name}.pem"
  content  = tls_private_key.private_key.private_key_pem
}
