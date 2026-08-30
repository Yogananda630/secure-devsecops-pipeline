FROM python:3.12-slim-trixie

# Update system packages and install the latest security fixes
RUN apt-get update && \
    apt-get install -y --only-upgrade openssl libssl3t64 openssl-provider-legacy && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd --create-home --shell /bin/bash appuser

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app

RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 5000

ENV APP_ENV=production
ENV APP_VERSION=1.0.0

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:5000/health')"

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app.app:app"]
