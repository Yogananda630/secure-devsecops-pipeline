FROM ubuntu:22.04  # Use the latest stable version

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y <your-dependencies> && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd --create-home --shell /bin/bash appuser

WORKDIR /app

# Copy and install Python dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy application
COPY app ./app

# Set permissions
RUN chown -R appuser:appuser /app

# Use non-root user
USER appuser

EXPOSE 5000

ENV APP_ENV=production
ENV APP_VERSION=1.0.0

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:5000/health')"

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app.app:app"]
