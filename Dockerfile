# 1. 使用上一步加载的镜像作为基础
FROM 15432d16a8da

# 2. 移除原有的 OpenClaw 相关文件
# 注意：请根据原镜像中OpenClaw的实际安装路径修改
# 3. 安装 Hermes Agent
# 安装脚本需要 curl，先确保系统包管理器可用
RUN openclaw gateway stop && \
    openclaw gateway uninstall && \
    rm -rf root/.openclaw && \
    apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash
