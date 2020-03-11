module "ecs" {
  source = "./.."

  project     = "Project"
  environment = "dev"
  service     = "service-name"

  vpc_id  = "vpc-eizox8ea"
  subnets = ["subnet-sait0aiw", "subnet-op8phee4", "subnet-eego9xoo"]

  alb_target_group_arn = "arn:aws:elasticloadbalancing:< region >:< account ID >:targetgroup/< target group name >/3b4e9fbf82439af5"
  container_port       = "80"

  availability_zones = ["eu-west1"]

  container_definitions = <<EOF
[
  {
    "name": "first",
    "image": "service-first",
    "cpu": 10,
    "memory": 512,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
EOF
}
