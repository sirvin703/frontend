# Small, production-grade static server for the frontend
FROM nginx:1.27-alpine

# Copy static assets into the default nginx web root
COPY public/ /usr/share/nginx/html

# Simple healthcheck to verify the container responds
HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD wget -q --spider http://localhost/ || exit 1
