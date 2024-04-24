FROM golang:alpine3.19 AS builder
COPY go.* /

RUN go mod download
COPY *.go /
RUN go build -o /k8s-pod-restart-info-collector /

FROM alpine:3.19.1
COPY --from=builder /k8s-pod-restart-info-collector /k8s-pod-restart-info-collector
CMD ["/k8s-pod-restart-info-collector"]