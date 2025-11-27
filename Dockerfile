FROM ubuntu:22.04

# Отключаем интерактивные вопросы и задаем таймзону
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow

# Установка зависимостей
RUN apt-get update && apt-get install -y \
    postgresql-client \
    python3 \
    python3-pip \
    git \
    bash \
    dos2unix \
    && rm -rf /var/lib/apt/lists/*

# Рабочая директория
WORKDIR /app

# Копируем проект
COPY . /app

# Делаем скрипты исполняемыми и переводим в UNIX формат
RUN chmod +x /app/scripts/*.sh \
    && find /app/scripts -type f -name "*.sh" -exec dos2unix {} \;

# Устанавливаем Python-библиотеки
RUN pip3 install psycopg2-binary
