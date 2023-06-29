#!/bin/bash
if [ "\$(grep PET file*)" == "" ] ; then
    exit 0
fi
exit 1