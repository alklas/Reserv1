/* Простое форматирование результатов запроса */
select `groups`.`gr` as 'Группа', 'Обучается по направлению', `groups`.`shifr_napr` as 'Шифр направления', `groups`.`napr` as 'Наименование направления' 
from `groups`;
/* Использование вычислений в формулировке запроса */
SELECT 
    knamedisc as 'Дисциплина', 'читается', hours as 'часов', hours/36 as 'зачётных единиц'
FROM
    `discipl`;
/* Операции с датами */
SELECT 
    `name` as 'ФИО студента', round((curdate() - `dob`)/365/24) as 'Возраст'
FROM
    students;
/* Использование диапазона дат при помощи выражения INTERVAL */    
SELECT 
    *
FROM
    students
WHERE
    dob > '1999-12-31'
        AND dob < '1999-12-31' + INTERVAL '1' YEAR;
        
SELECT 
    *
FROM
    students
WHERE
    dob > '1999-12-31'
        AND dob < '1999-12-31' + INTERVAL '10' MONTH;
        
SELECT DATE('2001-01-01') - INTERVAL '1' MONTH;
/* Выражение в предложении select, меняющее дату в результате отбора */
SELECT dob + interval '1' month from students
where dob > '1999-12-31';
/* Запрос с непонятным результатом */
SELECT 
    *
FROM
    students
WHERE
    dob < date('1999-12-31') + (DATE('2000-12-01') - DATE('2000-01-01'));
/* Проверка условия в предложии SELECT */    
SELECT 
    case `students`.`docum`
    when '1'
    then `students`.`docum`
    else 'Нет документов'
    end as 'Наличие документов', `students`.`name`
FROM
    students
    where `students`.`docum` <> 0 or `students`.`docum` is NULL;

SELECT 
    case `students`.`docum`
    when '1'
    then `students`.`docum`
    when '0'
    then '0 документов'
    else 'Нет документов'
    end as 'Наличие документов', `students`.`name`
FROM
    students
    where 1;
    
/* Изменения в шифрах направлений (например, на устаревшие) */
    SELECT 
    case shifr_napr
    when '09.03.02'
    then '11.11.11'
    when '44.03.05'
    then '22.22.22'
    else shifr_napr
    end as 'Устаревшие шифры направлений', `groups`.`napr`
FROM
    `groups`
    where 1;
/* Упрощённая форма работы с совпадающими значениями - заменяет второй параметр функции nullif() на значение NULL, если он совпадает с содержимым ячейки */    
   SELECT 
     nullif(shifr_napr, '09.03.02'), napr
FROM
    `groups`
    where 1; 
/* Сортировка результатов отбора */
SELECT 
    *
FROM
    students
ORDER BY dob DESC , `name` DESC;

SELECT 
    *
FROM
    students
ORDER BY `name` DESC;

SELECT 
    *
FROM
    students
ORDER BY idgroups DESC;
/* Самостоятельный запрос на сортировку значений */

/* Упорядочивание агрегатов */
SELECT 
    `hours`, COUNT(knamedisc)
FROM
    discipl
GROUP BY hours
ORDER BY COUNT(knamedisc);

SELECT 
    `hours`, COUNT(knamedisc)
FROM
    discipl
GROUP BY hours
ORDER BY 2 desc;

/* Самостоятельный запрос на сортировку максимальных дат рождения по академической группе  */
SELECT 
    idgroups, MAX(dob)
FROM
    students
WHERE
    NOT idgroups IS NULL
GROUP BY idgroups
ORDER BY 2;