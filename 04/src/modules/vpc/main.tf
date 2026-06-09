# Используем существующую сеть default
data "yandex_vpc_network" "this" {
  name = var.network_name
}

# Создаём подсеть в существующей сети
resource "yandex_vpc_subnet" "this" {
  name           = var.env_name
  zone           = var.zone
  network_id     = data.yandex_vpc_network.this.id
  v4_cidr_blocks = [var.cidr]
}
