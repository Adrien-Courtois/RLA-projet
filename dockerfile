FROM ubuntu:18.04

ARG ANDROID_STUDIO_URL=https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2022.1.1.21/android-studio-2022.1.1.21-linux.tar.gz
ARG USER=android

# Install requirements
RUN echo "\033[32m########## Installation des pré-requis ##########\033[0m" 
RUN dpkg --add-architecture i386 
RUN apt-get update
RUN apt-get install -y build-essential git neovim wget unzip sudo
RUN apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 
RUN apt-get install -y libxrender1 libxtst6 libxi6 libfreetype6 libxft2 xz-utils vim
RUN apt-get install -y qemu qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils libnotify4 libglu1 libqt5widgets5 openjdk-8-jdk xvfb

RUN groupadd -g 1000 -r $USER && \
        useradd -u 1000 -g 1000 --create-home -r $USER && \
        adduser $USER libvirt && \
        adduser $USER kvm


#Change password
RUN echo "$USER:$USER" | chpasswd

#Make sudo passwordless
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-$USER
RUN usermod -aG sudo $USER
RUN usermod -aG plugdev $USER

USER $USER

WORKDIR /home/$USER        

# Install android studio
RUN echo "\033[32m########## Installation d'Android Studio ##########\033[0m"
RUN wget "$ANDROID_STUDIO_URL" -O android-studio.tar.gz

# Décompression android studio
RUN echo "\033[32m########## Décompression d'Android Studio ##########\033[0m" 
RUN tar -xzf android-studio.tar.gz && rm -f android-studio.tar.gz