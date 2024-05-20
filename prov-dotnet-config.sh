#!/usr/bin/env bash

# Set DEBIAN_FRONTEND to noninteractive
export DEBIAN_FRONTEND=noninteractive

echo "######### updating repo packages"

apt-get update # get system up to date

# Get needed packages are installed
echo "######### installing needed packages"
apt-get install -y git wget curl vim nano neovim openssh-client openssh-server build-essential gpg

# Download Microsoft signing key and repository
echo "######### getting MS key and repo"
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb

# Install Microsoft signing key and repository
echo "######### installing MS repo"
dpkg -i packages-microsoft-prod.deb

# Clean up
echo "######### clean up MS pack deb"
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

# Install VS Code
echo "######### installing VS Code"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
rm -f packages.microsoft.gpg
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y code

echo "######### finished installations/Config #########"
echo "######### Do post Vagrant config now #########"
