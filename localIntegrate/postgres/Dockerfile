FROM postgres:12.15-bookworm

ENV TZ=Asia/Tokyo

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /backend
RUN git clone https://github.com/ih14c-13-14/artist-backend.git

# PostgreSQLがポート5432で実行されるように設定
EXPOSE 5432
