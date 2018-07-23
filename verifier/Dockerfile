FROM intoto/base:latest
LABEL maintainer="Santiago Torres Arias <santiago@nyu.edu>"

WORKDIR workspace
ENTRYPOINT ["in-toto-verify", "-k", "$IN_TOTO_LAYOUT_KEY", "-l" , "$LAYOUT_FILE"]
