resource "aws_iam_role" "zuri_platform_role" {
  name = "zuri-platform-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name    = "zuri-platform-role"
    Project = "zuri-market"
  }
}