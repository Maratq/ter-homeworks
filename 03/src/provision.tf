# Переменная для включения provision (по умолчанию выключена)
variable "run_ansible" {
  type        = bool
  default     = false
  description = "Enable ansible playbook execution"
}

# Добавление приватного ключа в ssh-agent
resource "null_resource" "setup_ssh_agent" {
  count = var.run_ansible ? 1 : 0

  provisioner "local-exec" {
    command = "eval $(ssh-agent) && ssh-add ~/.ssh/id_ed25519"
    on_failure = continue
  }
}

# Запуск ansible-playbook
resource "null_resource" "run_ansible_playbook" {
  count = var.run_ansible ? 1 : 0

  depends_on = [
    local_file.inventory,
    null_resource.setup_ssh_agent
  ]

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ${path.module}/inventory.ini ${path.module}/playbook.yml"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
    on_failure = continue
  }

  triggers = {
    inventory_hash = filesha256("${path.module}/inventory.ini")
    playbook_hash  = fileexists("${path.module}/playbook.yml") ? filesha256("${path.module}/playbook.yml") : timestamp()
  }
}
