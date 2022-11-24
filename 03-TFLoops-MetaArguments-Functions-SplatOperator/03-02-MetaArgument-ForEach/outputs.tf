output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value = toset([
    for myec2vm in aws_instance.myec2vm : myec2vm.public_dns
  ])
}

output "instance_publicdns2" {
  value = tomap({
    for s, myec2vm in aws_instance.myec2vm : s => myec2vm.public_dns
    # S intends to be a subnet ID
  })
}
