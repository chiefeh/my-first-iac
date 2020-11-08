resource "aws_route53_record" "chiefeh-digital" {
  zone_id = var.ROUTE53_ZONEID
  name = "my-first-iac.chiefeh.digital"
  type = "A"
  ttl = "300"
  records = [aws_instance.web_server.public_ip]
}