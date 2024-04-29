#!/bin/bash

# Define a log file location
LOG_FILE="/workspaces/tailscale-connect.log"

# Function to log a message with a timestamp
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

log_message "Starting Tailscale connection script..."

# Ensure TS_AUTHKEY is set
if [ -z "$TS_AUTHKEY" ]; then
    log_message "Tailscale pre-authentication key (TS_AUTHKEY) is not set. Exiting."
    exit 1
fi

# Attempt to connect to Tailscale, using sudo if available
if command -v sudo &>/dev/null; then
    log_message "Using sudo to run Tailscale up..."
    if ! sudo tailscale up --authkey="$TS_AUTHKEY" --accept-routes --advertise-tags=tag:container 2>&1 | tee -a "$LOG_FILE"; then
        log_message "Failed to connect Tailscale with sudo."
        exit 1
    fi
else
    log_message "Running Tailscale up without sudo..."
    if ! tailscale up --authkey="$TS_AUTHKEY" --accept-routes --advertise-tags=tag:container 2>&1 | tee -a "$LOG_FILE"; then
        log_message "Failed to connect Tailscale without sudo."
        exit 1
    fi
fi
