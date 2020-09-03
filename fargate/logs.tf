resource "aws_cloudwatch_log_group" "ecs" {
  name = "/${var.module-name}/ecs/fargate-task-definition"
}