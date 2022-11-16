FROM golang AS builder
WORKDIR /app
COPY go.mod hello.go ./
RUN go build hello.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/hello .
CMD ["./hello"]