#!/usr/bin/env sh

docker run -it --rm \
	-v $(cd $(dirname $1); pwd)/$(basename $1):/home/dev/workspace/$(basename $1) \
	neovim
