# creates statically compiled shock-server binary: /go/bin/shock-server

FROM bitnami/minideb:jessie
MAINTAINER Steve Chan sychan@lbl.gov

ARG BUILD_DATE
ARG VCS_REF
ARG GO_VER=1.5.4
ARG BRANCH=develop

RUN apt-get -y update && \
    apt-get -y install wget ca-certificates git make gcc libc-dev libsasl2-dev && \
    update-ca-certificates

# This build of shock seems to malfunction if we go above Go 1.5
RUN cd /usr/local && \
    wget https://storage.googleapis.com/golang/go1.5.4.linux-amd64.tar.gz && \
    tar xzf go1.5.4.linux-amd64.tar.gz && \
    ln -s /usr/local/go/bin/go /usr/local/bin/go

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/kbase/kb_go.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc1" \
      us.kbase.go-version=$GO_VER \
      us.kbase.vcs-branch=$BRANCH

