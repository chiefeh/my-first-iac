resource "aws_instance" "web_server" {
  ami = "ami-036559f6f83de21be"
  instance_type = "t4g.nano"
  availability_zone = "${var.region}a"
  subnet_id = aws_subnet.subnet-a.id
  key_name = aws_key_pair.gregory.id
  associate_public_ip_address = true
  ipv6_address_count = 1
  vpc_security_group_ids = [ aws_security_group.allow-http-https.id, aws_security_group.icmp-inbound.id, aws_security_group.all-outbound.id]
  instance_initiated_shutdown_behavior = "stop"
  iam_instance_profile = "chiefeh-amazonEC2roleforSSM"
  tags = {
    Name = var.project
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo su
              yum -y install httpd
              echo "<h1> my-first-iac.chiefeh.digital in eu-west-1</h1>" >> /var/www/html/index.html
              sudo systemctl enable httpd
              sudo systemctl start httpd
              EOF
}

output "DNS" {
  value = aws_instance.web_server.public_dns
}