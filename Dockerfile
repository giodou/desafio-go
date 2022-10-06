FROM golang:latest as builder

WORKDIR /usr/src/app/

COPY . .

RUN go build main.go

FROM scratch
WORKDIR /

COPY --from=builder /usr/src/app /

CMD ["./main"]