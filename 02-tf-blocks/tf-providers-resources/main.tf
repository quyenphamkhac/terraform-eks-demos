resource "aws_instance" "myec2vm" {
  ami           = "ami-094bbd9e922dc515d"
  instance_type = "t3.micro"
  user_data     = file("${path.module}/app1-install.sh")
  tags = {
    "Name" = "EC2 Demo"
  }
}
