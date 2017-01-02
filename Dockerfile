FROM alpine:3.4
MAINTAINER Shiva Velmurugan <shiv@shiv.me>

LABEL org.label-schema.vendor="Shiva Velmurugan" \
      org.label-schema.name="Alpine linux image for CI/CD of C/C++ projects" \
      org.label-schema.license="MIT" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version="${VERSION}" \
      org.label-schema.schema-version="1.0.0-rc.1" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-type="git" \
      org.label-schema.vcs-url="https://github.com/shiva/docker-cpp-build"

RUN echo http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add --update --no-cache \
 build-base \
 cmake \
 git \
 lcov
COPY build_install_cpputest.sh /home/root/build_install_cpputest.sh
ENV GIT_SSL_NO_VERIFY "1"
RUN /home/root/build_install_cpputest.sh && rm -f /home/root/build_install_cpputest.sh
