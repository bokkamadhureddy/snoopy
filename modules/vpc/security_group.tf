###
# Public Security Group
##
 
resource "aws_security_group" "public" {
  name = "cloudcasts-${var.infra_env}-public-sg"
  description = "Public internet access"
  vpc_id = aws_vpc.myvpc.id
 
  tags = {
    Name        = "cloudcasts-${var.infra_env}-public-sg"
    Role        = "public"
    Environment = var.infra_env
    ManagedBy   = "terraform"
  }
}
 
resource "aws_security_group_rule" "public_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 
  security_group_id = aws_security_group.public.id
}
 


resource "aws_security_group_rule" "public_in_vpc" {
  type        = "ingress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["${aws_vpc.myvpc.cidr_block}"]
 
  security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "public_in_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["82.43.52.196/32"]
  security_group_id = aws_security_group.public.id
}
 
resource "aws_security_group_rule" "public_in_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}
 
resource "aws_security_group_rule" "public_in_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "public_in_tomcat" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "public_in_database" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["${aws_vpc.myvpc.cidr_block}"]
  security_group_id = aws_security_group.public.id
}
 
###
# Private Security Group
##
 
resource "aws_security_group" "private" {
  name = "cloudcasts-${var.infra_env}-private-sg"
  description = "Private internet access"
  vpc_id = aws_vpc.myvpc.id
 
  tags = {
    Name        = "cloudcasts-${var.infra_env}-private-sg"
    Role        = "private"
    Environment = var.infra_env
    ManagedBy   = "terraform"
  }
}
 
resource "aws_security_group_rule" "private_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
 
  security_group_id = aws_security_group.private.id
}
 
resource "aws_security_group_rule" "private_in" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks = [aws_vpc.myvpc.cidr_block]
 
  security_group_id = aws_security_group.private.id
}


###
# Database Security Group
##
 
resource "aws_security_group" "database_sql" {
  name = "cloudcasts-${var.infra_env}-database-sg"
  description = "Private internet access"
  vpc_id = aws_vpc.myvpc.id
 
  tags = {
    Name        = "cloudcasts-${var.infra_env}-private-sg"
    Role        = "Database"
     Environment = var.infra_env
    ManagedBy   = "terraform"
  }
}
 
resource "aws_security_group_rule" "database_out" {
  type        = "egress"
  from_port   = 3306
  to_port     = 3306
  protocol    = "-1"
  cidr_blocks = [aws_vpc.myvpc.cidr_block]
 
  security_group_id = aws_security_group.database_sql.id
}
 
resource "aws_security_group_rule" "databse_in" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "-1"
  cidr_blocks = [aws_vpc.myvpc.cidr_block]
 
  security_group_id = aws_security_group.database_sql.id
}
