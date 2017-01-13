BootStrap: debootstrap
OSVersion: stable
MirrorURL: http://ftp.us.debian.org/debian/


################################################################################
%setup
################################################################################

################################################################################
%post
################################################################################

APP=ABruijn

apt-get update
apt-get install -y vim gcc make git g++ curl bzip2 python

cat > /etc/locale.gen <<EOF
en_US.UTF-8 UTF-8
EOF
apt-get install locales


#
# initial cleanup
#
apt-get clean

# use pitchfork to install blasr. it installs a bunch of other stuff as
# well (cmake, hdf5, ncurses, ...)
mkdir -p /opt
cd /opt
git clone https://github.com/PacificBiosciences/pitchfork.git
cd pitchfork
git checkout 0d7b8a7
make init
make blasr
rm -rf workspace

# install ABruijn
cd /opt
git clone https://github.com/fenderglass/ABruijn.git
git checkout 4d3bd9d
cd ABruijn
APPVER=$(git describe)
python setup.py build


cat > /environment <<END_OF_ENV
LD_LIBRARY_PATH=/opt/pitchfork/deployment/lib:\$LD_LIBRARY_PATH
PATH=/opt/pitchfork/deployment/bin:/opt/ABruijn/bin:/bin:/usr/bin:/usr/local/bin
LANG=en_US.UTF-8
PS1="Singularity.\$SINGULARITY_CONTAINER> \$PS1"
SINGULARITY_INIT=1
APP=$APP
APPVER=$APPVER
export PATH LD_LIBRARY_PATH PS1 SINGULARITY_INIT LANG APP APPVER
END_OF_ENV


################################################################################
%runscript
################################################################################

cat <<EOF

This Singularity image contains the long read assembler ABruijn.
It can be used directly like so:

    singularity exec abruijn-container.img <cmd> <args>

However, links to individual commands in the image
are provided for convenience.

pitchfork repo commit: 0d7b8a7
ABruijn   repo commit: 4d3bd9d
EOF
