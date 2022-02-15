FROM alpine:20210804

RUN apk add tftp-hpa

CMD [ "in.tftpd", "--foreground", "--secure", "/var/lib/tftpboot" ]
