### Demo server
https://rails-tournament.herokuapp.com/

### Требования:

- Ruby 2.4.4
- PostgreSQL 9.6+
  - `brew install postgresql` (Mac OS)
  - `sudo apt-get install postgresql postgresql-contrib` (Linux)
  - `psql postgres` (Mac OS)
  - `sudo -u postgres psql` (Linux)
  - `createuser -s postgres`

### Установка
- Установить гемы
  - `gem install bundler`
  - `bundle install`
- Задать юзера и пароль для postgresql в `database.yml`
- Загрузить базу
  - `rails db:setup`
- Запуск для проверки: `rails s`
