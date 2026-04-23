# 使用最轻量级的 Nginx 镜像
FROM nginx:alpine

# 1. 强制清空 Nginx 默认的静态目录（这一步能解决你看到的 "Welcome to nginx" 问题）
RUN rm -rf /usr/share/nginx/html/*

# 2. 将当前目录下的 index.html 复制到 Nginx 默认的网页根目录
# 如果你有其他图片或资源文件夹，这一行也会一并复制过去
COPY . /usr/share/nginx/html/

# 3. 暴露 80 端口（Nginx 默认端口）
EXPOSE 80

# 4. 启动 Nginx 服务
CMD ["nginx", "-g", "daemon off;"]