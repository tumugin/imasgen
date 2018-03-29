# Imasgen

imasgenはアイドルマスターシリーズのキャラクターの名前をランダムに返すライブラリです。gimeiやfakerのように使えます。
ミリオンライブ！、SideM、シンデレラガールズのキャラクター名を収録しています。

## Usage

### ランダムに名前を取得する
```ruby
# ミリオンライブ！のキャラクター名を取得する
name = Imasgen.millionlive.name
name.kanji #=> "百瀬 莉緒"
name.hiragana #=> "ももせ りお"
name.katakana #=> "モモセ リオ"
name.romaji #=> "Rio Momose"
name.last.kanji #=> "百瀬"
name.last.hiragana #=> "ももせ"
name.first.kanji #=> "莉緒"
name.first.hiragana #=> "りお"
```
SideM、シンデレラガールズのキャラクター名を取得するには...
```ruby
sidem = Imasgen.sidem.name
sidem.kanji #=> "桜庭 薫"
cg = Imasgen.cinderella.name
cg.kanji #=> "櫻井 桃華"
```
また、このような使い方もできます。
```ruby
"My name is #{Imasgen.millionlive.name}" #=> "My name is 桜守 歌織"
```

### 名前と苗字をごちゃ混ぜにする
```ruby
name = Imasgen.millionlive.hotchpotch
name.kanji #=> "四条 紬"
```

### 複数事務所混ぜてそこからランダムで取得する

複数の事務所の所属アイドルを全部ごちゃ混ぜにしてランダムに取得したいときは以下の方法で出来ます。
```ruby
mixnuts = Imasgen.mixnuts(Imasgen::CINDERELLA, Imasgen::MILLIONLIVE, Imasgen::SIDEM)
# また、省略して以下のように書くこともできます。
mixnuts = Imasgen.mixnuts
# 生成したリストから名前を取得
name = mixnuts.name
name.kanji #=> "最上 静香"
# 名前と苗字をごちゃ混ぜにすることもできます
hotchpotch = mixnuts.hotchpotch
hotchpotch.kanji #=> "持田 梨沙"
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'imasgen'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install imasgen

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tumugin/imasgen.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
