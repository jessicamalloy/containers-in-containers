# This is the outer container
FROM python:3.6

# Install Docker in the container
RUN apt-get update
RUN apt-get -y install ca-certificates gnupg software-properties-common

RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN chmod a+r /etc/apt/keyrings/docker.gpg

RUN echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update
RUN apt-get install -y docker-ce-cli

# Copy inner container into outer container
COPY . .

# Mount Docker socket
# docker run -it -v /var/run/docker.sock:/var/run/docker.sock outer-container /bin/bash