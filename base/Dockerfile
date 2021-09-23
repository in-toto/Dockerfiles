FROM alpine:3.14 as base-image

RUN apk update && apk add python3 python3-dev py3-pip build-base py3-cffi libressl-dev libffi-dev
RUN pip install --upgrade pip && pip install wheel
WORKDIR /root
# install latest pinned requirements available from in-toto repo
# by doing this via '--user' we keep all libs/wheels in ~/.local
# which can be easily copied into our second stage of the image build
RUN wget https://github.com/in-toto/in-toto/raw/develop/requirements-pinned.txt
RUN pip install --user -r requirements-pinned.txt
RUN pip install --user in-toto

FROM alpine:3.14 AS built-image
LABEL maintainer="Santiago Torres Arias <santiago@nyu.edu>"

RUN apk update && apk add python3
COPY --from=base-image /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH
RUN mkdir /workspace
WORKDIR /workspace
