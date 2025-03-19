FROM postgres:15.1

RUN localedef -i es_ES -c -f UTF-8 -A '/usr/share/locale/locale.alias' es_ES

COPY wait-for-it/wait-for-it.sh ./wait-for-it.sh
RUN chmod +x wait-for-it.sh

COPY data data/

COPY db_data.sql db_schema.sql ./
