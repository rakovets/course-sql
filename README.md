# course-sql

## Домашнее задание из уроков

### Домашнее задание из урока 1-2

Создайте базу данных, которая содержит таблицу с информацией о книгах. Названия необходимых полей продумайте самостоятельно. Используйте все знания, полученные вами к этому моменту.

### Домашнее задание из урока 3

В домашнем задании к уроку No2 необходимо было создать базу данных «Больница» с таблицей «Patients», заполните эту таблицу произвольными данными с использованием оператора INSERT (не менее десяти записей) и напишите следующие SQL-запросы:
- вывести информацию обо всех пациентах, находящихся в больнице;
- показать данные о пациентах, которые лежат в определенном отделении;
- вывести названия всех отделений больницы;
- получить данные о пациентах, которые лежат в больнице больше месяца, отсортировав их по возрастанию даты поступления;
- вывести информацию о пациентах, которые были выписаны в прошлом месяце (вам поможет стандартная функция GETDATE() языка T-SQL, которая позволяет получить текущую дату);
- показать информацию о пациентах, которые лежали в больнице с октября по декабрь прошлого года в определенном отделении;
- вывести информацию о самом молодом пациенте и его возраст (для написания этого запроса вам следует самостоятельно изучить стандартную функцию DATEDIFF(), информацию о которой вы можете получить по следующей ссылке https://docs.microsoft.com/en-us/sql/t-sql/functions/datediff-transact-sql);
- получить информацию о пациентах, которые лежат в любых трех отделениях;
- показать всех пациентов, фамилия которых начинается на букву Р;
- вывести данные о пациентах, которых лечит определенный врач с одинаковыми заболеваниями;
- получить данные о пациентах, пользующихся услугами определенного мобильного оператора;
- переименовать название определенного отделения;
- удалить всех пациентов, которые были выписаны больше чем полгода назад.

### Домашнее задание из урока 4

1. В домашнем задании к уроку No3 вам необходимо было создать однотабличную базу данных, в которой должна содержаться произвольная информация о некой виртуальной больнице. Мы предлагаем вам:
- Создать на ее основе многотабличную базу данных, которая должна соответствовать нормальной форме Бойса-Кодда;
- Cоздать диаграмму этой базы данных;
- Написать многотабличные SQL-запросы к этой базе данных:
    - вывести информацию обо всех пациентах, находящихся в больнице;
    - показать данные о пациентах, которые лежат в определенном отделении;
    - получить данные о пациентах, которые лежат в больнице больше месяца, отсортировав их по возрастанию даты поступления;
    - вывести информацию о пациентах, которые были выписаны в прошлом месяце;
    - показать информацию о пациентах, которые лежали в больнице с октября по декабрь прошлого года в определенном отделении;
    - вывести данные о пациентах, которых лечит определенный врач с одинаковыми заболеваниями.

### Домашнее задание из урока 5
1. Вам необходимо создать многотабличную базу данных, содержащую информацию о вымышленном фитнес клубе, которая должна содержать следующие таблицы: инструкторы, секции, посетители и т.д.
2. Используя полученные в этом уроке знания, написать к созданной вами базе данных следующие SQL-запросы:
- вывести количество инструкторов по каждой секции;
- показать количество людей, которые должны заниматься в определенный момент времени в каждой секции;
- вывести количество посетителей фитнес клуба, которые пользуются услугами определенного мобильного оператора;
- получить количество посетителей, у которых фамилия совпадает с фамилиями из определенного списка;
- показать количество людей с одинаковыми именами, которых занимаются у определенного инструктора;
- получить информацию о людях, которые посетили фитнес зал минимальное количество раз;
- вывести количество посетителей, которые занимались в определенной секции за первую половину текущего года;
- определить общее количество людей, посетивших фитнес зал за прошлый год.

### Домашнее задание из урока 6

1. Вам необходимо создать многотабличную базу данных Airport, в которой должна содержаться информация, связанная с работой аэропорта. В этой базе данных обязательно должны быть следующие таблицы:
- рейсы самолетов
- билеты на рейсы (бизнес и эконом класс)
- пассажиры
2. Используя полученные в этом уроке знания, вам необходимо написать к созданной базе Airport следующие SQL-запросы:
- вывести все рейсы в определенный город на произвольную дату, упорядочив их по времени вылета;
- вывести информацию о рейсе с наибольшей длительностью полета по времени;
- показать все рейсы, длительность полета которых превышает два часа;
- получить количество рейсов в каждый город;
- показать город, в который наиболее часто осуществляются полеты;
- получить информацию о количестве рейсов в каждый город и общее количество рейсов за определенный месяц;
- вывести список рейсов, вылетающих сегодня, на которые есть свободные места в бизнес классе;
- получить информацию о количестве проданных билетов на все рейсы за указанный день и их общую сумму;
- вывести информацию о предварительной продаже билетов на определенную дату с указанием всех рейсов и количестве проданных на них билетов;
- вывести номера всех рейсов и названия всех городов, в которые совершаются полеты из данного аэропорта.

## Домашнее задание

Database `Academy`

### Домашнее задание № 1

Тема: Введение в теорию баз данных.

1. Установить приложение Microsoft SQL Server.
2. Установить приложение Microsoft SQL Server Management Studio.

### Домашнее задание № 2

Тема: Основы взаимодействия с Microsoft SQL Server.

Необходимо создать базу данных Академия (Academy), которая будет содержать информацию о сотрудниках и внутреннем устройстве академии. Преподаватели, читающие лекции в академии представ лены в виде таблицы Преподаватели (Teachers), в которой собрана основная информация, такая как: имя, фамилия, данные о зарплате, а также дата приема на работу. Также в базе данных присутствует информация о группах, хранимая в таблице Группы (Groups). Данные об факультетах и кафедрах содержатся в таблицах Факультеты (Fa­cul­ties) и Кафедры (Departments) соответственно.

### Домашнее задание № 3

Тема: Запросы SELECT, INSERT, UPDATE, DELETE.

Вывести:
- таблицу кафедр, но расположить ее поля в обратном порядке
- названия групп и их рейтинги с уточнением имен полей именем таблицы
- для преподавателей их фамилию, процент ставки по отношению к надбавке и процент ставки по отношению к зарплате (сумма ставки и надбавки)
- таблицу факультетов в виде одного поля в следующем формате: “The dean of faculty [faculty] is [dean].”
- фамилии преподавателей, которые являются профессорами и ставка которых превышает 1050
- названия кафедр, фонд финансирования которых меньше 11000 или больше 25000
- названия факультетов кроме факультета “Computer Science”
- фамилии и должности преподавателей, которые не являются профессорами
- фамилии, должности, ставки и надбавки ассистентов, у которых надбавка в диапазоне от 160 до 550
- фамилии и ставки ассистентов
- фамилии и должности преподавателей, которые были приняты на работу до 01.01.2000
- названия кафедр, которые в алфавитном порядке располагаются до кафедры “Software Development”. Выводимое поле должно иметь название “Name of De­part­ment”
- фамилии ассистентов, имеющих зарплату (сумма ставки и надбавки) не более 1200
- названия групп 5-го курса, имеющих рейтинг в диапазоне от 2 до 4
- фамилии ассистентов со ставкой меньше 550 или надбавкой меньше 200

### Домашнее задание № 4

Тема: Многотабличные базы данных.

Вывести:
- все возможные пары строк преподавателей и групп
- названия факультетов, фонд финансирования кафедр которых превышает фонд финансирования факультета
- фамилии кураторов групп и названия групп, которые они курируют
- имена и фамилии преподавателей, которые читают лекции у группы “P107”
- фамилии преподавателей и названия факультетов на которых они читают лекции
- названия кафедр и названия групп, которые к ним относятся
- названия дисциплин, которые читает преподаватель “Samantha Adams”
- названия кафедр, на которых читается дисциплина “Database Theory”
- названия групп, которые относятся к факультету “Computer Science”
- названия групп 5-го курса, а также название факультетов, к которым они относятся
- полные имена преподавателей и лекции, которые они читают (названия дисциплин и групп), причем отобрать только те лекции, которые читаются в аудитории “B103”

### Домашнее задание № 5

Тема: Функции агрегирования.

Вывести:
- количество преподавателей кафедры “Software Development”
- количество лекций, которые читает преподаватель “Dave McQueen”
- количество занятий, проводимых в аудитории “D201”
- названия аудиторий и количество лекций, проводимых в них
- количество студентов, посещающих лекции преподавателя “Jack Underhill”
- среднюю ставку преподавателей факультета “Computer Science”
- минимальное и максимальное количество сту дентов среди всех групп
- средний фонд финансирования кафедр
- полные имена преподавателей и количество читаемых ими дисциплин
- количество лекций в каждый день недели
- номера аудиторий и количество кафедр, чьи лекции в них читаются
- названия факультетов и количество дисциплин,которые на них читаются

### Домашнее задание № 6

Тема: Подзапросы.

Вывести:
- номера корпусов, если суммарный фонд финансирования расположенных в них кафедр превышает 100000
- названия групп 5-го курса кафедры “Software Development”, которые имеют более 10 пар в первую неделю
- названия групп, имеющих рейтинг (средний рейтинг всех студентов группы) больше, чем рейтинг группы “D221”
- фамилии и имена преподавателей, ставка которых выше средней ставки профессоров
- названия групп, у которых больше одного куратора
- названия групп, имеющих рейтинг (средний рейтинг всех студентов группы) меньше, чем минимальный рейтинг групп 5-го курса
- названия факультетов, суммарный фонд финансирования кафедр которых больше суммарного фонда финансирования кафедр факультета “Computer Science”
- названия дисциплин и полные имена преподавателей, читающих наибольшее количество лекций по ним

### Домашнее задание № 7

Тема: Объединения.

Вывести:
- названия аудиторий, в которых читает лекции преподаватель “Edward Hopper”
- фамилии ассистентов, читающих лекции в группе “F505”
- дисциплины, которые читает преподаватель “Alex Carmack” для групп 5-го курса
- фамилии преподавателей, которые не читают лекции по понедельникам
- названия аудиторий, с указанием их корпусов, в которых нет лекций в среду второй недели на третьей паре
- полные имена преподавателей факультета “Computer Science”, которые не курируют группы кафедры “Software Development”
- список номеров всех корпусов, которые имеются в таблицах факультетов, кафедр и аудиторий
- полные имена преподавателей в следующем порядке: деканы факультетов, заведующие кафедрами, преподаватели, кураторы, ассистенты
- дни недели (без повторений), в которые имеются занятия в аудиториях “A311” и “A104” корпуса 6

### Домашнее задание № 8

Тема: Триггеры.

Создать триггер, который:
- позволяет только увеличивать размер фонда финансирования факультета
- фиксирует в журнале сведений о преподавателях все операции манипулирования, производимые над таблицей преподавателей


## Практическое задание

Database: `Hospital`

### Практическое задание №2

Тема: Основы взаимодействия с Microsoft SQL Server.

Необходимо создать базу данных Больница (Hospital), которая будет содержать информацию о проводимых в больнице обследованиях. Обследования, проводимые в больнице представлены в виде таблицы Обследования (Examinations), в которой собрана основная информация, такая как: название обследования, день недели, в который оно проводится, а также время начала и завершения. Также в базе данных присутствуют информация о персонале больницы, которая хранится в таблице Врачи (Doctors). Данные об отделениях и заболеваниях содержатся в таблицах Отделения (Departments) и Заболевания (Diseases) соответственно.

### Практическое задание №3

Тема: Запросы SELECT, INSERT, UPDATE, DELETE.

Вывести:
- содержимое таблицы палат
- фамилии и телефоны всех врачей
- все этажи без повторений, на которых располагаются палаты
- названия заболеваний под именем “Name of Disease” и степень их тяжести под именем “Severity of Disease”
- любой результат при это использовать выражение FROM для любых трех таблиц базы данных, используя для них псевдонимы
- названия отделений, расположенных в корпусе 5 и имеющих фонд финансирования менее 30000
- названия отделений, расположенных в 3-м корпусе с фондом финансирования в диапазоне от 12000 до 15000
- названия палат, расположенных в корпусах 4 и 5 на 1-м этаже
- названия, корпуса и фонды финансирования отделений, расположенных в корпусах 3 или 6 и имеющих фонд финансирования меньше 11000 или больше 25000
- фамилии врачей, чья зарплата (сумма ставки и надбавки) превышает 1500
- фамилии врачей, у которых половина зарплаты превышает троекратную надбавку
- названия обследований без повторений, проводимых в первые три дня недели с 12:00 до 15:00
- названия и номера корпусов отделений, расположенных в корпусах 1, 3, 8 или 10
- названия заболеваний всех степеней тяжести, кроме 1-й и 2-й
- названия отделений, которые не располагаются в 1-м или 3-м корпусе
- названия отделений, которые располагаются в 1-м или 3-м корпусе
- фамилии врачей, начинающиеся на букву “N”

### Практическое задание №4

Тема: Многотабличные базы данных.

Вывести:
- полные имена врачей и их специализации
- фамилии и зарплаты (сумма ставки и надбавки) врачей, которые не находятся в отпуске
- названия палат, которые находятся в отделении “Intensive Treatment”
- названия отделений без повторений, которые спонсируются компанией “Umbrella Corporation”
- все пожертвования за последний месяц в виде: отделение, спонсор, сумма пожертвования, дата пожертвования
- фамилии врачей с указанием отделений, в которых они проводят обследования. Необходимо учитывать обследования, проводимые только в будние дни
- названия палат и корпуса отделений, в которых проводит обследования врач “Helen Williams”
- названия отделений, которые получали пожертвование в размере больше 100000, с указанием их врачей
- названия отделений, в которых есть врачи не получающие надбавки
- названия специализаций, которые используются для лечения заболеваний со степенью тяжести выше 3
- названия отделений и заболеваний, обследования по которым они проводили за последние полгода
- названия отделений и палат, в которых проводились обследования по заразительным заболеваниям

### Практическое задание №5

Тема: Функции агрегирования.

Вывести:
- количество палат, вместимость которых больше 10
- названия корпусов и количество палат в каждом из них
- названия отделений и количество палат в каждом из них
- названия отделений и суммарную надбавку врачей в каждом из них
- названия отделений, в которых проводят обследования 5 и более врачей
- количество врачей и их суммарную зарплату (сумма ставки и надбавки)
- среднюю зарплату (сумма ставки и надбавки) врачей
- названия палат с минимальной вместительностью
- в каких из корпусов 1, 6, 7 и 8, суммарное количество мест в палатах превышает 100. При этом учитывать только палаты с количеством мест больше 10

### Практическое задание №6

Тема: Подзапросы.

Вывести:
- названия отделений, что находятся в том же корпусе, что и отделение “Cardiology”
- названия отделений, что находятся в том же корпусе, что и отделения “Gastroenterology” и “General Surgery”
- название отделения, которое получило меньше всего пожертвований
- фамилии врачей, ставка которых больше, чем у врача “Thomas Gerada”
- названия палат, вместимость которых больше, чем средняя вместимость в палатах отделения “Micro­biology”
- полные имена врачей, зарплаты которых (сумма ставки и надбавки) превышают более чем на 100 зарплату врача “Anthony Davis”
- названия отделений, в которых проводит об­следования врач “Joshua Bell”
- названия спонсоров, которые не делали пожерт­вования отделениям “Neurology” и “Oncology”
- фамилии врачей, которые проводят обследо­вания в период с 12:00 до 15:00

### Практическое задание №7

Тема: Объединения.

Вывести:
- названия и вместимости палат, расположенных в 5-м корпусе, вместимостью 5 и более мест, если в этом корпусе есть хотя бы одна палата вместимостью более 15 мест
- названия отделений в которых проводилось хотя бы одно обследование за последнюю неделю
- названия заболеваний, для которых не проводятся обследования
- полные имена врачей, которые не проводят обследования
- названия отделений, в которых не проводятся обследования
- фамилии врачей, которые являются интернами
- фамилии интернов, ставки которых больше, чем ставка хотя бы одного из врачей
- названия палат, чья вместимость больше, чем вместимость каждой палаты, находящейся в 3-м корпусе
- фамилии врачей, проводящих обследования в отделениях “Ophthalmology” и “Physiotherapy”
- названия отделений, в которых работают интерны и профессоры
- полные имена врачей и отделения в которых они проводят обследования, если отделение имеет фонд финансирования более 20000
- название отделения, в котором проводит обследования врач с наибольшей ставкой
- названия заболеваний и количество проводимых по ним обследований


### Практическое задание №8

Тема: Триггеры.

Создать триггер, который при обновлении таблицы отделений, изменяет значение его фонда финансирования на значение, равное сумме всех фондов финансирования отделений + 10000.
