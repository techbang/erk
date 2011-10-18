---
layout: post
title: "使用 Plug-in 來擴充 Rails"
date: 2011-10-18 14:05
comments: true
author: chitsaou
categories: 
---
## 簡介
Plug-in 可以為 Rails application 加上額外的功能，例如有提供 [HTTP Authentication](https://github.com/dshimy/http_authentication "dshimy/http_authentication") 的 Plug-in。在 Rails application 啟動時會載入 Plug-in ，讓 Rails 可以直接使用 Plug-in 提供的程式庫。

如果你的 Rails application 實作了某個功能，則可以考慮將它獨立成 plug-in ，依照 Rails Plug-in 的程式架構撰寫 Plug-in ，就能讓其他 Rails developer 也可以使用。此外 Plug-in 還可以打包成 Gem ，不只更方便安裝，透過 [Bundler](http://gembundler.com/) ，也更容易管理版本。

使用 Plug-in 有以下的好處：

* Don't Repeat Yourself (DRY), and themselves.
* Plug-in 獨立於 Rails application 之外，有助於追蹤程式的 bug 以及模組化。
* 把 Plug-in 程式碼釋放出來，有機會可以獲得社群的回饋，修補或增進程式的功能。

## 安裝 Plug-in

通常 Plug-in 可以透過 `rails plugin install http://url.to/repository.git` 來安裝。Plug-in 會安裝在 `vendor/plugins` 裡面。可以透過 `rails plugin remove plugin_name` 來移除。

有的 Rails Plug-in 會包裝成 Gem ，這時候最好透過 Bundler 來管理：

``` ruby Gemfile
gem "some-extension", :git => "http://url.to/repository.git"
```

然後透過 `bundle install` 來安裝。

## 製作 Plug-in

### 產生基本架構

與其他提供 Plug-in framework 的應用程式一樣，Rails 的 Plug-in 也必須符合一定的規格。 Rails 提供了 Plug-in Generator ，用來產生 Plug-in 的基本架構，我們可以直接拿來改。當你執行 `rails generate plugin --helper` 就會看到說明：

``` text $ rails generate plugin --help
Usage:
  rails generate plugin NAME [options]

[chunked]

Description:
    Stubs out a new plugin at vendor/plugins. Pass the plugin name, either
    CamelCased or under_scored, as an argument.

[chunked]
```

這裡來製作一個簡單的 **Nyancat** Plug-in ，執行 `rails generate plugin nyancat`

``` text $ rails generate plugin nyancat
      create  vendor/plugins/nyancat
      create  vendor/plugins/nyancat/MIT-LICENSE
      create  vendor/plugins/nyancat/README
      create  vendor/plugins/nyancat/Rakefile
      create  vendor/plugins/nyancat/init.rb
      create  vendor/plugins/nyancat/install.rb
      create  vendor/plugins/nyancat/uninstall.rb
      create  vendor/plugins/nyancat/lib
      create  vendor/plugins/nyancat/lib/nyancat.rb
      invoke  test_unit
      inside    vendor/plugins/nyancat
      create      test
      create      test/nyancat_test.rb
      create      test/test_helper.rb
```

這會在 `vender/plugins` 產生一個名叫 `nyancat` 的目錄裡面除了放程式碼，還有 `README` 、 `MIT-LICENSE` 等說明性檔案。

### 擴充 View 的 Helper

### 擴充 Model

### 擴充 Controller

### 擴充 Ruby 的 core

### 發佈 Plug-in

Plug-in 是以 Ruby 程式語言寫成的，不經過編譯，不論怎麼釋出，都是以原始碼的形式呈現。

私有的 Plug-in ，基於著作權的考量，可以放在內部的 Git 伺服器，供內部人員取用。

如果希望將 Plug-in 給全世界的 Rails 開發人員使用，可以將它放到公開的版本控制系統，例如 [GitHub](http://github.com) 。當你透過 Generator 產生 Plug-in 時，附帶的 `MIT-LICENSE` 檔案，就是一個不錯的開放原始碼授權協議。

### 包裝成 Gem

許多 Ruby 的程式庫都會包裝成 Gem， Rails Plug-in 當然也可以。包裝成 Gem 有以下的好處：

* 方便管理版本，直接透過 Rails 的 `Gemfile` 來管理，升級不怕爆炸。
* 方便管理程式庫相依性，尤其如果你寫的 Plug-in 需要某個 gem 才能運作。
* 方便 Plug-in 版本升級時，讓其他人更新版本（而不必再進 `vendor/plugin` 手動更新）。

## 透過 `rails plugin new` 來建立基本架構 (Rails >= 3.1)

`rails plugin new` 是 Rails 3.1 提供的新指令，它除了產生 Plug-in 的基本架構之外，還會產生一個 Dummy Rails application ，要測試的時候，會直接使用這個 dummy app 。所以這個指令不是在 Rails application 的目錄裡面執行，而是在外面。

see `rails plugin new --help` for more details.

## 參考資料

- [Ruby on Rails Guides: The Basics of Creating Rails Plugins](http://guides.rubyonrails.org/plugins.html)
