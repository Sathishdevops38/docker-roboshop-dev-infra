variable "project_name"{
    default = "roboshop"
}
variable "environment"{
    default = "dev"
}

variable "docker_tags"{
    default ={
        createdby = "terraform"
        usage =  "docker"
    }
}

variable "instance_type"{
    default = "t3.micro"
}

