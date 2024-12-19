FROM ruby:3.1.2

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client

# 作業ディレクトリを作成
WORKDIR /app

# 環境変数を設定
ENV LD_FLAGS="-L$(brew --prefix zstd)/lib"
ADD ./Gemfile Gemfile
# Gemをインストール
RUN bundle install

ADD ./Gemfile.lock Gemfile.lock

# アプリコードをコピー
COPY . .

RUN rm -f /app/tmp/pids/server.pid

# サーバを起動
CMD ["rails", "server", "-b", "0.0.0.0"]