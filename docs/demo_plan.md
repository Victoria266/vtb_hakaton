# Demo plan


1. Запустить `scripts/setup_db.sh`
2. Заполнить данные `scripts/load_data.sh`
3. Фиксировать baseline: `scripts/collect_metrics.sh`
4. Прогнать OLTP: `scripts/run_oltp.sh` — снять метрики
5. Прогнуть OLTP -> запустить OLAP `scripts/run_olap.sh` и показать деградацию
6. Запустить `scripts/run_mixed.sh` (OLTP+OLAP) и показать смещение профиля
7. Продемонстрировать переключение конфигураций (ручное изменение postgresql.conf или route аналитики на реплику)


Собираемые метрики: TPS, p50/p95/p99 latency, iowait%, top queries, temp_bytes