FROM debian:bookworm-slim AS iventoy-downloader
ARG IVENTOY_VERSION_NS
WORKDIR /iventoy
RUN apt update && apt install wget -y
RUN wget https://github.com/ventoy/PXE/releases/download/v${IVENTOY_VERSION_NS}/iventoy-${IVENTOY_VERSION_NS}-linux-free.tar.gz && \
    tar -xvf *.tar.gz && \
    rm -rf iventoy-${IVENTOY_VERSION_NS}-linux.tar.gz && \
    mv iventoy-${IVENTOY_VERSION_NS} iventoy && ls -al iventoy && \
    mv iventoy/data iventoy/data2

FROM debian:bookworm-slim AS final
ENV AUTO_START_PXE=true
WORKDIR /app

COPY --from=iventoy-downloader /iventoy/iventoy /app/
COPY scripts/entrypoint.sh /entrypoint.sh

VOLUME /app/iso
VOLUME /app/data

EXPOSE 16000/tcp 26000/tcp

CMD ["/entrypoint.sh"]
