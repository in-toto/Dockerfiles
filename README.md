Dockerfiles
==========

This repository contains a series of Dockerfiles to create containers with the
in-toto Toolchain.

# Available images

There are three images as of now, `base`, `functionary`, and `verifier`.

## base

This is an alpine base image with the python version of the in-toto library
pre-installed. It can be used to further develop in-toto related images.

## functionary

This is an image built on top of `base` intended to be used as a functionary. See
installation and usage to learn how to use it.

## Verifier

This is an image built on top of `base` intended to be used as a verifier. See
installation and usage to learn how to use it.

# Installation and usage

To use these images you simply need to pull them from dockerhub or use the
`FROM intoto/base` clause in your Dockerfile.

## functionary

The functionary image uses two requiremed argument parameters and any further
arguments can be passed to it via the docker run command. The image uses the
`/workbench` to which a volume can be pointed to to pass artifacts to the
functionary.

- `IN_TOTO_FUNCTIONARY_KEY`: The path to the key used to sign link metadata.
- `STEP_NAME`: the name of the step to be performed.

### Usage example

A simple way to run this container is using a bind mount and run from the
command line.

```
    docker run -v $PWD:/workbench \
        --env=[IN_TOTO_FUNCTIONARY_KEY=mykey,STEP_NAME=say-hello]\
         intoto/functionary -- sh -c 'hello world'
```

### Using as a base image

The in-toto image is rather small, and it may not contain any binaries that you
want to use within your toolchain. However, you can extend it by building a
custom docker image on top of it. However, don't replace the ENTRYPOINT, as
that's what in-toto will use to track provenance (however, you can define any
default commands using `CMD`.

## Verifier

The verifier works similarly to the `functionary` image. On the common case,
you'd want to set the proper environment variables and bind-mount a volume to
expose the metadata and any artifacts required for verification on to the
`/workbench` directory:

```
    docker run -v $PWD/final_product:/workbench\
        --env=[IN_TOTO_LAYOUT_KEY=layout.key,LAYOUT_FILE=root.layout] \
        intoto/verifier
```

### a note on custom inspections.

If you need additional tools to run inspections, you'd have to extend this
image by using it as the base and add any additional tools you may require.
