FROM debian:bullseye
RUN apt-get update && apt-get install -y softflowd && apt-get clean && rm -rf /var/lib/apt/lists/*

# 网络流接收目标
ENV TARGET=127.0.0.1:2055
# 监听接口
ENV INTERFACE=eth0
# 网络流版本 支持 1 5 9 10(IPFIX) psamp
ENV NETFLOW_VERSION=9

CMD ["sh", "-c", "softflowd -i ${INTERFACE} -n ${TARGET} -v ${NETFLOW_VERSION} -D"]
