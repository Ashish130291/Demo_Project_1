FROM alpine:latest AS BUILDER
WORKDIR /app
COPY index.html .

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=BUILDER /app/index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]