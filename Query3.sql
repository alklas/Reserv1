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
    