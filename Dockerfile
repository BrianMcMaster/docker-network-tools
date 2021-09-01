ARG ALPINE_TAG=edge
FROM alpine:${ALPINE_TAG}

LABEL maintainer="Brian McMaster" \
    description="A Docker image with various network tools pre-installed."

RUN apk -U upgrade && apk add --no-cache \
    apache2-utils \
    bash \
    bash-completion \
    bind-tools \
    ca-certificates \
    coreutils \
    curl \
    drill \
    findutils \
    fping \
    git \
    ipcalc \
    iperf \
    iproute2 \
    iputils \
    jq \
    libidn \
    macchanger \
    mtr \
    net-tools \
    netcat-openbsd \
    ngrep \
    nload \
    nmap \
    nmap-scripts \
    oath-toolkit-oathtool \
    openssh-client \
    openssl \
    procps \
    socat \
    tcpdump \
    tshark \
    wget \
    python3 \
    && python3 -m ensurepip \
    && pip3 install --upgrade pip \
    && python3 -m pip install requests \
    && rm -rf /var/cache/apk/* \
    && echo 'export PS1="[docker@network-tools]\$ "' >> /root/.bash_profile

# RUN mkdir /home/awssec/

# # Set up AWS CLI in a virtualenv; system-wide autocomplete
# WORKDIR /home/awssec/
# RUN python3 -m venv awscli && \
#     echo complete -C /home/awssec/awscli/bin/aws_completer aws > ~/.bashrc && \
#     source /home/awssec/awscli/bin/activate && \
#     pip3 install --upgrade awscli && \
#     deactivate

# # Set up AWS Shell in a virtualenv
# RUN python3 -m venv awsshell && \
#     source /home/awssec/awsshell/bin/activate && \
#     pip3 install --upgrade aws-shell && \
#     deactivate

# Install Prowler (https://github.com/toniblyx/prowler)
RUN git clone https://github.com/toniblyx/prowler.git prowler

CMD ["/bin/bash", "--login", "-i"]
