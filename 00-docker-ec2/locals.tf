locals{
    common_name_suffix = "${var.project_name}-${var.environment}"
    ami_id = data.aws_ami.ami_2023.id
    vpc_id = data.aws_vpc.default_vpc.id
    subnet_id = data.aws_subnet.default_subnet.id
    sg_id = data.aws_security_group.default_sg.id
    common_tags = {
        Project = var.project_name
        Environment = var.environment
        Terraform = "true"
    }
}