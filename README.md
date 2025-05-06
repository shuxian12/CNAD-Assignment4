# CNAD-Assignment4
> This is the Assignment 04 of  CNAD 2025 Spring 
* This is a simple flask web application that can only show "Hello World" on the web page.

## Setup
### Prerequisites
* Docker
  * Docker Hub account: shuxian12
  * Docker Registry: 2025cloud
  * [Docker Hub](https://hub.docker.com/r/shuxian12/2025cloud/tags)

### Clone the repository
```bash
git clone https://github.com/shuxian12/CNAD-Assignment4.git
cd CNAD-Assignment4
```

### Build the docker image
```bash
docker build -t 2025cloud .
```

### Run the docker container
```bash
docker run -p 8000:8000 --name cnad-assignment4 2025cloud
```

### Access the web application
* Open your web browser and go to `http://localhost:8000` or `http://127.0.0.1:8000` to see the "Hello World" message.

### Stop the docker container
```bash
docker stop cnad-assignment4
# or just press `Ctrl+C` in the terminal where the container is running
```

### Remove the docker container
```bash
docker rm cnad-assignment4
```

## Docker Hub
> Please login to your Docker Hub account before pushing the image.

### Push the docker image to Docker Hub
```bash
docker tag 2025cloud shuxian12/2025cloud:latest
docker push shuxian12/2025cloud:latest
```

### Pull the docker image from Docker Hub
```bash
docker pull shuxian12/2025cloud:latest
```

## 描述目前專案自動化產生 Container Image 的邏輯，以及 Tag 的選擇邏輯 (其他內容請詳閱 pdf report)
> 補充： 自動化產生 Image 只會發生在 push 到 repo 以及 PR 到 main branch 時才會發生：
> on:
>  push:
>  pull_request:
>    branches: [ main ]
* 這個專案的自動化產生 Container Image 的邏輯是使用 Dockerfile 來定義如何構建這個映像檔。Dockerfile 中包含了所有需要的指令，例如安裝依賴、複製檔案和設置環境變數等。
  * 使用 Docker 所提供的 github action 來自動化構建和推送映像檔到 Docker Hub。這樣可以確保每次提交代碼時，映像檔都會自動更新，並且可以在 Docker Hub 上輕鬆地訪問和下載最新的映像檔。
  * 在 GitHub 上的工作流程文件中，使用了 `docker/build-push-action` 這個 action 來構建和推送映像檔。這個 action 可以自動檢測代碼的變更，並根據 Dockerfile 中的指令來構建映像檔。
  * 當代碼提交到 GitHub 時，這個 action 會自動運行，並使用 Dockerfile 中的指令來構建映像檔。然後，它會將構建好的映像檔推送到 Docker Hub 上的指定倉庫中。
* Tag 的選擇邏輯是使用 shuxian12/2025cloud:{github commit sha::7} 這個格式來標記映像檔，其中 shuxian12 是 Docker Hub 的用戶名，2025cloud 是映像檔的名稱，tag 是 GitHub commit 的 SHA 值的前 7 位。這樣可以確保每個映像檔都有唯一的標記，方便以後的版本管理和追蹤。
```yaml
name: Build and push
uses: docker/build-push-action@v6
with:
    push: true
    tags: ${{ env.LATEST_TAG }}-${{ env.SHORT_SHA }}
```
