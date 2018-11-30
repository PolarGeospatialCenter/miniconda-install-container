FROM debian

RUN apt-get update && apt-get install -y bzip2
ADD https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh /Miniconda3.sh
COPY install.sh /usr/bin/

CMD /usr/bin/install.sh
