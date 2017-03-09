FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04

RUN locale-gen en_US.UTF-8 && \
	apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get -q upgrade -y -o Dpkg::Options::="--force-confnew" --no-install-recommends &&\
    DEBIAN_FRONTEND="noninteractive" apt-get -q install -y -o Dpkg::Options::="--force-confnew"  --no-install-recommends openssh-server &&\
    apt-get -q autoremove &&\
    apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin &&\
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd &&\
    mkdir -p /var/run/sshd

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

#############
# Customization

RUN apt-get -y update && \
	apt-get -y install python2.7 python2.7-dev \
		build-essential git virtualenv wget \
        software-properties-common python-software-properties sudo\
		libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev && \
	apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin
	
RUN update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1 && \
	cd /tmp && wget https://bootstrap.pypa.io/get-pip.py && python /tmp/get-pip.py

RUN add-apt-repository ppa:jonathonf/ffmpeg-3 && \
	apt-get -y update && \
	apt-get -y install ffmpeg libav-tools x264 x265 && \
	apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin

RUN pip install https://s3.amazonaws.com/pytorch/whl/cu80/torch-0.1.10.post2-cp27-none-linux_x86_64.whl && \
    pip install torchvision && \
    rm -rf /tmp/*

# RUN pip install awscli

RUN git clone https://github.com/torch/distro.git ~/torch --recursive && \
    cd ~/torch && bash install-deps && \
    ./install.sh -b && \
    apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin && \
    rm -rf /tmp/*
