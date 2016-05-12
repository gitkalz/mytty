FROM node:4
# FROM node:0.10 # uncomment if build errors found with latest node image
MAINTAINER Kalyan Chakravarthi "kalyan.chakravarthi@live.com"
LABEL Description="This image is packaged to run TTY.JS with ZSH and Prezto customizations." Vendor="Enthusiast" Version="0.0.1"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install htop \
    vim \
    zsh \
    sudo \
    git \
    fonts-powerline \
    tmux \
    nano && \
    apt-get autoclean && \
    apt-get autoremove

RUN useradd -m ttyjs -s /bin/zsh && echo "ttyjs:docker" | chpasswd && adduser ttyjs sudo

RUN npm update && \
    npm install -g tty.js && \
    npm cache clean

COPY /static/ /usr/local/lib/node_modules/tty.js/static

USER ttyjs

WORKDIR /home/ttyjs

RUN \
  zsh -c 'git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"; setopt EXTENDED_GLOB;  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}";  done;'

ADD config.json /home/ttyjs/.ttyjs/

EXPOSE 8080

CMD ["node","/usr/local/lib/node_modules/tty.js/bin/tty.js", "--config", "/home/ttyjs/.ttyjs/config.json"]
