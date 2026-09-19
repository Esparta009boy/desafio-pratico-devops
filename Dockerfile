# Etapa 1: Build da aplicação (Multi-stage)
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .

# Etapa 2: Imagem final para produção (mínima e sem root - LGPD)
FROM node:18-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production

# Executa com usuário sem privilégios de administrador (Segurança / LGPD)
USER node

COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/src ./src

EXPOSE 3000
CMD ["npm", "start"]