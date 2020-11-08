## FROM ubuntu:18.04
FROM registry.cn-hangzhou.aliyuncs.com/aliyun-node/alinode:v5.16.0-alpine
# 修改源
# RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse" >> /etc/apt/sources.list && \
#   echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse" > /etc/apt/sources.list && \
#   echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse" > /etc/apt/sources.list && \
#   echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse" > /etc/apt/sources.list

# RUN apt-get update
# RUN apt install -y curl && \
#   apt install -y wget

# 项目目录
WORKDIR /usr/src/app

# 安装 cnpm
RUN npm install cnpm -g --registry=https://r.npm.taobao.org

# # Volume
COPY package.*json ./

RUN cnpm i

COPY . .

EXPOSE 3333

CMD [ "node", "app.js" ]
