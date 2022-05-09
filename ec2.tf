resource "aws_instance" "testinstance"{
    ami = "ami-09d56f8956ab235b3"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.public-subnet-1.id
    associate_public_ip_address = true
    vpc_security_group_ids = aws_security_group.ec2-aws-security.id
    key_name = "test"
}

resource "aws_security_group" "ec2-aws-security" {
    vpc_id = "${aws_vpc.test-env.id}"
ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
from_port = 22
    to_port = 22
    protocol = "tcp"
  }
// Terraform removes the default rule
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}
  