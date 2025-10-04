# 使用官方 Python 3.11 slim 镜像作为基础镜像
FROM docker.io/library/python:3.11-slim

# 设置工作目录
WORKDIR /

# 设置环境变量
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# 复制服务器依赖文件
COPY . .

# 安装 Python 依赖
RUN pip install --no-cache-dir -r requirements.txt && pip install --no-cache-dir -r server/requirements-server.txt

# 暴露端口
EXPOSE 1223

# 启动命令
CMD ["python", "server.py"]
