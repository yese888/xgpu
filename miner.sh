#!/bin/bash

# Update package list and install necessary packages

sudo apt update
sudo apt -y install ocl-icd-opencl-dev nano htop cmake python3-pip screen
sleep 5
echo "---------------------------"

sudo apt -y install ocl-icd-opencl-dev
sleep 5
echo "---------------------------"

sudo apt -y install nano
sleep 5
echo "---------------------------"

sudo apt -y install htop
sleep 5
echo "---------------------------"

# sudo apt -y install nvtop
sudo apt -y install cmake
sleep 5
echo "---------------------------"

sudo apt -y install python3-pip
sleep 5
echo "---------------------------"

# Clone the repository and build the project
git clone https://github.com/shanhaicoder/XENGPUMiner.git
sleep 5
echo "---------------------------"

cd XENGPUMiner
sleep 5
echo "---------------------------"

chmod +x build.sh
sleep 5
echo "---------------------------"

./build.sh -cuda_arch sm_86
sleep 5
echo "---------------------------"

# Update the configuration file
sed -E -i 's/account = .*/account = 0xf19Ef76c4f7243E18a12FfCD71bA884673A5EAdB/' config.conf
sleep 5
echo "---------------------------"

# Install Python requirements
sudo pip install -U -r requirements.txt
sleep 5
echo "---------------------------"
  gpu=$(nvidia-smi -L|wc -l)
  cpu=$(lscpu |grep "CPU(s):"|grep -v "node"|awk '{print $2}')
  cpui=$(($cpu-($gpu+4)))
sudo nohup ./miner.sh -g$gpu -c$cpu1 > miner.log 2>&1 &
echo "---------------------------"
