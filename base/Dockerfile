FROM alpine:latest
LABEL maintainer="Santiago Torres Arias <santiago@nyu.edu>"

ADD base/minimal_sample.py /usr/share/in-toto/samples/minimal.py
ADD base/complete_sample.py /usr/share/in-toto/samples/complete.py

RUN apk update && apk add python2 python2-dev py2-pip build-base py2-cffi libressl-dev

# FIXME: colorama shouldn't be there, but the upstream dependency is broken
# until the next release.
RUN pip install in-toto colorama

WORKDIR /workbench/
