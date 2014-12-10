twitter-gateway
===============

@zorrilla_氏作の[Twitpic API to twitter media upload gateway](http://lanieve.jp/picgw/)をもとに作成した、YorufukurouでTwitter公式に画像を上げるためのゲートウェイです。


Sinatraで書かれています。

Herokuで動かすことを想定しています。

## Installation
```
git clone git@github.com:alstamber/twitter-gateway.git # Cloning
cd twitter-gateway
heroku create APP_NAME
heroku config:set CONSUMER_KEY=****
heroku config:set CONSUMER_SECRET=****
heroku config:set ACCESS_TOKEN=****
heroku config:set ACCESS_TOKEN_SECRET=****
heroku config:set BEARER=**** # 簡易認証のためのランダムな文字列
git push heroku master
```

## Usage
1. メニューの「設定」→「サービス」→「イメージサービス」で「カスタム……」を選択
1. APIのURLを次の通り設定する
```
http://APP_NAME.herokuapp.com/upload?bearer=BEARER
```

あとは通常の画像アップロードと同じ操作でアップロードするだけです。

「タイトル」にテキストを入力すると、そのテキストも一緒にツイートされます。
