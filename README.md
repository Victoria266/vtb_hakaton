# pg-profile-hackathon-template


Шаблон для хакатона: стенд PostgreSQL + профили нагрузок (OLTP, OLAP, MIXED, Ingest, Read-heavy).


## Требования
- PostgreSQL 15+
- psql, pgbench
- Python 3.8+
- GNU/Linux (Ubuntu/Debian) или WSL


## Быстрый старт
1. Создать директорию и поместить сюда файлы
2. Запустить `scripts/setup_db.sh` (создаёт базу, ролей)
3. Заполнить данные: `scripts/load_data.sh`
4. Запустить нагрузку:
- OLTP: `scripts/run_oltp.sh`
- OLAP: `scripts/run_olap.sh`
- MIXED: `scripts/run_mixed.sh`
5. Собирать метрики: `scripts/collect_metrics.sh`


## Структура
- `sql/` — схемы и запросы
- `pgbench/` — сценарии pgbench
- `scripts/` — shell-утилиты для запуска
- `docs/demo_plan.md` — план демонстрации


## Использование в хакатоне
1. Подготовьте VM (32GB/8CPU рекомендуемая конфигурация для демонстрации) или используйте локальную машину.
2. Запустите setup и load_data.
3. Проводите сценарии и снимайте метрики (latency p50/p95/p99, TPS, iowait%).


# pg-profile-hackathon-template


Шаблон для хакатона: стенд PostgreSQL + профили нагрузок (OLTP, OLAP, MIXED).


## Требования
- Docker & Docker Compose
- Python 3.8+


## Быстрый старт с Docker


1. Перейти в папку проекта:
```bash
cd pg-profile-hackathon-template