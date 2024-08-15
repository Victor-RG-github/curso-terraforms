variable "instances" {
  description = "List of instance names"
  type        = list(string)
  default     = ["apache", "mysql", "jumpserver"]
}


resource "aws_instance" "conditional_instance" {
  count                  = var.deploy_conditional ? 1 : 0
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  tags = {
    "Name" : "conditional_instance"
  }
}

resource "aws_instance" "public_instance" {
  for_each = toset(var.instances) // Mejor que count
  //count                  = length(var.instances)
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  tags = {
    //"Name" : var.instances[count.index]
    "Name" : each.value
  }
  # tags = {
  #   Name = "Public instance"
  # }
  # user_data = file("scripts/user_data.sh") // Esto ejecuta en remoto el contenido de ese script al deployar

  # provisioner "local-exec" {
  #   command = "echo instance created with ip ${aws_instance.public_instance.public_ip} >> instance_data.txt"
  # }

  # provisioner "local-exec" {
  #   when    = destroy
  #   command = "echo instance with ip ${self.public_ip} destroy >> instance_data.txt"
  # }

  # provisioner "remote-exec" {
  #   inline = ["echo 'hola mundo' > ~/saludo.txt"]
  #   connection {
  #     type        = "ssh"
  #     host        = self.public_ip
  #     user        = "ercs-vrg"
  #     private_key = file("ercs-vrg-key.pem")
  #   }
  # }

  //lifecycle {
  //create_before_destroy = true --> si necesita destruir el recurso crea el nuevo primero
  //prevent_destroy = true --> impide que se pueda destruir
  //ignore_changes = [ ami, subnet_id ] --> ignora los cambios en estos recursos
  //replace_triggered_by = [ aws_subnet.private_subnet ] --> unicamente reconstruye el recurso cuando alguno de los recursos entre llaves cambia
  //}
}

