#!/bin/bash

HOST_DISPLAY=1 docker run -it --env=DISPLAY -v `pwd`/projets:/home/android/projets -v `pwd`/profile:/home/android/Android -v /tmp/.X11-unix:/tmp/.X11-unix --privileged --group-add plugdev studio bash