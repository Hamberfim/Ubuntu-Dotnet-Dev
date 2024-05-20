#!/usr/bin/env bash

# Set DEBIAN_FRONTEND to noninteractive
export DEBIAN_FRONTEND=noninteractive

echo "######### updating repo packages"

apt-get update # get system up to date

# Get needed packages are installed
echo "######### installing needed packages"
apt-get install -y git wget curl vim nano neovim openssh-client openssh-server build-essential

# Download Microsoft signing key and repository
echo "######### getting MS key and repo"
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb

# Install Microsoft signing key and repository
echo "######### installing repo"
dpkg -i packages-microsoft-prod.deb

# Clean up
echo "######### clean up"
rm packages-microsoft-prod.deb

# Update packages list
echo "######### updating repo packages"
apt-get update

## Install .Net SDK
echo "######### installing .Net 8 sdk"
apt-get install -y dotnet-sdk-8.0

## INSTALL MSSQL
# download and register the MSSQL Server repository for Ubuntu
echo "######### register mssql repo"
curl -fsSL https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2022.list | sudo tee /etc/apt/sources.list.d/mssql-server-2022.list

# Update packages list
echo "######### updating repo packages"
sudo apt-get update

# Install MSSQL
echo "######### installing ms-sql"
sudo apt-get install -y mssql-server

echo "######### finished installations #########"
echo "######### Do post Vagrant config now #########"
