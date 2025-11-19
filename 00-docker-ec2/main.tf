module "docker" {  
  source = "git::https://github.com/Sathishdevops38/terraform-modules.git//20-bastion-module?ref=main"
  project_name = var.project_name
  environment = var.environment
  subnet_id = local.subnet_id  
  instance_type = var.instance_type
  sg_ids =   [local.sg_id]
  iam_profile_name = aws_iam_instance_profile.docker.name
  root_volume_size = 50
  root_volume_type = "gp3"

  user_data = file("docker.sh")
  tags= merge(
    var.docker_tags,
    local.common_tags,{
      Name =  "${local.common_name_suffix}-docker"
    }
  )  
}

resource "aws_iam_instance_profile" "docker" {
  name = "docker"
  role = "BastionTerraformAdmin"
}

resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = local.sg_id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}


