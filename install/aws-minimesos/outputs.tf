output "ssh_key" {
  value = "\nexport KEY=${var.private_key_file}"
}

output "instance_ip" {
  value = "\nexport IP=${aws_instance.minimesos.0.public_dns}"
}
