cidr_blocks = [
  { cidr_block = "10.0.0.0/16" },
  { cidr_block = "10.0.1.0/24" },
  { cidr_block = "10.0.2.0/24" }
]
env_prefix = "Dev-Env"
region = "us-east-1"
values              = ["amzn2-ami-hvm-*-x86_64-gp2"]
public_key_location = "~/.ssh/id_rsa.pub"
instance_type       = "t2.micro"