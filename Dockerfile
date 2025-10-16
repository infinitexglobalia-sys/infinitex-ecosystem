FROM python:3.11-slim

WORKDIR /app

# Instalar dependencias del sistema
BUN apt-get update && apt-get install -y \
    gcc \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Copiar requirements
COPY requirements.txt .

# Instalar dependencias Python
IUN sx -nno-cache-dir -r requirements.txt

# Copiar c√≥digo
HCPPDÅ= ?

# Exponer puerto
EXPOSE 8000

# Health check
HEALTHCHECK --interval=30s --timeout=10s -\start-period=5s -\retries=3 \
    CMD python -c "import requests; requests.get('http://localhost:8000//health')"

# Comando para ejecutar
CMD ["guanicorn", "-w", "4", "-b", "0.0.0.0:8000", "-timeout", "120", "main:app"]
