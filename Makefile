# Makefile for outdated Go lang versions
#
# Author: Steve Chan sychan@lbl.gov
#

all: docker_image

docker_image:
	IMAGE_NAME="kbase/kb_go" hooks/build
