### Домашнее задание
Первый терраформ скрипт

Цель: 
- реализовать терраформ для разворачивания одной виртуалки в yandex-cloud 
- запровиженить nginx с помощью ansible \
для сдачи: 
- репозиторий с терраформ манифестами 
- README файл
### Выполнение:
1. Скачать git
2. Провижин виртуальной машины используем `terraform`
 - Перейти в папку otus-yc
 - выполнить: \
 `terraform plan` \
 `terraform apply`
 
3. Устанавливаем `nginx`
 - Перейти в папку `nginx`
 - выполнить: \
   `terraform output` \
   Получим: \
   `external_ip_address_vm_2 = "ip address"` \
   `internal_ip_address_vm_2 = "10.10.2.24"` \
   Вписать полученный ip для `external_ip_address_vm_2` в `hosts` \
   Выполнить: \
   `ansible-playbook play.yml`
   #### Проверка:
   `http://external_ip_address_vm_2:8088/` \
   `http://external_ip_address_vm_2:8080/`
 
