FROM ubuntu:18.04

ARG ANDROID_STUDIO_URL=https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2022.1.1.21/android-studio-2022.1.1.21-linux.tar.gz

# Install requirements
RUN echo "\033[32m########## Installation des pré-requis ##########\033[0m" 
RUN dpkg --add-architecture i386 
RUN apt-get update > /dev/null && apt-get install -y \
        build-essential git neovim wget unzip sudo \
        libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 \
        libxrender1 libxtst6 libxi6 libfreetype6 libxft2 xz-utils vim\
        qemu qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils libnotify4 libglu1 libqt5widgets5 openjdk-8-jdk xvfb > /dev/null

VOLUME /projects

WORKDIR /usr/local/        

# Install android studio
RUN echo "\033[32m########## Installation d'Android Studio ##########\033[0m"
RUN wget "$ANDROID_STUDIO_URL" -O android-studio.tar.gz 2> /dev/null

# Décompression android studio
RUN echo "\033[32m########## Décompression d'Android Studio ##########\033[0m" 
RUN tar -xzf android-studio.tar.gz && rm -f android-studio.tar.gz
