#Homework №9 Ansible-2
- Для конфигурации окружения были использованы playbooks, handlers и templates.
- Сценарий был рабит на несколько в рамках ондного плейбука.
- Далее каждый сценарий вынесен в обдельный playbook: app, db & deploy.
- В конфигурации пакера для билда образов shell-скрипты заменены на плейбуки ansible.

#Homework №8 Ansible-1
- Установлен Ansible.
- Рассмотрены базовые функции и стуктура inventory файла.
- Произведено вполнение различных модулей: commad, shell, service, ping.
- Написан плейбук.
-- После выполнения комманды: "ansible app -m command -a 'rm -rf ~/reddit'" и повторного запуска плейбука,
 в выводе PlayRecap отобразилось изменение (changed), т.к. директория reddit была вновь создана.

#Homework №7 Terraform-2:
- Созданы два шаблона Paker для билда VM (app и db);
- Выполнено разбиение конфигурации на модули: app, db и vpc;
- параметризирован модуль vpc: параметр позволяет задавать допустимые IP адераса для доступа по ssh;
- создана инфраструктура для двух окружений stage и prod;
- Создан bucket c помощью модуля HashiCorp storage-backet;

Задание со *:
  State двух окружений перемещен в bucket GCP, локальный стейт перемещен,
terraform при этом видит текущее состояние.
  При одновременном запуске конфигураций в двух окружения происходит блокировка одной из конфигурации,
выводится сообщение, что данный ресурс уже существует.
- Созданы два шаблона Paker для билда VM (app и db);

#HomeWork №6 Terraform-1:

- Установлен terraform v0.12.18;
- Запущен инстанс средствами terraform;
- В мета-данных определен ssh-ключ пользователя;
- Настроен вывод IP адерса созданного инстанса в выходную переменную;
- Описаны правила  firewall для новых инстансов;
- Добавлены provisioners для автоматической установки приложения в момент создания ресурса;
- Параметризирован конфигурационный файл (main.tf) с входных переменных (variables.tf, terraform.tfvars).

Задание со *:
При добавлении ssh-ключа в инстанс через веб-консоль GCP и дальнейшем применеии terrafom apply,
ключ добавленный через веб-консоль затирается, остаются только ключи, добавленные через terraform
 ssh-keys = "appuser:${file(var.public_key_path)} \nappuser1:${file(var.public_key_path)
 \nappuser2:${file(var.public_key_path)}"
Задание с **:
Реализован подход с созданием двух инстансов через параметр ресурса count.
Балансировщик настроен не был.

#HomeWork № 5 Paker-Base:

- Установлен ACD;
- Установлен Packer;
- Создан template;
- С помощью Packer создан образ VM;
- Расмотрены варианты использования пользовательских переменных,
а тажке обязательных переменных;
- На практике отработан подход Immutable infrastracture.

#Подключение к someinternalhost в одну строку:
ssh -i ~/.ssh/appuser -A -tt  appuser@35.195.249.162 ssh -tt 10.132.0.3
#Прописать в ~/.ssh/config алиас:
Host bastion
	HostName 35.195.249.162
	User appuser
Host someinternalhost
	Hostname 10.132.0.3
	User appuser
	ProxyCommand ssh -W %h:%p bastion
bastion_IP = 35.195.249.162
someinternalhost_IP = 10.132.0.3

#Адрес и порт для подключения к приложению
testapp_IP = 34.90.158.154
testapp_port = 9292

#Команда gcloud для создания правила в firewall
gcloud compute firewall-rules create default-puma-server --target-tags=puma-server --allow=tcp:9292
gcloud compute instances create reddit-app1  --boot-disk-size=10GB   --image-family ubuntu-1604-lts   --image-project=ubuntu-os-cloud   --machine-type=g1-small   --tags puma-server   --restart-on-failure --metadata-from-file startup-script=startup_script.sh
