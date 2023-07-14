# syntax = docker/dockerfile:1.4

ARG NODE_VERSION=18.16.1-bullseye as builder

FROM node:${NODE_VERSION} AS builder

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
	--mount=type=cache,target=/var/lib/apt,sharing=locked \
	rm -f /etc/apt/apt.conf.d/docker-clean \
	; echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache \
	&& apt-get update \
	&& apt-get install -yqq --no-install-recommends \
	build-essential

RUN corepack enable

WORKDIR /frontend

RUN git clone https://github.com/ih14c-13-14/artist-frontend.git --depth 1 -b main

WORKDIR /frontend/artist-frontend

ARG API_BASE_URL="http://127.0.0.1:4010"
ARG VITE_MAPS_API_KEY="YOUR_API_KEY"

ENV API_BASE_URL=${API_BASE_URL}
ENV VITE_MAPS_API_KEY=${VITE_MAPS_API_KEY}

RUN git submodule update --init && yarn install --immutable
RUN yarn build
RUN rm -rf .git/ 


FROM nginx:1.25.1 as server

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
	apt-utils \
  locales \
	&& apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /root/.gnupg /tmp/library-scripts


RUN echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
  locale-gen ja_JP.UTF-8

ENV LC_ALL ja_JP.UTF-8

# 初期状態の設定ファイル
ADD ./conf.d/default.conf.template /etc/nginx/conf.d/default.conf.template

# builderの/frontend/dist/をコピー
COPY --from=builder /frontend/artist-frontend/dist /usr/share/nginx/html
