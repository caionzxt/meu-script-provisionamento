

#!/bin/bash

echo "Atualizando o servidor..."
sudo apt update && sudo apt upgrade -y

echo "Instalando Apache2 e Unzip..."
sudo apt install apache2 unzip -y

echo "Baixando a aplicação..."
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

echo "Descompactando os arquivos..."
unzip main.zip

echo "Copiando os arquivos para o diretório do Apache..."
sudo cp -R linux-site-dio-main/* /var/www/html/

echo "Ajustando permissões..."
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

echo "Reiniciando o Apache..."
sudo systemctl restart apache2

echo "Provisionamento concluído!"
