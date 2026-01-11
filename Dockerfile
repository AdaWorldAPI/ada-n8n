FROM docker.n8n.io/n8nio/n8n:latest

USER root

# Copy workflows
COPY workflows /home/node/workflows
RUN chown -R node:node /home/node/workflows

USER node

# Environment - secrets from Railway
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_SECURE_COOKIE=true
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=Europe/Berlin
ENV WEBHOOK_URL=https://n8n.exo.red

# Ada endpoints
ENV ADA_MCP_URL=https://mcp.exo.red
ENV ADA_POINT_URL=https://point.exo.red

EXPOSE 5678
