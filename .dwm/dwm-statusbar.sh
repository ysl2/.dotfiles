#!/bin/bash

get_cpu_usage() {
    cpu_percentage=$(top -bn1 | grep "%Cpu(s)" | awk '{print $2}' | cut -d "." -f 1)
    cpu_icon=""
    printf -v cpu_percentage "%2s" "$cpu_percentage"
    echo "$cpu_icon $cpu_percentage%"
}

get_memory_usage() {
    memory_info=$(free -h | awk '/^Mem/ {print $3 "/" $2}')
    memory_icon=""
    echo "$memory_icon $memory_info"
}

get_root_disk_usage() {
    disk_usage=$(df -h / | awk 'END{print $3 "/" $2}')
    disk_icon=""
    echo "$disk_icon $disk_usage"
}

get_volume() {
    volume=$(amixer get Master | grep -oE '[0-9]{1,3}%' | head -1)
    volume_icon=""
    printf -v volume "%3s" "$volume"
    echo "$volume_icon $volume"
}

get_datetime() {
    datetime=$(date +"%Y-%m-%d %a %H:%M:%S")
    clock_icon=""
    echo "$clock_icon $datetime"
}

while true; do
    cpu_info=$(get_cpu_usage)
    memory_info=$(get_memory_usage)
    disk_info=$(get_root_disk_usage)
    volume_info=$(get_volume)
    datetime_info=$(get_datetime)

    status_text="$cpu_info $memory_info $disk_info $volume_info $datetime_info"

    xsetroot -name "$status_text"

    sleep 1
done

