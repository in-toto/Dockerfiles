#!/bin/sh
ARGS=""
EXECUTABLE=in-toto-run
if [ -z "$IN_TOTO_FUNCTIONARY_KEY" ]
then
    EXECUTABLE=in-toto-mock
    echo "warning! no key is set, we will be creating a mock link instead..."
else
    ARGS="-k  $IN_TOTO_FUNCTIONARY_KEY" 
fi

if [ -z "$STEP_NAME" ]
then
    ARGS="$ARGS -n step"
else
    ARGS="$ARGS -n $STEP_NAME"
fi

if [ -n "$IN_TOTO_RUN_EXTRA_ARGS" ]
then
    ARGS="$ARGS $IN_TOTO_RUN_EXTRA_ARGS"
fi

$EXECUTABLE $ARGS -- $@
