FROM alpine:latest as builder

MAINTAINER Sh1d0w <5074917+Sh1d0w@users.noreply.github.com>

WORKDIR /tmp

# Install dependencies
RUN apk add --no-cache \
  git                  \
  build-base           \
  cmake                \
  automake             \
  autoconf             \
  libtool              \
  pkgconf              \
  coreutils            \
  curl                 \
  unzip                \
  gettext-tiny-dev     \
  && rm -rf /var/cache/apk/*

ENV CMAKE_EXTRA_FLAGS=-DENABLE_JEMALLOC=OFF

# Build nvim from source
RUN git clone https://github.com/neovim/neovim \
  && cd neovim                                 \
  && git checkout stable                       \
  && make                                      \
  && make install

FROM alpine:latest

COPY --from=builder /usr/local/bin /usr/local/bin
COPY --from=builder /usr/local/share/nvim /usr/local/share/nvim

RUN apk add --update \
	python3-dev        \
  bash               \
  build-base         \
  curl               \
  diffutils          \
  git                \
  libice             \
  libsm              \
  libx11             \
  libxt              \
  ncurses            \
  nodejs             \
  npm                \
  ripgrep

RUN npm install --global yarn

ENV          \
	USER="dev" \
	UID="1000"

RUN adduser           \
	--disabled-password \
	--gecos ""          \
	--home "/home/dev"  \
	--uid "$UID"        \
	"$USER"

# Install Python Dependencies
RUN python3 -m venv ~/venv         \
	&& source ~/venv/bin/activate    \
	&& pip install -U pip setuptools \
	&& pip install pynvim

# Install Go Dependencies
RUN curl -LO https://dl.google.com/go/go1.15.2.linux-amd64.tar.gz \
	&& tar -xvf go1.15.2.linux-amd64.tar.gz                         \
	&& mv go /usr/local

ENV                      \
	GOPATH="/usr/local/go" \
	PATH="$GOPATH/bin:$PATH"

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

WORKDIR /home/dev/workspace
USER dev

COPY --chown=dev files/.config/nvim /home/dev/.config/nvim
COPY --chown=dev entrypoint.sh /entrypoint.sh

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim /home/dev/.local/share/nvim/site/pack/packer/start/packer.nvim \
	&& nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

ENTRYPOINT [ "/entrypoint.sh" ]
