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
