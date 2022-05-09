resource "aws_instance" "testinstance"{
    ami = ""
    instance_type = "t3.micro"
    subnet_id = ""
    assoicate_public_ip_address "true"
    vpc_security_group_ids = ""
}