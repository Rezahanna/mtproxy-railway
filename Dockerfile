FROM alpine:3.18

RUN apk add --no-cache \
        build-base \
        linux-headers \
        git \
        python3 \
        py3-pip

WORKDIR /app

RUN git clone https://github.com/alexbers/mtprotoproxy.git .

RUN pip3 install --no-cache-dir -r requirements.txt

ENV SECRET=9125f60446d97a9404932b4318bfc0906f6f0132802a8009f1d1276c76bf40ff
ENV PORT=443

EXPOSE 443

CMD ["python3", "mtprotoproxy.py", "-p", "443", "-s", "1234567890abcdef1234567890abcdef", "--user", "nobody", "--address", "0.0.0.0"]
