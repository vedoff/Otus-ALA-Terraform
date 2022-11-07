## =========== Провайдер подключения ==================
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  zone = "ru-central1-a"
}

## =============== Создаем VM №1 ========================

# resource "yandex_compute_instance" "vm-1" {
#   name = "otus-centos"

#   resources {
#     cores  = 2
#     memory = 2
#   }

#   boot_disk {
#     initialize_params {
#       image_id = "fd88d14a6790do254kj7"
#     }
#   }

#   network_interface {
#     subnet_id = yandex_vpc_subnet.otus-yc-subnet-a.id
#     nat       = true
#   }

#   metadata = {
#     ssh-keys = "centos:${file("~/.ssh/id_ed25519.pub")}"
#     #user-data = "${file("users/user-data.yml")}"
#   }
# }

## ===================== Создаем VM №2 =============================

resource "yandex_compute_instance" "vm-2" {
  name = "otus-ubuntu"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8haecqq3rn9ch89eua"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.otus-yc-subnet-a.id
    nat       = true
  }

  metadata = {
    ssh-keys = "vedoff:${file("~/.ssh/id_ed25519.pub")}"
    #user-data = "${file("users/user-data.yml")}"
  }
}

resource "yandex_vpc_network" "otus-yc-network" {
  name = "otus-yc-network"
}

resource "yandex_vpc_subnet" "otus-yc-subnet-a" {
  name           = "otus-yc-subnet-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.otus-yc-network.id
  v4_cidr_blocks = ["10.10.2.0/24"]
}

# output "internal_ip_address_vm_1" {
#   value = yandex_compute_instance.vm-1.network_interface.0.ip_address
# }

output "internal_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.ip_address
}


# output "external_ip_address_vm_1" {
#   value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
# }

output "external_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
}
