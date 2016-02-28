FROM alpine:edge
MAINTAINER Thibault NORMAND <me@zenihtar.org>

RUN apk --update add weechat \
    weechat-lua weechat-python weechat-perl weechat-ruby \
    weechat-aspell

# Create default user
RUN addgroup weechat \
    && adduser -s /bin/false -G weechat -S -D weechat

USER weechat
WORKDIR /home/weechat

CMD ["weechat"]
