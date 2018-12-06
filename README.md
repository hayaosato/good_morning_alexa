# good morning alexa
## 概要
アレクサに「おはよう」と言ったら今日の18時の天気と運勢を教えてくれるスキル

## データ構造
アレクサは指定のデータ形式(JSON)でオブジェクトを受け取れれば答えてくれるので、今回は以下の
データ構造をアレクサに送るようにします。
アレクサに返すデータ構造
```
{
  'version' => '1.0',
  'response' => {
    'outputSpeech' => {
      'type' => 'PlainText',
      'text' => "今日の天気は#{@weather}です。運勢は第#{@rank}位で、#{@comment}"
    },
    'shouldEndSession' => true
  }
}
```
これが変えればひとまずはOK
それぞれの項目を説明すると、
### version
アレクサに返す応答のバージョン。
とりあえず `1.0`で
### response
アレクサが何を返す(話す)のかをmapで定義します
#### outputSpeech
アレクサに何か喋らせたい場合、こちらによってアレクサに喋らせたい内容をmapで定義します。
##### type
出力される音声のタイプを定義します。ひとまず `PlainText`で。
##### text
実際にアレクサに喋らせる文書を定義します。
#### shouldEndSession
アレクサが応答した後に会話を終わらせるか、そのまま会話を継続させるかを定義します。
今回はアレクサが一回喋って終わりでいいので `true`にしておきます。

## API
- 天気: [OpenWeatherMap](https://openweathermap.org/api)
- 占い: [JugemKey](http://jugemkey.jp/api/)

## 参考
- https://developer.amazon.com/ja/alexa-skills-kit/training/building-a-skill
- https://developer.amazon.com/ja/docs/custom-skills/request-and-response-json-reference.html
- https://qiita.com/zono_0/items/57247bed70dbe2b3ce28
- https://qiita.com/yamaryu0508/items/57c0aea47f97a6b76335
- https://qiita.com/tottu22/items/6aac6690dbca951ddb47

---
powerd by <a href="http://jugemkey.jp/api/">JugemKey</a>
【PR】<a href="http://www.tarim.co.jp/">原宿占い館 塔里木</a>
