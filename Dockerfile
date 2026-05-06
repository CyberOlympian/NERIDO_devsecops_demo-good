FROM python:3.11-slim-bookworm

# Create a non-root user and group
RUN groupadd -r appuser && useradd -r -g appuser appuser

# Set working directory
WORKDIR /app

# NEW STEP: Upgrade core Python build tools to patch base image vulnerabilities
RUN pip install --no-cache-dir --upgrade pip setuptools wheel jaraco.context

# Copy and install dependencies securely
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app/ ./app/

# Transfer ownership to the non-root user
RUN chown -R appuser:appuser /app

# Enforce running as the non-root user
USER appuser

EXPOSE 8080

# Use array syntax for CMD to avoid shell injection vulnerabilities
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
