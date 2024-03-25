FROM python:3.12-alpine

WORKDIR /app

COPY requirements.txt .

RUN apk add --no-cache git make build-base linux-headers
RUN pip install --no-cache-dir -r requirements.txt
RUN apk del git make build-base linux-headers

COPY . .
CMD ["python", "-u", "index.py"]