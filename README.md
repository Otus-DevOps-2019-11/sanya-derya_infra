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
