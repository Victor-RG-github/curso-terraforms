resource "local_file" "productos" {
  count    = 3 #Numero de recursos a generar de este tipo
  content  = "Lista de productos para el mes próximo"
  filename = "productos-${random_string.sufix[count.index].id}.txt"
}

/*resource "local_file" "productos-1" {
  content  = "Lista de productos para el mes próximo"
  filename = "productos-${random_string.sufix-1.id}.txt"
}*/
