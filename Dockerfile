# Imagen base de Apify con Python + Playwright
FROM apify/actor-python-playwright:latest

# Crea carpeta de la app
WORKDIR /usr/src/app

# Copia requirements si tenés
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt || echo "No requirements.txt or already satisfied"

# Copia el código
COPY src/ ./src/

# (Opcional) si usás apify.json
COPY apify.json ./

# Comando por defecto:
# 1) Python puede ejecutar el paquete si tenés src/__main__.py
# 2) O directamente tu main.py
CMD ["python", "-m", "src"]
# alternativa:
# CMD ["python", "src/main.py"]
