resource "aws_instance" "webserver1" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = var.PublicSub1_id
  vpc_security_group_ids = [var.SG_ID]
  user_data = base64encode(file("${path.module}/userdata.sh"))
}
resource "aws_instance" "webserver2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = var.PublicSub2_id
  vpc_security_group_ids = [var.SG_ID]
  user_data = base64encode(file("${path.module}/userdata.sh"))
}
  
