FROM --platform=linux/amd64 ubuntu:22.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    libsodium23 \
    libsqlite3-0 \
    libcurl4 \
    libssl3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy server binary (Linux build)
COPY MatchServer ./
RUN chmod +x MatchServer

# Copy all configuration files
COPY *.xml *.ini ./

# Copy Maps directory for quest maps
COPY Maps/ ./Maps/

EXPOSE 6000/udp 6000/tcp

CMD ["./MatchServer"]
