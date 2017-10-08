# docker-pcsx2-compile
Compile the 32bit version of pcsx2 inside docker, uses a locally mounted volume for the compile.
Expects ```build-script``` to be located (and executable) in the root of the volume at runtime.


### Build image
``` docker build -t pcsx2compile .```

### Run
``` docker run -it -v <host path>:/home/pcsxuser pcsx2compile:latest ```

### Start
``` docker start -it <container> ```

### Example build-script
```
#!/bin/bash

GITREPO=https://github.com/PCSX2/pcsx2.git
REPODIR=pcsx2
BUILD=release   # devel | debug | release


cd $HOME
if [ ! -d ${HOME}/${REPODIR}/.git ]; then
    git clone $GITREPO
fi

cd ${HOME}/${REPODIR}
git pull
```
