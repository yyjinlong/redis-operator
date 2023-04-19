FROM golang:1.19.0-alpine3.16 AS builder

WORKDIR /src

COPY go.mod /src/go.mod
COPY go.sum /src/go.sum
COPY api/ /src/api/
COPY client/ /src/client/
COPY cmd/ /src/cmd/
COPY log/ /src/log/
COPY metrics/ /src/metrics/
COPY mocks/ /src/mocks/
COPY operator/ /src/operator/
COPY service/ /src/service/

RUN go env -w GOPROXY=https://goproxy.cn,direct && \
    mkdir /src/bin && \
    CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o /src/bin/redis-operator /src/cmd/redisoperator


# Use distroless as minimal base image to package the manager binary
FROM alpine:latest
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk update && \
    apk --no-cache add tzdata ca-certificates && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

COPY --from=builder /src/bin/redis-operator /usr/local/bin
RUN addgroup -g 1000 rf && \
    adduser -D -u 1000 -G rf rf && \
    chown rf:rf /usr/local/bin/redis-operator
USER rf

ENTRYPOINT ["/usr/local/bin/redis-operator"]
