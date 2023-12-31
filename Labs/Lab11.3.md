# Лабораторна 11.3. Отримання доступу до вашого репозиторію віддалено з http

__Завдання 11.3: Отримання доступу до вашого репозиторію віддалено по протоколу http__

Створіть новий клон репозиторію, використовуючи протокол http, як в: 
```bash
git clone https://ipaddress/my-remote-git-repo
```

підставивши правильне значення замість `ipaddress`. 

Якщо у вас є партнер на іншій машині, або ви працюєте на двох машинах,
спробуйте клонувати репозиторії один одного за допомогою цього методу. 

Для того, щоб це спрацювало, можливо, вам доведеться встановити http server.
На машинах на основі __RPM__, можливо, доведеться виконати такі процедури:
```bash
sudo dnf install httpd
```

а на системах на основі __deb__ такі:
```bash
sudo apt-get install apache2
```

а потім запустіть за допомогою:
```bash
sudo systemctl start httpd
```

Не забудьте запустити:
```bash
git --bare update-server-info
```

в каталозі проєкту перед спробою отримати доступ до репозиторію через __https://__. 

Для того, щоб це спрацювало, репозиторій має бути доступним через ваш вебсервер.
Для простоти, ви можете розмістити його у `/var/www/html` (або у `/var/www/git` на системах на __deb__),
або ви можете встановити посилання звідти на реальне місце розташування, як наприклад: 
```bash
sudo ln -s /tmp/my-remote-git-repo /var/www/html/my-remote-git-repo 
sudo ln -s /tmp/my-remote-git-repo /var/www/git/my-remote-git-repo
```

Звичайно, ви можете розмістити його і в інших місцях, але ми не хочемо заглиблюватися
в деталі конфігурації вебсервера. 