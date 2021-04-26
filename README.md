# yuketang-dl

## 安装依赖

### Ubuntu

```
sudo apt install -y curl jq aria2 ffmpeg
```

## 下载视频

1. 用 Chrome 打开雨课堂，点开视频页之前按 F12；
2. 点开视频页后在 Network 的过滤器中输入 timeline，在过滤得到的项上右键 Copy response；
3. 将剪贴板保存到文件 `timeline.json`，运行 `bash yuketang-dl.sh timeline.json`。
