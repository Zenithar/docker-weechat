FROM alpine:edge
MAINTAINER Thibault NORMAND <me@zenithar.org>

ADD entrypoint.sh /

# Add GOSU
ADD https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 /bin/gosu
RUN chmod +x /bin/gosu \
    && chmod +x /entrypoint.sh

# Install weechat + addons
RUN apk --update add weechat \
    weechat-lua weechat-python weechat-perl weechat-ruby \
    weechat-aspell

# Create default user
RUN addgroup weechat \
    && adduser -s /bin/false -G weechat -S -D weechat


WORKDIR /home/weechat
CMD     ["/entrypoint.sh"]
