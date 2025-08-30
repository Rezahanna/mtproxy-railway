FROM python:3.11-slim

WORKDIR /app

# وابستگی‌ها
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# دانلود و نصب MTProxy
RUN git clone https://github.com/alexbers/mtprotoproxy.git . && \
    pip install --no-cache-dir -r requirements.txt

ENV SECRET=9125f60446d97a9404932b4318bfc0906f6f0132802a8009f1d1276c76bf40ff

EXPOSE 443

CMD ["python3", "mtprotoproxy.py", "-p", "443", "-s", "${SECRET}", "--user", "nobody", "--address", "0.0.0.0"]
