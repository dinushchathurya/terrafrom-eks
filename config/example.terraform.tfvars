region = "us-east-1"

access_key = ""

secret_key = ""

vpc_config = {

    vpc-one = {
        vpc_cidr = "192.168.0.0/16"
        tags     = {
            Name = "my-vpc"
        }
    }

}

subnet_config = {

    "public-us-east-1a" = {
        vpc_name = "vpc-one"
        cidr_block = "192.168.0.0/18"
        availability_zone = "us-east-1a"
        tags = {
            Name = "public-us-east-1a"
        }
    }

    "public-us-east-1b" = {
        vpc_name = "vpc-one"
        cidr_block = "192.168.64.0/18"
        availability_zone = "us-east-1b"
        tags = {
            Name = "public-us-east-1b"
        }
    }

    "private-us-east-1a" = {
        vpc_name = "vpc-one"
        cidr_block = "192.168.128.0/18"
        availability_zone = "us-east-1a"
        tags = {
            Name = "private-us-east-1a"
        }
    }

    "private-us-east-1b" = {
        vpc_name = "vpc-one"
        cidr_block = "192.168.192.0/18"
        availability_zone = "us-east-1b"
        tags = {
            Name = "private-us-east-1b"
        }
    }

}

internet_gateway_config = {
    
    "igw-one" = {
        vpc_name = "vpc-one"
        tags = {
            Name = "igw-one"
        }
    }
    
}

elastic_ip_config = {
    
    "eip-one" = {
        tags = {
            Name = "eip-one"
        }
    }

    "eip-two" = {
        tags = {
            Name = "eip-two"
        }
    }
    
}

nat_gateway_config = {
    
    "nat-one" = {
        eip_name    = "eip-one"
        subnet_name = "public-us-east-1a"
        tags        = {
            Name = "nat-one"
        }
    }

    "nat-two" = {
        eip_name    = "eip-two"
        subnet_name = "public-us-east-1b"
        tags         = {
            Name = "nat-two"
        }
    }
    
}

route_table_config = {

    public-table-one = {
        private  = 0
        vpc_name = "vpc-one"
        gateway_name = "igw-one"
        tags = {
            Name = "public-one"
        }
    }

    private-table-one = {
        private  = 1
        vpc_name = "vpc-one"
        gateway_name = "nat-one"
        tags = {
            Name = "private_one "
        }
    }

    private-table-two = {
        private  = 1
        vpc_name = "vpc-one"
        gateway_name = "nat-two"
        tags = {
            Name = "private_two"
        }
    }

}

route_table_association_config = {

    route-table-association-one = {
        subnet_name      = "public-us-east-1a"
        route_table_name = "public-table-one"
    }

    route-table-association-two = {
        subnet_name      = "public-us-east-1b"
        route_table_name = "public-table-one"
    }

    route-table-association-three = {
        subnet_name      = "private-us-east-1a"
        route_table_name = "private-table-one"
    }

    route-table-association-four = {
        subnet_name      = "private-us-east-1a"
        route_table_name = "private-table-two"
    }

}