---
layout: post
title: "what is partial"
date: 2011-10-18 00:12
comments: true
categories: 
---
## 說明

它是一個模板（Template），就像其他的模板一樣，但是不一樣的地方，它可以傳遞參數，稱為局部樣板（Partial）！

它可以被其他模板（Template）或者Action Controller呼叫，


## 使用情境 

有太多重覆的程式碼在你的 View 裡面時

## 使用方式

建立 partial 檔案時，必須以底線開頭 _ 

```ruby
# 路徑通常是 app/views/_form_post.html.rb
 <p><%= f.label :subject, "標題" %>
 <%= f.text_field :subject %></p>
 
 <%= f.label :content, "內容" %>
 <p><%= f.text_area :content %></p>
```

* 呼叫時不加底線

```ruby
<%= render :partial => form_post" %>
```
* 可以傳實例變數（@開頭的變數）

```ruby 
<%= render :partial => "hot_keywords", :locals => {:category => @category, :a => 1} %>
```

## 優點

* Don't repeat yourself（DRY）程式碼不重複
* 程式修改會比較清楚
* Partial 樣板比較容易被重複使用

## 參考資料

* http://api.rubyonrails.org/classes/ActionView/Partials.html
* http://ionrails.com/2009/08/08/rails-partial-templates/
* http://ihower.tw/rails3/actionview.html
