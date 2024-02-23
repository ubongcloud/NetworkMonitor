#!/bin/bash

# Variables declaration
LOG_FILE="network_monitor.log"
EMAIL_RECIPIENT="ubongtech7@gmail.com"
EMAIL_SUBJECT="Network Monitoring Alert"
PING_INTERVAL=60  # Interval between ping checks in seconds

# Function to ping nodes and log the results
ping_nodes() {
    local timestamp
    timestamp=$(date +"%Y-%m-%d %T")
    local unreachable_nodes=()

    for node in "$@"; do
        if ping -c 1 "$node" &> /dev/null; then
            echo "$timestamp - $node is reachable"
            echo "$timestamp - $node is reachable" >> "$LOG_FILE"
        else
            echo "$timestamp - $node is unreachable"
            echo "$timestamp - $node is unreachable" >> "$LOG_FILE"
            unreachable_nodes+=("$node")
        fi
    done

    if [ "${#unreachable_nodes[@]}" -ne 0 ]; then
        send_email "${unreachable_nodes[@]}"
    fi
}

# Function to send email notification
send_email() {
    local body="The following node(s) are unreachable at $(date +"%Y-%m-%d %T"):"
    for node in "$@"; do
        body+=" - $node"
    done

    if ! mail -s "$EMAIL_SUBJECT" "$EMAIL_RECIPIENT" <<< "$body"; then
        echo "Failed to send email notification." >&2
    fi
}

# Main function
main() {
    if [ "$#" -eq 0 ]; then
        echo "Usage: $0 [node1] [node2] ..."
        exit 1
    fi

    echo "Starting network monitoring..."

    # Continuously ping nodes
    while true; do
        ping_nodes "$@"
        sleep "$PING_INTERVAL"
    done
}

main "$@"