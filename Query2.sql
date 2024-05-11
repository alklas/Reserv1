/*
	Оператор IN
*/
SELECT 
    *
FROM
    `groups`
WHERE
    SHIFR_NAPR NOT IN ('09.03.02' , '44.03.01');
/*
	Оператор BETWEEN
*/
SELECT 
    *
FROM
    `students`
WHERE
    `dob` BETWEEN '2000-01-01' AND '2000-12-31'
        AND `dob` NOT IN ('2000-01-01' , '2000-12-04');
/*
	Оператор BETWEEN в сочетании с оператором IN
*/        
SELECT 
    *
FROM
    students
WHERE
    dob BETWEEN '2000-01-01' AND '2000-12-31'
        AND dob NOT IN ('2000-01-01', '2000-12-04');
/*
	Оператор BETWEEN для поиска в определенном диапазоне строковых значений
*/
SELECT 
    *
FROM
    students
WHERE
    `name` BETWEEN "м" AND "р";
/*
	Оператор LIKE
*/
SELECT 
    *
FROM
    students
WHERE
    `name` LIKE '%Н%';
/*
	Оператор REGEXP для поиска, задаваемого регулярными выражениями
*/
SELECT 
    *
FROM
    students
WHERE
    `name` REGEXP '[н]';
/*
	Функция UPPER() для поиска значений, состоящих только из прописных букв
*/
SELECT 
    *
FROM
    students
WHERE
    `name` = BINARY UPPER(`name`);
/*
	Оператор LIKE в сочетании с символами исключения
*/
SELECT 
    *
FROM
    students
WHERE
    `name` LIKE '%$%' ESCAPE '$';
SELECT 
    *
FROM
    students
WHERE
    `name` LIKE '%@_%' ESCAPE '@';
SELECT 
    *
FROM
    students
WHERE
    `name` LIKE '%@@@%%' ESCAPE '@';
/*
	Оператор IS NULL
*/
SELECT 
    *
FROM
    students
WHERE
    `docum` IS NULL;
SELECT 
    *
FROM
    students
WHERE
    `docum` IS NOT NULL;
SELECT 
    *
FROM
    students
WHERE
    `docum` IS NOT NULL
        AND `idgroups` IS NULL;
/*
Агрегатные функции COUNT(), SUM(), AVG(), MAX(), MIN()
*/        
SELECT 
    COUNT(*)
FROM
    students;
SELECT 
    COUNT(idstud)
FROM
    students;
SELECT 
    COUNT(ALL idgroups)
FROM
    students;
SELECT 
    COUNT(DISTINCT idgroups)
FROM
    students;
SELECT 
    AVG(hours)
FROM
    discipl;
SELECT 
    MIN(hours / 36)
FROM
    discipl;
/*
Группировка значений, полученных при использовании агрегатных функций
*/
SELECT 
    den_ned, COUNT(idgroups)
FROM
    sched
GROUP BY den_ned;
SELECT 
    `pnamedisc`, COUNT(pnamedisc)
FROM
    discipl
GROUP BY pnamedisc;
SELECT 
    den_ned, idgroups, COUNT(idvid_z)
FROM
    sched
GROUP BY den_ned , idgroups;
/*
Самостоятельный запрос на группировку значений
*/
