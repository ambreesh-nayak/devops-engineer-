
resource "aws_security_group" "firewall" {
    vpc_id = var.vpc_id
    name = "tf-ec2-demo-sg"


# inbound rules(incoming traffic)
    ingress {   
        from_port = 22 
        to_port = 22 
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80 
        to_port = 80 
        protocol = "tcp" 
        cidr_blocks = ["0.0.0.0/0"]
    }
# outbound rules(outgoing traffic)
    egress {
        from_port = 0 
        to_port = 0 
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}


resource "aws_instance" "vm" {

    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key
    vpc_security_group_ids = [aws_security_group.firewall.id]
    user_data = <<-EOF
    #!/bin/bash
    sudo -i
    yum install httpd -y
    systemctl start httpd 
    systemctl enable httpd 
    echo "Hello Terraform Again" > /var/www/html/index.html
    EOF

    tags = {
        Name = "webserver-03"
    }
}

