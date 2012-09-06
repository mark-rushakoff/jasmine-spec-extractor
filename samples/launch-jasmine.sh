#!/bin/sh

# I've used a script like this on several projects. Just attach it to a
# keybinding in your favorite editor and start running focused specs!

# don't forget to point this to the right command
EXTRACT_COMMAND="src/extract-spec.sh"
OPEN_BROWSER_COMMAND="open" # might be firefox or chromium-browser on Linux

JASMINE_ROOT="http://localhost:8888/"
SPEC_PREFIX="?spec="

if [ -z "$1" ]; then
  # we were invoked without arguments - assume to run all specs
  $OPEN_BROWSER_COMMAND "$JASMINE_ROOT"
else
  SPEC=$(${EXTRACT_COMMAND} "$1")

  # At least on OSX and Linux, I haven't seen a need to URL-encode this manually
  $OPEN_BROWSER_COMMAND "${JASMINE_ROOT}${SPEC_PREFIX}${SPEC}"
fi
