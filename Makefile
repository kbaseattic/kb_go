# Makefile for outdated Go lang versions
#
# Author: Steve Chan sychan@lbl.gov
#

all: docker_image

docker_image:
	IMAGE_NAME="kb_go:1.5.4" hooks/build
