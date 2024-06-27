-- Проверяем существование пользователя
DO $$ BEGIN
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = '${DB_NAME}') THEN
    -- создаем пользователя с использованием переменной окружения для пароля
    CREATE USER ${DB_NAME} WITH PASSWORD '${DB_PASSWORD}';
  END IF;
END $$;

-- Проверяем существование базы данных
DO $$ BEGIN
  IF NOT EXISTS (SELECT FROM pg_database WHERE datname = '${DB_NAME}') THEN
    -- создаем базу данных с использованием переменной окружения
    CREATE DATABASE ${DB_NAME};
  END IF;
END $$;

-- Назначаем права доступа пользователю к базе данных
GRANT ALL PRIVILEGES ON DATABASE ${DB_NAME} TO ${DB_NAME};