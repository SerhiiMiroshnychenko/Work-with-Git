# BRANCHES

## Створення гілки

Основною командою для створення нової гілки є:
```bash
git branch [branch_name] [starting_point]
```
Якщо ви не вкажете жодних аргументів, ви отримаєте список гілок,
активна з яких буде позначена зірочкою.
Дуже детальну історію гілок можна отримати за допомогою: 
```bash
git show-branch
```

|Команда|Вихідні файли|Зміст (Index)|Ланцюжок коммітів|Посилання|
|-------|-------------|-------------|-----------------|---------|
|git branch|Без змін|Без змін|Без змін|Нова гілка створена у git/refs/heads.HEAD для нової гілки вказує на HEAD поточної гілки. Поточна гілка встановлюється на нову гілку.|

Точкою відліку може бути будь-який комміт, якщо є тег, який його описує,
ви можете використати його замість довгого рядка. Якщо ви не вкажете аргумент,
буде створено копію активної гілки з моменту її останнього комміту.
Отже, ви можете зробити так:
```bash
git branch devel
```

щоб створити нову гілку розробки поза основною.

Ви можете видалити гілку devel за допомогою:
```bash
git branch -d devel
```

яка не може бути поточною робочою гілкою.

Відновити випадково видалену гілку досить складно, хоча не завжди неможливо, тому будьте обережні.

|Команда|Вихідні файли|Зміст (Index)|Ланцюжок коммітів|Посилання|
|-------|-------------|-------------|-----------------|---------|
|git checkout|Модифіковано відповідно до дерева коммітів, вказаного за ідентифікатором гілки або комміту; невідстежувані файли не видалено.|Без змін|Без змін|Поточна гілка скидається (reset) до перевіреної. HEAD (у .git/HEAD) тепер посилається на останній комміт у гілці.|

Також можна об'єднати операції створення нової гілки і її вилучення
за допомогою опції `-b` до операції вилучення (checkout).

Виконання:
```bash
git checkout -b newbranch startpoint
```

повністю еквівалентне:
```bash
git branch newbranch startpoint
git checkout newbranch
```

Припустимо, ви хочете побачити попередню версію певного файлу.
Ви можете зробити це за допомогою `git show`, якщо вкажете ім'я
шляху на додачу до тегу як ось тут (зверніть увагу на двокрапку):
```bash
git show v2.4.1:src/myfile.c
```

Команда `git show v2.4.1:src/myfile.c` використовується для перегляду змісту
конкретного файлу `myfile.c` в певному коміті з тегом `v2.4.1`.
Якщо ви дійсно хочете відновити цю версію, ви можете зробити це за допомогою:
```bash
git checkout v2.4.1 src/myfile.c
```
де немає двокрапки.