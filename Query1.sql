SELECT 
    `discipl`.`pnamedisc` as 'Полное наименование дисциплины'
FROM
    `discipl`;
SELECT DISTINCT
    `groups`.`napr` as 'Направления подготовки'
FROM
    `groups`;
SELECT 
    *
FROM
    `discipl`
WHERE
    `discipl`.`knamedisc` = 'ЭП';    
SELECT 
    *
FROM
    `discipl`
WHERE
    `iddiscipl` <> 5;
SELECT 
    `name`, `dob`
FROM
    `students`
WHERE
    `idgroups` <> 2 AND dob > '2000-11-15';
SELECT 
    `name`, `dob`
FROM
    `students`
WHERE
	NOT (`idgroups` <> 2 OR dob < '2000-11-15');
/*
Выводим тех студентов, у которых дата рождения позже 15.11.2000 и которые 
при этом учатся в группе с idgroup = 2.
*/
SELECT 
    `name`, `dob`
FROM
    `students`
WHERE
	NOT (`idgroups` <> 3 OR dob < '1999-11-15');