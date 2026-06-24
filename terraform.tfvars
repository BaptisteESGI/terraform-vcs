public_key         = file(pathexpand("~/.ssh/id_rsa.pub"))
instance_name      = "MyServer"
allowed_http_cidrs = ["62.160.154.0/24", "92.168.3.0/24"]
allowed_ssh_cidrs  = ["62.160.154.0/24", "92.168.3.0/24"]