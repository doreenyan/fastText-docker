FROM ubuntu:18.04
MAINTAINER Doreen Yan (yan.doreen@gmail.com)
RUN apt-get update && apt-get install -y \
        build-essential \
        wget \
        vim \
	python3-pip \
        git \
        python3-dev \
        unzip \
        python3-numpy \
        python3-scipy \
        && rm -rf /var/cache/apk/*

RUN git clone https://github.com/facebookresearch/fastText.git /tmp/fastText && \
  rm -rf /tmp/fastText/.git* && \
  mv /tmp/fastText/* / && \
  cd / && \
  make 

RUN python3 setup.py install
RUN pip3 install jupyter 

 

WORKDIR /
CMD ["./fasttext"]
