FROM alpine:latest AS builder
WORKDIR /app
RUN apk --no-cache add curl unzip
ENV RELEASE "v9.12.0"
RUN curl -fL "https://github.com/gchq/CyberChef/releases/download/$RELEASE/CyberChef_$RELEASE.zip" -o "src.zip" && unzip "src.zip" && rm "src.zip"
RUN mv "CyberChef_$RELEASE.html" "index.html"

FROM nginx:alpine
COPY --from=builder /app /usr/share/nginx/html
