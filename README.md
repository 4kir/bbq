# Приложение "Шашлыки"

Данное учебное приложение предназначено для организации отличного времяприпровождения с друзьями, коллегами и просто знакомыми.
Создавайте события с описанием и местопроведением указанным на карте яндекс. Подписывайтесь на события других пользователей 
и получайте уведомления на почту о всех изменениях в событии. Загружайте фотографии, свои коментарии к событиям. 

Примеры работы приложения:
http://na-shashlyki.ru/

## Техническая информация
* Ruby version 2.7.0
* Rails 6.0.3

**В проекте использовались:**
* **gem 'omniauth'** - для регистрации и входа через соцсети
* **gem 'carrierwave'** - для подключения хранилища фотографий в сервисе S3 AWS Amazon
* **gem 'mailjet'** - для настройки почтовой рассылки
* **gem 'resque'** - для создания фоновых задач и составления очередей таких задач
* и другие

## Локальный запуск приложения
1. Склонируйте приложение
2. Изменить навзвание файла `config/database.yml.example` на `config/database.yml`
3. Зарегистрироваться в сервисах https://aws.amazon.com/ru/s3/, https://www.mailjet.com/ и получить `credential keys` для данных сервисов
4. Создать файл `config/application.yml` и прописать полученные данные. Пример:
```
development:
  S3_ACCESS_KEY: AKWDWJERHKWJHEKRJHWEK
  S3_BUCKET_NAME: test-bucket
  S3_SECRET_KEY: 68ksjdfkjdsnkksdjfx3jkhK34GGHhdsdksdjskjd
  MAILJET_SENDER: test@test.test
  MAILJET_API_KEY: sfddfdsf6sdf7sdf89a8sdsa
  MAILJET_SECRET_KEY: sdkfdskjfksjh3kjhkjhk3kjhk
```
5. Находясь в папке приложения выполните команду в терминале 
```
bundle && bundle exec rails db:migrate
```
6. Выполните команду
```
yarn
```
7. Запустить в терминале 
```
bin/webpack-dev-server
```
и во втором окне терминала
```
bundle exec rails s
```
8. Открыть в браузере http://localhost:3000/
