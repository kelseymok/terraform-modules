data "template_file" "ecs-service-json" {
  template = file("${path.module}/service_json.tpl")
  vars = {
    image = var.image-url
    module_name = var.module-name
  }
}

resource "aws_ecs_task_definition" "app" {
  family                   = "${var.module-name}-task"
  execution_role_arn       = aws_iam_role.ecs.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  container_definitions    = data.template_file.ecs-service-json.rendered
}

resource "aws_ecs_service" "app" {
  name            = "${var.module-name}-service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = "1"
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs-tasks.id]
    subnets          = var.private-subnet-ids
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.app.id
    container_name   = var.module-name
    container_port   = "8080"
  }

  depends_on = [
    "aws_alb_listener.front_end",
  ]
}
