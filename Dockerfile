# Docker file for the tensorflowapp plugin app

FROM fnndsc/ubuntu-python3:latest
MAINTAINER fnndsc "dev@babymri.org"

ENV APPROOT="/usr/src/tensorflowapp"  VERSION="0.1"
COPY ["tensorflowapp", "${APPROOT}"]
COPY ["requirements.txt", "${APPROOT}"]

WORKDIR $APPROOT

RUN pip install -r requirements.txt

CMD ["tensorflowapp.py", "--help"]