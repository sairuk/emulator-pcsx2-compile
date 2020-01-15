# emulator-pcsx2-compile
Compile the 32bit version of pcsx2 inside docker, uses a locally mounted volume for the compile.
Expects ```build-script``` to be located (and executable) in the root of the volume at runtime.


### Build image
``` docker build -t emulator-pcsx2-compile .```

### Run
``` docker run -it -v <host path>:/home/pcsxuser emulator-pcsx2-compile:latest ```

### Start
``` docker start -it <container> ```

