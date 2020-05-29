# Getting Started

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Git](https://git-scm.com)

## Recommended

[Github Desktop](https://desktop.github.com)

It is recommended that you use Github Desktop to manage local repositories. It lets you add the submodules as local repositories, and adds your github credentials, which is accessed when you change a submodule's branch.

## Installation

- Git Clone the repository
- Open up the Shell of your choice E.G. Command Prompt, Windows Powershell, Bash , etc.
- Navigate to the repository
- Run docker-compose up -d to bring the vm online
- Run restore-db.sh
- Edit the variable IP_ADDR in update-wp-options-server.sh to be your localhost ip
- Run update-wp-options.sh
- Connect to the VM using a web browser of your choice

# Usage

## Scripts

- Run `restore-db.sh` To restore the latest database version from backup after pull
- Run `backup-db.sh` To backup your database before a commit and push
- Run `update-wp-options-server` To update your ip address inside the database after restoring

# Server Account Information

## MySQL Information

MYSQL_ROOT_PASSWORD: somewordpress

MYSQL_DATABASE: wordpress

MYSQL_USER: wordpress

MYSQL_PASSWORD: wordpress

WORDPRESS_DB_HOST: db:3306

WORDPRESS_DB_USER: wordpress

WORDPRESS_DB_PASSWORD: wordpress

WORDPRESS_DB_NAME: wordpress

## Wordpress Settings
Username - admin

Password - admin

# Servers

Production Server: http://34.106.48.231/

Live Server: http://67.207.83.145/
