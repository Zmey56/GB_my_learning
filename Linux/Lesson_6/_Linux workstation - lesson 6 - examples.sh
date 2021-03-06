#################################################################### Разбор ДЗ
1	Создать файл file1 и наполнить его произвольным содержимым. Скопировать его в file2. Создать символическую ссылку file3 на file1. Создать жёсткую ссылку file4 на file1. Посмотреть, какие inode у файлов. Удалить file1. Что стало с остальными созданными файлами? Попробовать вывести их на экран.
# Создать файл file1 и наполнить его произвольным содержимым.
echo 'some content...' > file1

# Скопировать его в file2. 
cp file1 file2

# Создать символическую ссылку file3 на file1. 
ln -s file1 file3

# Создать жёсткую ссылку file4 на file1. 
ln file1 file4

# Посмотреть, какие inode у файлов. 
ls -li

# Удалить file1. Что стало с остальными созданными файлами? 
rm file1
ls -li
	Жёсткая ссылка продолжает корректно работать. 
	Символическая ссылка сломалась.

# Попробовать вывести их на экран.
cat file4
	Видим содержимое файла
cat file3
	Нет такого файла или каталога


2	Дать созданным файлам другие, произвольные имена. Создать новую символическую ссылку. Переместить ссылки в другую директорию.
# Дать созданным файлам другие, произвольные имена. 
mv file1 file11
mv file2 file22

# Создать новую символическую ссылку. 
ln -s file11 file11_symlink
ln -s $(pwd)/file22 file22_symlink

# Переместить ссылки в другую директорию.
mkdir links
mv *_symlink links/


3	Создать два произвольных файла. Первому присвоить права на чтение и запись для владельца и группы, только на чтение — для всех. Второму присвоить права на чтение и запись только для владельца.
# создаем файлы
echo "first file" > file1
echo "second file" > file2

# меняем права file1 числовыми значениями
chmod 664 file1

# меняем права file2 буквенными значениями
chmod u=rw,g-rw,o-r file2


4	Создать пользователя, обладающего возможностью выполнять действия от имени суперпользователя.
# добавляем нового пользователя (нужен sudo)
sudo useradd user11

# дадим user1 права суперпользователя (добавив его ключом “-G” в группу “sudo”)
sudo usermod -G sudo user11


5	* Создать группу developer и нескольких пользователей, входящих в неё. Создать директорию для совместной работы. Сделать так, чтобы созданные одними пользователями файлы могли изменять другие пользователи этой группы.
# Создадим нескольких пользователей (разными способами)
sudo useradd -m -s /bin/bash devuser1
sudo useradd -m -s /bin/bash devuser2

# Создать группу developer
sudo groupadd developers

# добавим в группу наших пользователей
sudo usermod -aG developers devuser1
sudo usermod -aG developers devuser2

# Создать директорию для совместной работы. 
mkdir devs_dir
ll

# Сделать так, чтобы созданные одними пользователями файлы могли изменять другие пользователи этой группы.
## сменим группу владельцев папки на developers
sudo chown -R :developers .

## поменяем права на папку, подняв SGID bit
sudo chmod -R 2774 .


6	* Создать в директории для совместной работы поддиректорию для обмена файлами, но чтобы удалять файлы могли только их создатели.
# создадим папку
mkdir shared_dir

# поднимем для нее и всего содержимого Sticky bit
chmod +t -R shared_dir/


7	* Создать директорию, в которой есть несколько файлов. Сделать так, чтобы открыть файлы можно было, только зная имя файла, а через ls список файлов посмотреть было нельзя.
•	Способ 1: скрытый файл
touch .file1
ls
	Файл не отображается

•	Способ 2: права 000 на папку
mkdir restricted-dir

# забираем права даже на просмотр у всей папки
sudo chmod 000 –R restricted-dir


#################################################################### Bash
# пример запуска скрипта
cat > script1.sh
#!/bin/bash
echo It works! # code comment sample
echo "Working dir: " $(pwd)
echo "User name: " $USER
echo "OS: " $(uname)
Ctrl+d


# Добавляем разрешение на выполнение
chmod +x script1.sh

# Проверяем
ls -l

# Запускаем
./script1.sh

#################################################################### Циклы
# Цикл for in
for char in {1..10}; do echo $char; done

for n in {1..4}
  do 
    echo "Linux является одной из самых безопасных операционных систем"
  done

# Если вам необходимо часто использовать такую конструкцию, тогда не помешает 
# создать соответствующую bash-функцию (добавьте в ~/.bashrc)
function run() {
	number=$1
	shift
	for n in $(seq $number); do
  	$@
	done
}

# run 5 <КОМАНДА>

# Пример
run 5 echo "Я умею использовать операционную систему Windows Server Standart 2012 R2"

#################################################################### Условия
# скрипт, проверяющий введенный возраст и выдающий соответствующее приветствие
cat > age_check
#!/bin/bash
if [ $1 == 18 ]; then
	echo "Предъявите документы"
elif [ $1 -lt 18 ]; then
	echo "Вход только для взрослых"
elif [ $1 -gt 18 ]; then
	echo "Добро пожаловать"
fi

# запустим скрипт с разными параметрами
bash age_check 10
bash age_check 18
bash age_check 20

#################################################################### Условия
nano burger_cost

#!/bin/bash
case $1 in
  10)
    echo "Дайте два!"
    ;;
  100)
    echo "Хорошо,  спасибо"
    ;;
  50 | 60)
    echo "Колу со льдом, пожалуйста!"
    ;;
  *)
    echo "Что, простите?"
    ;;
esac

# запуск
bash burger_cost 10
bash burger_cost 50
bash burger_cost 100
bash burger_cost asdfas

#################################################################### Циклы
# Цикл while

# Цикл while будет в работе, пока условие, заданное в списке команды 1, будет верным
y=1
while [ $y -lt 10 ]
do
  echo $y
  y=$(( $y + 1 ))
done


#################################################################### Цикл until
# Пример цикла until
#!/bin/bash
POINTER=20
until [ $POINTER -lt 10 ]
do
  echo POINTER $POINTER
  let POINTER-=1
done


#################################################################### Настройка планировщика Cron в Linux
# справка
crontab --help

# просмотр списка заплалнированных команд текущего пользователя
crontab -l

# редактирование списка задач текущего пользователя
crontab –e

# удаление списка задач текущего пользователя
crontab -r

# шпаргалка по синтаксису
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * [user-name]  command to be executed

# сайт тренажера
https://crontab.guru/

# примеры cron из методички
# Выполнять задание в 19 часов 5 минут 15 мая, если это пятница
5 19 15 5 5 /var/www_mysite/myssqlss.pl

# Выполнять задание раз в два часа в 10 минут текущего часа 
# (то есть в 00:10, 02:10, 04:10 и т.д.)
10 */2 * * * /var/www_mysite/mysql_script.pl

# Выполнять задание каждые десять часов в 10 минут текущего часа 
# (то есть в 00:10, 10:10 и т.д.)
10 */10 * * /var/www_mysite/exescripts.pl

# Выполнять задание по воскресеньям в 12 часов 26 минут:
26 12 * * 0 /var/www_mysite/myscript.sh

# Выполнять в 10 утра каждый день:
0 10 * * * /var/www_mysite/myscript.sh

# путь к файлу с задачами cron для текущего пользователя
sudo cat /var/spool/cron/crontabs/student

# системные задачи лежат в файле
cat /etc/crontab

# просмотр логов 
grep cron /var/log/syslog

