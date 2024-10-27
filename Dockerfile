# Etapa de construção
FROM golang:alpine AS builder
WORKDIR /app
COPY . .

# Compilando o binário otimizado
RUN go build -ldflags="-s -w" -o fullcycle

# Imagem final menor
FROM scratch
COPY --from=builder /app/fullcycle /fullcycle
ENTRYPOINT ["/fullcycle"]

