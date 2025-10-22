resource "aws_launch_template" "this" {
  name          = var.name_lt
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.type_instance

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    
  }

  iam_instance_profile {
    name = "EC2SessionManagerRole"
    
  }

  network_interfaces {
    delete_on_termination       = true
    associate_public_ip_address = true

    security_groups = var.sg_instance_id
  }

  user_data = filebase64("${path.module}/start_user_data.sh")
}


resource "aws_autoscaling_group" "asg" {
  name             = var.name_asg
  max_size         = 2
  min_size         = 2
  desired_capacity = 2

  vpc_zone_identifier = [
    var.public_subnetA_id,
    var.public_subnetB_id,
    var.public_subnetC_id
  ]

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }

}


resource "aws_lb_target_group" "tg" {
  name        = "app-tg"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    matcher             = "200-399"
  }

}


resource "aws_lb" "web_lb" {
  name               = var.name_load_balancer
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.sg_lb_id
  subnets = [
    var.public_subnetA_id,
    var.public_subnetB_id,
    var.public_subnetC_id
    ]
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}


#----------------------------------------------------------------------
resource "aws_autoscaling_attachment" "blue" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.tg.arn
}