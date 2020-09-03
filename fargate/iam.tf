resource "aws_iam_role" "ecs" {
  name = "${var.module-name}-ecs-execution"
  assume_role_policy = data.aws_iam_policy_document.ecs-assume-role
  permissions_boundary = var.permissions-boundary-arn ? var.permissions-boundary-arn : ""
}

data "aws_iam_policy_document" "ecs-assume-role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      identifiers = ["ecs-tasks.amazonaws.com"]
      type = "Service"
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecs"{
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role = aws_iam_role.ecs.name
}




