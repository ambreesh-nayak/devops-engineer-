resource "aws_vpc" "vnet" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name = "vpc-tf-b29"
    }
}

resource "aws_subnet" "pub" {
  vpc_id = aws_vpc.vnet.id
  cidr_block = var.subnet_cidr_block[0]
  availability_zone = var.az[0]
  map_public_ip_on_launch = var.public_ip
  tags = {
    Name = "Public-Subnet"
  }
}


resource "aws_subnet" "pri" {
  vpc_id = aws_vpc.vnet.id 
  cidr_block = var.subnet_cidr_block[1]
  availability_zone = var.az[1]
  map_public_ip_on_launch = var.no_public_ip 
  tags = {
    Name = "Private-Subnet"
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

resource "aws_eip" "static" {
    domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  subnet_id = aws_subnet.pub.id 
  allocation_id = aws_eip.static.id 
  tags = {
    Name = "nat-vpc-tf-b29"
  }
}

resource "aws_route_table" "rtp" {
    vpc_id = aws_vpc.vnet.id 
    tags = {
        Name = "RT-Private"
    }

    route {
        nat_gateway_id = aws_nat_gateway.nat.id 
        cidr_block = "0.0.0.0/0"
    }

}

resource "aws_route_table_association" "rtap"{
    subnet_id = aws_subnet.pri.id 
    route_table_id = aws_route_table.rtp.id
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
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key
    subnet_id = aws_subnet.pub.id 
    vpc_security_group_ids = [aws_security_group.firewall.id]
    tags = {
        Name = "Public-VM"
    }
}

resource "aws_instance" "vmp" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key
    subnet_id = aws_subnet.pri.id 
    vpc_security_group_ids = [aws_security_group.firewall.id]
    tags = {
        Name = "Private-VM"
    }
}
