FROM ruby:3.2

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client

# 作業ディレクトリを作成
WORKDIR /app

# GemfileとGemfile.lockをコピー
COPY Gemfile* ./

# Gemをインストール
RUN bundle install

# アプリコードをコピー
COPY . .

# ポート3000を公開
EXPOSE 3000

# サーバを起動
CMD ["rails", "server", "-b", "0.0.0.0"]
