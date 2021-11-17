sudo apt-get install apache2		#instala apache, acceso al localhost
sudo a2enmod ssl			#instala módulo ssl para apache
sudo a2ensite default-ssl		#config por defecto de apache para ssl
sudo /etc/init.d/apache2 restart 	#reiniciar apache, aplicar cambios

cd /etc/apache2
sudo openssl genrsa -des3 -out server.key 2048 		#crear llave cifrado
sudo openssl req -new -key server.key -out server.csr 	#crear certificado
	#*rellenar datos 
sudo openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt 	#el certificado estara habilitado por 365 dias

#copiar llave y certificado a la carpeta correspondiente de apache
sudo cp server.key /etc/ssl/private/
sudo cp server.crt /etc/ssl/certs/

#redirigir configuración de apache hacia esos archivos
cd /etc/apache2/sites-available
sudo gedit default-ssl.conf
	#*modificar líneas:
		#SSLCertificateFile /etc/ssl/certs/server.crt
		#SSLCertificateKeyFile /etc/ssl/private/server.key
	#*descomentar línea:
		#SSLOptions +FakeBasicAuth +ExportCertData +StrictRequire

#volver a habilitar el archivo
sudo a2ensite default-ssl	
sudo /etc/init.d/apache2 restart 	#reiniciar apache, aplicar cambios

#en el navegador 
#Añadir excepción → Confirmar excepción de seguridad

