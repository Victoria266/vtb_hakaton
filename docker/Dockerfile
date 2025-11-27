FROM ubuntu:22.04

# Установка зависимостей
RUN apt-get update && apt-get install -y \
    postgresql-client \
    postgresql-contrib \
    python3 \
    python3-pip \
    git \
    bash \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app
RUN pip3 install --user psycopg2-binary

ENV PATH="/root/.local/bin:$PATH"

CMD ["bash"]
