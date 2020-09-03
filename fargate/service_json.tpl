[
    {
      "name": "${module_name}",
      "image": "${image}",
      "cpu": 10,
      "memory": 512,
      "essential": true,
      "portMappings": [
        {
          "containerPort": 8080,
          "hostPort": 8080
        }
      ],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/${module_name}/ecs/fargate-task-definition",
          "awslogs-region": "eu-central-1",
          "awslogs-stream-prefix": "${module_name}-ecs"
        }
      }
    }
]
