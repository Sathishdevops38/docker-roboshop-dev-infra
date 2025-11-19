data "aws_ami" "ami_2023" {
  most_recent = true
  owners      = ["self"] # The owner alias for official Amazon AMIs

  filter {
    name   = "name"
    values = ["devops-practice-ami"] # Filter for AL2023 AMIs, adjust for arm64 if needed
  }

  filter {
    name   = "architecture"
    values = ["x86_64"] # Specify the desired architecture
  }
}

# ---------------------------------------------------------
# 1. Retrieve the Default VPC
# ---------------------------------------------------------
# This data block finds the default VPC in the specified region.
# The 'default = true' filter ensures it only selects the VPC
# created automatically by AWS when the account was first set up.
data "aws_vpc" "default_vpc" {
  default = true

  # Optional: Add a second filter just to be explicit
  filter {
    name   = "is-default"
    values = ["true"]
  }
}

# ---------------------------------------------------------
# 2. Retrieve a Default Subnet (in a specific AZ)
# ---------------------------------------------------------
# This data block finds a default subnet associated with the
# default VPC in a specific Availability Zone (AZ).

# You must specify an availability zone for the subnet.
# Change 'us-east-1a' to your desired AZ.
data "aws_subnet" "default_subnet" {
  vpc_id     = data.aws_vpc.default_vpc.id
  default_for_az = true
  availability_zone = "us-west-2a"
}

# ---------------------------------------------------------
# 3. Retrieve the Default Security Group
# ---------------------------------------------------------
# This data block finds the default Security Group (SG)
# associated with the default VPC. Every VPC has one default SG.
data "aws_security_group" "default_sg" {
  vpc_id = data.aws_vpc.default_vpc.id

  # The filter targets the SG named 'default' in the VPC.
  filter {
    name   = "group-name"
    values = ["default"]
  }
}

