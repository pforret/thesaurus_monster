#!/bin/bash

LANGUAGE=en-us
FOLDER=./sources/$LANGUAGE

  cat $FOLDER/*.words \
| sort -u \
> output/thesaurus.$LANGUAGE.txt