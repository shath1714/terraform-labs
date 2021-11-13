#EC2 Instances with user data
#DEV-SERVER
resource "aws_instance" "dev-server" {
  ami                  = "ami-01cc34ab2709337aa"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  #subnet_id     = aws_subnet.public_1.id

  # Security group assign to instance

  user_data = <<EOF
	#!/bin/bash
       yum install python3 python3-pip git -y
       pip3 install flask python-dotenv flask-cors boto3
       git clone https://github.com/mimsand/quote-app.git /home/ec2-user/quote-app/
       curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
       export NVM_DIR="$HOME/.nvm"
       [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
       . ~/.nvm/nvm.sh
       nvm install node

	EOF

  tags = {
    Name = "DEV-SERVER"
  }
}

#BACKEND-SERVER
resource "aws_instance" "backend-server" {
  ami                  = "ami-01cc34ab2709337aa"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
  #subnet_id     = aws_subnet.public_1.id

  # Security group assign to instance


  user_data = <<EOF
	#!/bin/bash
       yum install python3 python3-pip git -y
       pip3 install flask python-dotenv flask-cors boto3
       git clone https://github.com/mimsand/quote-app.git /home/ec2-user/quote-app/
       cp /home/ec2-user/quote-app/backend/flask.service
       /etc/systemd/system/flask.service
       systemctl start flask
       systemctl enable flask

	EOF

  tags = {
    Name = "Backend-SERVER"
  }

}