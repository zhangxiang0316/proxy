# 使用官方Node.js运行时作为基础镜像
FROM node:18-alpine

# 安装netcat用于健康检查
RUN apk add --no-cache netcat-openbsd

# 设置工作目录
WORKDIR /app

# 复制package.json和package-lock.json
COPY package*.json ./

# 配置国内镜像源
RUN npm config set registry 'https://registry.npmmirror.com/'

# 安装pnpm
RUN npm install -g pnpm

# 安装依赖
RUN pnpm install

# 复制应用代码
COPY app.js ./

# 暴露端口
EXPOSE 36699

# 创建非root用户
RUN addgroup -g 1001 -S nodejs
RUN adduser -S nodejs -u 1001

# 切换到非root用户
USER nodejs

# 启动应用
CMD ["npm", "start"]