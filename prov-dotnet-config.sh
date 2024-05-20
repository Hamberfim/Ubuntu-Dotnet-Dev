#!/usr/bin/env bash
apt-get update # get system up to date

# Get needed packages are installed
apt-get install git wget curl vim nano neovim openssh-client openssh-server build-essential

# Download Microsoft signing key and repository
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb

# Install Microsoft signing key and repository
dpkg -i packages-microsoft-prod.deb

# Clean up
rm packages-microsoft-prod.deb

# Update packages list
apt-get update

## Install .Net SDK
apt-get install dotnet-sdk-8.0

## INSTALL MSSQL
# download and register the MSSQL Server repository for Ubuntu
curl -fsSL https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2022.list | sudo tee /etc/apt/sources.list.d/mssql-server-2022.list

# Update packages list
apt-get update

# install MSSQL
apt-get install -y mssql-server

# Install MSSQL Tools
apt-get install -y mssql-tools18 unixodbc-dev

# Add to the env path in bash - output $PATH without expansion
echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >>~/.bash_profile

# for interactive non-login session - output $PATH without expansion
echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >>~/.bashrc
# shellcheck source=/dev/null
source ~/.bashrc

### Post install configuration required ###
#  vagrant ssh
#  sudo /opt/mssql/bin/mssql-conf setup
#  Lic selection 2
#  fill in the password
#  systemctl status mssql-server --no-pager
############# NOTE #############
#  To connect remotely, you might need to open
#  the SQL Server TCP port (default 1433) on the firewall
