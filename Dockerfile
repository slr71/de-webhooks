FROM discoenv/golang-base:master

ENV CONF_TEMPLATE=/go/src/github.com/cyverse-de/de-webhooks/webhooks.yml.tmpl
ENV CONF_FILENAME=webhooks.yml
ENV PROGRAM=de-webhooks

ARG git_commit=unknown
ARG version="2.9.0"
ARG descriptive_version=unknown

LABEL org.cyverse.git-ref="$git_commit"
LABEL org.cyverse.version="$version"
LABEL org.cyverse.descriptive-version="$descriptive_version"

COPY . /go/src/github.com/cyverse-de/de-webhooks
RUN go install -v -ldflags "-X main.appver=$version -X main.gitref=$git_commit" github.com/cyverse-de/de-webhooks

LABEL org.label-schema.vcs-ref="$git_commit"
LABEL org.label-schema.vcs-url="https://github.com/cyverse-de/de-webhooks"
LABEL org.label-schema.version="$descriptive_version"
