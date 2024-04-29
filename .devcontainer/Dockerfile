# User Ubuntu 22.04 as the base image
FROM mcr.microsoft.com/devcontainers/base:jammy

# Avoid prompts from apt
ARG DEBIAN_FRONTEND=noninteractive

# Update the package repository
RUN apt-get update

# Git
RUN apt-get install -y git

# ld (linker) 
RUN apt-get install -y binutils

# NASM
RUN apt-get install -y nasm

# GDB
RUN apt-get install -y gdb

# Copy tailscale script
COPY --chown=vscode:vscode .devcontainer/tailscale-connect.sh /home/vscode/tailscale-connect.sh
RUN chmod +x /home/vscode/tailscale-connect.sh

# Set the shell as the entrypoint of the container
CMD ["/bin/bash"]
