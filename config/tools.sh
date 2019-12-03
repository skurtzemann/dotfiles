# Install tools

# https://docs.brew.sh/Homebrew-on-Linux

# gcloud
gcloudBin=$(which gcloud)
ret=$?
if [ "$ret" = "1" ]; then
   echo "Installing gcloud..."
   echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
   curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
   sudo apt-get update && sudo apt-get install -y google-cloud-sdk
fi

# docker
dockerBin=$(which docker)
ret=$?
if [ "$ret" = "1" ]; then
   echo "Installing docker..."
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"
   sudo apt-get update
   sudo apt-get install -y docker-ce docker-ce-cli containerd.io
fi

# kubens & kubectx
kubensBin=$(which kubens)
ret=$?
if [ "$ret" = "1" ]; then
   sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
   sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
   sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

   mkdir -p ~/.oh-my-zsh/completions
   chmod -R 755 ~/.oh-my-zsh/completions
   ln -s /opt/kubectx/completion/kubectx.zsh ~/.oh-my-zsh/completions/_kubectx.zsh
   ln -s /opt/kubectx/completion/kubens.zsh ~/.oh-my-zsh/completions/_kubens.zsh
fi

# helm plugins
helmBin=$(which helm)
ret=$?
if [ "$ret" = "0" ]; then
   # plugins
   helm plugin install https://github.com/databus23/helm-diff --version master
fi


# podman
podmanBin=$(which podman)
ret=$?
if [ "$ret" = "1" ]; then
   sudo apt-get update -qq
   sudo apt-get install -qq -y software-properties-common uidmap
   sudo add-apt-repository -y ppa:projectatomic/ppa
   sudo apt-get update -qq
   sudo apt-get -qq -y install podman
fi

# octant (k8s dashboard)
octantBin=$(which octant)
ret=$?
if [ "$ret" = "1" ]; then
   wget https://github.com/vmware/octant/releases/download/v0.5.1/octant_0.5.1_Linux-64bit.tar.gz
   tar octant_0.5.1_Linux-64bit.tar.gz
   sudo mv octant_0.5.1_Linux-64bit/octant /usr/local/bin/
   rm -fr octant_0.5.1_Linux-64bit*
fi