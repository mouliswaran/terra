resource "aws_security_group" "allow-ssh2" {
  vpc_id      = aws_vpc.main.id
  name        = "mouli-sg2"
  description = "Private security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${aws_instance.example.private_ip}/32"]
  }
  
 ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
     security_groups = [aws_security_group.allow-ssh.id]
  }
  tags = {
    Name = "mouli-allow-ssh2"
  }
}
