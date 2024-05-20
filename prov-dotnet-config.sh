#!/usr/bin/env bash

# Set DEBIAN_FRONTEND to noninteractive
export DEBIAN_FRONTEND=noninteractive

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

echo "######### updating repo packages"
# adding sudo for Explicitness
sudo apt-get update # get system up to date

# Get needed packages are installed
echo "######### installing needed packages"
sudo apt-get install git wget curl vim nano neovim openssh-client openssh-server build-essential

# Download Microsoft signing key and repository
echo "######### getting MS key and repo"
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb

# Install Microsoft signing key and repository
echo "######### installing repo"
sudo dpkg -i packages-microsoft-prod.deb

# Clean up
echo "######### clean up"
rm packages-microsoft-prod.deb

# Update packages list
echo "######### updating repo packages"
sudo apt-get update

## Install .Net SDK
echo "######### installing .Net 8 sdk"
sudo apt-get install dotnet-sdk-8.0

# ## INSTALL MSSQL
# # download and register the MSSQL Server repository for Ubuntu
# echo "######### register mssql repo"
# curl -fsSL https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2022.list | sudo tee /etc/apt/sources.list.d/mssql-server-2022.list

# # Update packages list
# echo "######### updating repo packages"
# sudo apt-get update

# # install MSSQL
# echo "######### installing ms-sql"
# sudo apt-get install -y mssql-server

# # Install MSSQL Tools
# echo "######### installing ms-sql tools"
# sudo apt-get install -y mssql-tools18 unixodbc-dev

# # Add to the env path in bash - output $PATH without expansion
# echo "exporting env paths"
# echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >>~/.bash_profile

# # for interactive non-login session - output $PATH without expansion
# echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >>~/.bashrc
# # shellcheck source=/dev/null
# source ~/.bashrc

# ### Post install configuration required ###
# #  vagrant ssh
# #  sudo /opt/mssql/bin/mssql-conf setup
# #  Lic selection 2
# #  fill in the password
# #  systemctl status mssql-server --no-pager
# ############# NOTE #############
# #  To connect remotely, you might need to open
# #  the SQL Server TCP port (default 1433) on the firewall
