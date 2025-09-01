FROM golang:1.15.7 AS builder
WORKDIR /go/src/example/workload/cmd/workload
ADD . /go/src/example/workload
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go install .

FROM alpine:latest  
WORKDIR /root
COPY --from=builder /go/bin/workload .
ENTRYPOINT ["/root/workload"]
