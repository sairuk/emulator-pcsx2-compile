# emulator-pcsx2-compile
Compile the 32bit version of pcsx2 inside docker, uses a locally mounted volume for the compile.
Expects ```build-script``` to be located (and executable) in the root of the volume at runtime.


### Build image
``` docker build -t emulator-pcsx2-compile .```

### Run
``` docker run -d --rm -v <host path>:/home/emudev emulator-pcsx2-compile:latest ```

### Output
PCSX2 will be compiles to host path

