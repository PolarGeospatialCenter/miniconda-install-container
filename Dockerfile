FROM ubuntu

RUN apt-get update && apt-get install -y ansible wget bzip2 libssl1.0.0
COPY ansiblerun/ /ansiblerun/

ENV HOME=/opt/ansible
RUN mkdir -p $HOME
WORKDIR /ansiblerun/
RUN ansible-galaxy install -r requirements.yml
RUN ansible-playbook bootstrap.yml

FROM alpine

RUN apk add --no-cache rsync
COPY --from=0 /opt/ansible/bin /opt/ansible/bin
COPY --from=0 /opt/ansible/pypy /opt/ansible/pypy
CMD rsync -a --delete /opt/ansible/ /install/
