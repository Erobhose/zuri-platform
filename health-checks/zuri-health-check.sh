#!/bin/bash

LOG="/mnt/c/Users/erobh/Zuri-Market/zuri-platform/health-checks/health-check.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

check_deployment() {
    NAME="$1"

    if kubectl rollout status deployment/"$NAME" --timeout=10s >/dev/null 2>&1; then
        echo "$DATE | $NAME | UP" >> "$LOG"
    else
        echo "$DATE | $NAME | DOWN" >> "$LOG"
    fi
}

check_deployment zuri-backend
check_deployment zuri-frontend
