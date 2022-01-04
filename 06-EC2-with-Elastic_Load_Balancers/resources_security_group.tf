# data provider aws_default_vpc which provide a resource to manage aws_default_vpc
resource "aws_default_vpc" "default_vpc" {
  tags = {
    name = "default_vpc"
  }
}


# Security group for EC2 instances
resource "aws_security_group" "http_server_sg" {
  name = "http_server_sg"
  # vpc_id = "vpc-0cb9300fd16e54408"      # hardcoded value
  vpc_id = aws_default_vpc.default_vpc.id # using aws_default_vpc data provider

  # INGRESS for HTTP requests
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # INGRESS for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # INGRESS for HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0 # allow traffic to anywhere
    to_port     = 0
    protocol    = -1 # when protocol= -1 then from_port and to_port must be = 0 (-1)=> all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "http_server_sg"
  }
}

# Security group for Load Balancer

resource "aws_security_group" "elb_sg" {
  name = "elb_sg"
  # vpc_id = "vpc-0cb9300fd16e54408"      # hardcoded value
  vpc_id = aws_default_vpc.default_vpc.id # using aws_default_vpc data provider

  # INGRESS for HTTP requests
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # INGRESS for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # INGRESS for HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0 # allow traffic to anywhere
    to_port     = 0
    protocol    = -1 # when protocol= -1 then from_port and to_port must be = 0 (-1)=> all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "elb_sg"
  }
}
