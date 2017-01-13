#!/bin/bash
# create symbolic links to this wrapper to execute 
# applications in the container of the same name.
# for example create link 
#    abruijn -> abruijn-wrapper.sh
# to execute abruijn packaged in the container 

image="abruijn-container.img"

#Customise for your setup
#SINGULARITY_BINDPATH=""
export SINGULARITY_BINDPATH

cmd=$(basename "$0")
image_path="$(dirname "$0")/../${image}"
singularity exec "${image_path}" $cmd "$@"
