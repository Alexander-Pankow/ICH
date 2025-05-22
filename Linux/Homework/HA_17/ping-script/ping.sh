#!/bin/bash

set -e

read -p "Введите IP или домен для пинга: " target


if [[ -z "$target" ]]; then
    echo "Ошибка: адрес не введён!"
    exit 1
fi

echo "Начинаю пинговать $target с интервалом 1 секунда, таймаут 100 мс."


while true; do
    # Пинг 1 пакет, таймаут 100 мс
    if ping -c 1 -W 1 "$target" > /dev/null; then
        echo "Пакет доставлен"
    else
        echo "Ошибка доставки"
    fi
    sleep 1
done


echo "DONE"
