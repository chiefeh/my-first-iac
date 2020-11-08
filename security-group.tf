resource "aws_security_group" "allow-http-https" {
    name = "allow-http-https"
    description = "Allow HTTP HTTPS"
    vpc_id = aws_vpc.this.id
    
    ingress {
        description = "TLS from Internet"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
        description = "HTTP from VPC"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
  }
  
  tags = {
    Name = var.project
  }
}


resource "aws_security_group" "all-outbound" {
  name = "allow-all-outbound"
  description = "Allow all traffic outbound"
  vpc_id = aws_vpc.this.id

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = var.project
  }
}

resource "aws_security_group" "ssh-from-home" {
  name = "ssh-from-home"
  description = "Allow SSH from ZEN DSL"
  vpc_id = aws_vpc.this.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["217.155.44.110/32"]
        
    }
  tags = {
    Name = var.project
  }
}

resource "aws_security_group" "icmp-inbound" {
  name = "allow-icmp-inbound"
  description = "Allow ICMP inbound"
  vpc_id = aws_vpc.this.id

    ingress {
        from_port   = -1
        to_port     = -1
        protocol    = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.project
  }
}