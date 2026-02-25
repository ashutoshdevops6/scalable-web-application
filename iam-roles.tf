# IAM Roles and Policies Configuration

# Define IAM Role for EC2 Instances
resource "aws_iam_role" "ec2_role" {
  name               = "ec2_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Effect = "Allow"
      Sid    = ""
    }]
  })
}

# Define IAM Policy for EC2 Permissions
resource "aws_iam_policy" "ec2_permissions" {
  name        = "ec2_permissions"
  description = "Policy for allowing EC2 operations."
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:RunInstances",
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:TerminateInstances",
          "ec2:DescribeInstances"
        ],
        Resource = "*"
      }
    ]
  })
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "attach_ec2_permissions" {
  policy_arn = aws_iam_policy.ec2_permissions.arn
  role       = aws_iam_role.ec2_role.name
}