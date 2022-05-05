resource "aws_instance" "example_2" {
  ami           = "ami-00c90dbdc12232b58"
  instance_type = "t2.micro"
  # the VPC subnet
  subnet_id                   = aws_subnet.main-private-1.id
  associate_public_ip_address = "false"
  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh2.id]
  # the public SSH key
  key_name = var.key_name

  user_data = <<-EOF
  #!/bin/bash
  echo "*** Installing apache2"
  sudo apt update -y
  sudo apt install apache2 -y
  echo "*** Completed Installing apache2"
  sudo systemctl start apache2.service

  EOF

  tags = {
    Name = "mouli-private-ec2"
  }
}
