variable "aws_key_pair" {
  default = "../AWS/ec2-key-pair/default-ec2.pem"
}

# data source to get the subnet ids from the default VPC
data "aws_subnet_ids" "default_subnet_ids" {
  vpc_id = aws_default_vpc.default_vpc.id
}

# ami data provider
data "aws_ami" "aws_linux_2_latest" {
  most_recent = true
  owners      = ["amazon"] # the images provided by Amazon only
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}

# data provider for aws_ami_ids
data "aws_ami_ids" "aws_linux_2_latest_ids" {
  owners = ["amazon"]
}

# creating an EC2 instance
resource "aws_instance" "http_server" {
  # ami                    = "ami-061ac2e015473fbe2" #"ami-0ed9277fb7eb570c9" ami-061ac2e015473fbe2
  ami                    = "ami-0ed9277fb7eb570c9"
  instance_type          = "t2.micro"
  key_name               = "default-ec2"
  vpc_security_group_ids = [aws_security_group.http_server_sg.id]
  # subnet_id              = "subnet-060297485034a45d6"    # hardcoded value
  subnet_id = tolist(data.aws_subnet_ids.default_subnet_ids.ids)[1] # using data source for aws_subnet_ids

  # connecting to the EC2 instance
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file(var.aws_key_pair)
  }

  provisioner "remote-exec" {
    # inline is list of commands to be run in AMI
    inline = [
      "sudo yum install httpd -y",                                                                      # install httpd (deamon) server. yum is package manager already installed on the EC2 instance
      "sudo service httpd start",                                                                       # start the server
      "echo Welcome to The virtual server is at ${self.public_dns} | sudo tee /var/www/html/index.html" # copy a file
    ]
  }
}

# public dns = http://ec2-100-25-22-79.compute-1.amazonaws.com/
