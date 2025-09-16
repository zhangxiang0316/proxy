# Node.js WebSocket 代理服务器

一个基于 Node.js 和 WebSocket 的轻量级代理服务器，支持通过 WebSocket 连接进行网络代理。

## 功能特性

- 🚀 基于 WebSocket 的代理连接
- 🔒 UUID 身份验证机制
- 🌐 支持 IPv4、IPv6 和域名解析
- 🐳 Docker 容器化部署
- 📊 连接日志记录
- 🔄 自动重启和健康检查

## 技术栈

- **Node.js** - 运行时环境
- **WebSocket (ws)** - WebSocket 服务器实现
- **Docker** - 容器化部署
- **Docker Compose** - 服务编排

## 快速开始

### 环境要求

- Node.js 18+
- Docker (可选)
- Docker Compose (可选)

### 本地运行

1. 克隆项目并安装依赖：
```bash
npm install
```

2. 启动服务：
```bash
npm start
```

服务将在端口 36699 上启动。

### Docker 部署

1. 使用 Docker Compose 一键部署：
```bash
docker-compose up -d
```

2. 或者手动构建和运行：
```bash
# 构建镜像
docker build -t nodejs-proxy .

# 运行容器
docker run -d \
  --name proxy \
  -p 9021:36699 \
  -e UUID=264f7731-d14a-43f4-9f53-80e0bb9756dc \
  -e PORT=36699 \
  nodejs-proxy
```

## 配置说明

### 环境变量

| 变量名 | 默认值 | 说明 |
|--------|--------|------|
| `UUID` | `264f7731-d14a-43f4-9f53-80e0bb9756dc` | 客户端身份验证UUID |
| `PORT` | `36699` | WebSocket 服务器监听端口 |
| `NODE_ENV` | - | Node.js 运行环境 |

### 端口映射

- **容器内端口**: 36699
- **主机端口**: 9021 (可在 docker-compose.yml 中修改)

## 使用方法

1. 客户端通过 WebSocket 连接到服务器
2. 发送包含 UUID 和目标地址信息的消息
3. 服务器验证 UUID 后建立到目标服务器的连接
4. 数据通过 WebSocket 双向传输

## 项目结构

```
.
├── app.js              # 主应用文件
├── package.json        # 项目依赖配置
├── Dockerfile          # Docker 镜像构建文件
├── docker-compose.yml  # Docker Compose 配置
└── README.md          # 项目文档
```

## 健康检查

Docker 容器包含健康检查机制：
- 检查间隔：30秒
- 超时时间：10秒
- 重试次数：3次
- 启动等待：40秒

## 安全注意事项

- 请修改默认的 UUID 以提高安全性
- 建议在生产环境中使用 HTTPS/WSS
- 定期更新依赖包以修复安全漏洞
- 考虑添加访问控制和速率限制

## 故障排除

### 常见问题

1. **连接被拒绝**
   - 检查端口是否正确映射
   - 确认防火墙设置
   - 验证 UUID 是否匹配

2. **容器启动失败**
   - 检查端口是否被占用
   - 查看容器日志：`docker logs proxy`

3. **健康检查失败**
   - 确认服务正常启动
   - 检查网络连接

### 查看日志

```bash
# Docker 容器日志
docker logs -f proxy

# Docker Compose 日志
docker-compose logs -f
```

## 开发

### 本地开发

```bash
# 安装依赖
npm install

# 启动开发服务器
npm start
```

### 代码结构

- `app.js` - 主要的 WebSocket 服务器逻辑
- 支持多种地址类型（IPv4、IPv6、域名）
- 包含错误处理和日志记录

## 许可证

本项目采用 MIT 许可证。

## 贡献

欢迎提交 Issue 和 Pull Request 来改进这个项目。