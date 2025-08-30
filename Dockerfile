FROM telegrammessenger/proxy:latest

# متغیر محیطی Secret را می‌گیرد یا از ARG می‌سازیم
ENV SECRET=9125f60446d97a9404932b4318bfc0906f6f0132802a8009f1d1276c76bf40ff

EXPOSE 443

# دستور اجرایی با فرمت درست
ENTRYPOINT ["/mtproto-proxy", "-u", "nobody", "-H", "443", "-S", "${SECRET}", "--aes-pwd", "/proxy-secret", "--user", "nobody", "--address", "0.0.0.0"]
