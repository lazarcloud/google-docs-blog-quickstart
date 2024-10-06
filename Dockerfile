
FROM golang:alpine AS golang-build

ARG CGO_ENABLED=0

ENV CGO_ENABLED=${CGO_ENABLED}

RUN apk add --no-cache gcc libc-dev

WORKDIR /golang

COPY ./go.mod ./go.sum ./

RUN go mod download

COPY ./ ./

RUN go build -o main .

FROM node:latest AS runtime

COPY ./app ./app

RUN cd /app && npm install

COPY --from=golang-build /golang/main ./main

RUN chmod +x ./main

CMD ["./main"]
