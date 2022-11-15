output "for_output_list" {
  description = "Output with list"
  value       = [for instance in aws_instance.myec2vm : instance.public_dns]
}

output "for_output_map1" {
  description = "Output with map"
  value       = { for instance in aws_instance.myec2vm : instance.id => instance.public_dns }
}

output "for_output_map2" {
  description = "For Loop with Map -  Advanced"
  value       = { for c, instance in aws_instance.myec2vm : c => instance.public_dns }
}

output "splat_instance_publicdns" {
  description = "Splat Operator"
  value       = aws_instance.myec2vm[*].public_dns
}
