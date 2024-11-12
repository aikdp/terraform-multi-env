resource "aws_security_group" "sg_allow-ssh" {
  name   = "Port-SSH-${var.environment}"
  description = "allow port no 22 traffic"


    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

  tags = merge(
    var.common_tags,
    var.tags, 
    {
          Name = "SSH-Port-${var.environment}"
    }
  )
}

#AWS instance creation
resource "aws_instance" "expense" {
  for_each = var.instances #taken it from dev.tfvars (vars overroide by tfvars)--1st prefernce is tfvars
  ami = "ami-09c813fb71547fc4f"
  instance_type = each.value
  vpc_security_group_ids = [aws_security_group.sg_allow-ssh.id]
  tags = merge(
    var.common_tags,
    var.tags, 
    {
        Name = each.key
    }
  )
}
