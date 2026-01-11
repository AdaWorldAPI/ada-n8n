FROM docker.n8n.io/n8nio/n8n:latest

USER root

COPY workflows /home/node/workflows
RUN chown -R node:node /home/node/workflows

USER node

# Railway injects PORT, n8n must use it
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=Europe/Berlin

# Security
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV N8N_VERSION_NOTIFICATIONS_ENABLED=false
ENV N8N_TEMPLATES_ENABLED=false
ENV N8N_PERSONALIZATION_ENABLED=false
ENV N8N_HIRING_BANNER_ENABLED=false
ENV N8N_RUNNERS_ENABLED=false

ENV N8N_EDITOR_BASE_URL=https://n8n.exo.red
