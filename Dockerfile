# Docker file for the tensorflowapp plugin app

FROM fnndsc/ubuntu-python3:latest
MAINTAINER fnndsc "dev@babymri.org"

ENV APPROOT="/usr/src/tensorflowapp"  VERSION="0.1"
COPY ["tensorflowapp", "${APPROOT}"]
COPY ["requirements.txt", "${APPROOT}"]

WORKDIR $APPROOT

# default timeout bumped as tensorflow >80MB download can time out
RUN pip3 install -r requirements.txt --default-timeout=200

CMD ["tensorflowapp.py", "--help"]
