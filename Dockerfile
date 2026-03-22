FROM golang:1.26 AS build

RUN go install github.com/GoogleCloudPlatform/govanityurls@latest

FROM gcr.io/distroless/base
COPY --from=build /go/bin/govanityurls /
COPY /vanity.yaml /vanity.yaml
CMD ["/govanityurls"]
