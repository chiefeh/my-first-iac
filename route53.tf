resource "aws_route53_record" "chiefeh-digital" {
  zone_id = env.route53_zoneid
  name = "my-first-iac.chiefeh.digital"
  type = "A"
  ttl = "300"
  records = [aws_instance.web_server.public_ip]
}