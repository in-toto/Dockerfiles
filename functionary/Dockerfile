FROM intoto/base:latest
LABEL maintainer="Santiago Torres Arias <santiago@nyu.edu>"

WORKDIR workspace
ENTRYPOINT ["in-toto-run", "-k", "$IN_TOTO_FUNCTIONARY_KEY", "-n", "$STEP_NAME"]
