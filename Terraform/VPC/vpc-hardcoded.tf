resource "aws_vpc" "vnet" {
    cidr_block = "192.168.0.0/16"
    tags = {
        Name = "vpc-tf-b29"
    }
}

resource "aws_subnet" "pub" {
  vpc_id = aws_vpc.vnet.id
  cidr_block = "192.168.0.0/22"
  availability_zone = "eu-north-1a"
  map_public_ip_on_launch = true 
  tags = {
    Name = "Public-Subnet"
  }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vnet.id 
    tags = {
        Name = "igw-vpc-tf-29"
    }
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.vnet.id 
    tags = {
        Name = "RT-Public"
    }

    route {
        gateway_id = aws_internet_gateway.igw.id 
        cidr_block = "0.0.0.0/0"
    }
}

resource "aws_route_table_association" "rta" {
    subnet_id = aws_subnet.pub.id 
    route_table_id = aws_route_table.rt.id 
}

resource "aws_security_group" "firewall" {
    vpc_id = aws_vpc.vnet.id 
    name = "vpc-tf-b29-sg-rules"

    ingress {
        from_port = 22
        to_port = 22 
        protocol = "tcp" 
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0 
        to_port = 0 
        protocol = "-1" 
        cidr_blocks = ["0.0.0.0/0"]
    }

}


resource "aws_instance" "vm" {
    ami = "ami-043339ea831b48099"
    instance_type = "t3.micro"
    key_name = "ssh-key"
    subnet_id = aws_subnet.pub.id 
    vpc_security_group_ids = [aws_security_group.firewall.id]
    tags = {
        Name = "Webserver"
    }
}

