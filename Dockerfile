FROM alpine:latest AS builder
WORKDIR /app
RUN apk --no-cache add curl unzip
ENV VERSION "9.0.1"
RUN curl -fL "https://github.com/gchq/CyberChef/releases/download/v$VERSION/CyberChef_v$VERSION.zip" -o "src.zip" && unzip "src.zip" && rm "src.zip"
RUN mv "CyberChef_v$VERSION.html" "index.html"

FROM nginx:alpine
COPY --from=builder /app /usr/share/nginx/html
