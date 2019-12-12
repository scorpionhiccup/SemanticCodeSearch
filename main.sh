
wget -qO- https://get.docker.com/ | sh

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey |   sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list |   sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y nvidia-docker2

# Test Installation
docker run --runtime=nvidia --rm nvidia/cuda:9.0-base nvidia-smi

lspci | grep -i nvidia
gcc --version
uname -r
sudo apt-get install linux-headers-$(uname -r)

# Install Docker CE
sudo apt-get install     apt-transport-https     ca-certificates     curl     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose -h

# Install Nvidia-Docker
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey |   sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list |   sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y nvidia-docker2

# Test Installation
docker run --runtime=nvidia --rm nvidia/cuda:9.0-base nvidia-smi

pip3 install graphql-core==2.0


sudo script/setup

sudo script/console

wandb login

python train.py


python predict.py -m ../resources/saved_models/neuralbowmodel-*_model_best.pkl.gz -p nbow.predictions && python predict.py -m ../resources/saved_models/1dcnn-*_model_best.pkl.gz -p 1dcnn.predictions && python predict.py -m ../resources/saved_models/convselfatt-*_model_best.pkl.gz -p convselfatt.predictions && python predict.py -m ../resources/saved_models/selfatt-*_model_best.pkl.gz -p selfatt.predictions && python predict.py -m ../resources/saved_models/rnn-*_model_best.pkl.gz -p rnn.predictions

#  python train.py outputs/

# script/setup
# python predict.py -m ../resources/saved_models/neuralbowmodel-2019-12-01-04-50-45_model_best.pkl.gz
