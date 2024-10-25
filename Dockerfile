# Usando uma imagem multi-stage para reduzir o tamanho final
FROM golang:alpine AS builder

WORKDIR /app
COPY . .

RUN go build -o fullcycle

# Imagem final menor
FROM scratch
COPY --from=builder /app/fullcycle /fullcycle

ENTRYPOINT ["/fullcycle"]
