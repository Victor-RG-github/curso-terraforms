resource "aws_instance" "public_instance" {
  ami           = "ami-02af70169146bbdd3"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = data.aws_key_pair.key.key_name
  tags = {
    Name = "Public instance"
  }

  //lifecycle {
  //create_before_destroy = true --> si necesita destruir el recurso crea el nuevo primero
  //prevent_destroy = true --> impide que se pueda destruir
  //ignore_changes = [ ami, subnet_id ] --> ignora los cambios en estos recursos
  //replace_triggered_by = [ aws_subnet.private_subnet ] --> unicamente reconstruye el recurso cuando alguno de los recursos entre llaves cambia
  //}
}
