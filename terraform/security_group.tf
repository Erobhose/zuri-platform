resource "aws_security_group" "backend_sg" {
  name        = "zuri-backend-sg"
  description = "Security group for Zuri Market backend"
  vpc_id      = aws_vpc.zuri_vpc.id

  ingress {
    description = "Allow backend traffic"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "zuri-backend-sg"
    Project = "zuri-market"
  }
}