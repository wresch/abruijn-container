# this is a long read assembler. It has a dependency that uses it's own
# build system (pitchfork) which installs hdf5, cmake, htslib, ...
# better put it in a container

APP=abruijn

# create links to the wrapper
ln -s ${APP}-wrapper.sh abruijn
ln -s ${APP}-wrapper.sh abruijn-assemble
ln -s ${APP}-wrapper.sh abruijn-polish
ln -s ${APP}-wrapper.sh blasr
ln -s ${APP}-wrapper.sh sawriter

