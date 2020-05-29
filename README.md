# Getting Started

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Git](https://git-scm.com)
- Windows 10 Pro/Home [19040](https://blogs.windows.com/windowsexperience/2019/12/10/announcing-windows-10-insider-preview-build-19041/) If running Windows 10 Home you will require Windows 10 Home Build 19040.

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

| Username                 | Password        |
|--------------------------|-----------------|
| MYSQL_ROOT_PASSWORD      | somewordpress   |
| MYSQL_DATABASE           | wordpress       |
| MYSQL_USER               | wordpress       |
| MYSQL_PASSWORD           | wordpress       |
| WORDPRESS_DB_HOST        | db:3306         |
| WORDPRESS_DB_USER        | wordpress       |
| WORDPRESS_DB_PASSWORD    | wordpress       |
| WORDPRESS_DB_USER        | wordpress       |

## Wordpress Settings

| Username                 | Password        |
|--------------------------|-----------------|
| Username                 | admin           |
| Password                 | admin           |

# Servers

- Production Server(Google Cloud): http://34.106.48.231/
- Live Server(Digital Ocean): http://67.207.83.145/
