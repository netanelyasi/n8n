FROM node:16-alpine

RUN apk add --update graphicsmagick tzdata

ENV NODE_ENV=production
ENV N8N_SKIP_STATISTICS_LOGGING=true

RUN npm install -g n8n

EXPOSE ${PORT}

CMD n8n start
