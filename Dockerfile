# ベースとなるイメージ
FROM ubuntu:latest

WORKDIR /app

COPY requirements.txt .

# RUNでコンテナ生成時に実行する
RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN pip install -r requirements.txt

COPY main.py .

EXPOSE 8000
# FastAPIを8000ポートで待機
CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]