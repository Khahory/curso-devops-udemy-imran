# variables
# PACKAGE="httpd wget unzip"
# SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2096_individual.zip"
ART_NAME='2096_individual'
TEMPDIR='/tmp/webfiles'

# comando para saber si dara un error (si es 0, es porque se ejecuto)
# &> /dev/null lo hacemos para que no muestre nada en terminal

#vamos a validar el ultimo estado de la ejecucion de un comando
yum

if [ $? -eq 0 ]
then
 PACKAGE="httpd wget unzip"
 SVC="httpd"
 echo "Running on CentOS"
 sudo yum install $PACKAGE -y > /dev/null

 sudo systemctl start $SVC
 sudo systemctl enable $SVC

 mkdir -p $TEMPDIR
 cd $TEMPDIR

 wget $URL
 unzip $ART_NAME.zip > /dev/null
 sudo cp -r $ART_NAME/* /var/www/html/

 systemctl restart $SVC

 rm -rf $TEMPDIR

else
 echo "Running on Ubuntu"
 PACKAGE="apache2 wget unzip"
 SVC="apache2"
 sudo apt update
 sudo apt install $PACKAGE -y > /dev/null

 sudo systemctl start $SVC
 sudo systemctl enable $SVC

 mkdir -p $TEMPDIR
 cd $TEMPDIR

 wget $URL
 unzip $ART_NAME.zip > /dev/null
 sudo cp -r $ART_NAME/* /var/www/html/

 systemctl restart $SVC

 rm -rf $TEMPDIR
fi