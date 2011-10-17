---
layout: post
title: "什麼是 helper"
date: 2011-10-17 16:06
comments: true
categories: 
---

## 說明

從名稱來看，就是可以幫助你的人！但是要幫助什麼呢？

* Simple HTML builders
* form builders
* error handling
* Ajax links
* Prototype wrappers
.....

總之，一個「好」的 Rails app 一定需要很多 helpers！

## 使用情境

* 當你的 view 出現 logic
* 當你有重覆的程式碼出現的時候
  - HTML
  - Javascript
  - Options to helper

## 使用方式

當你建造 controller 檔，Rails 會幫你建立一個 helper 檔 （當然也可以自己新增）
在 helper 檔，可以撰寫各種 Ruby 函式；這些函式可以在 view 裡面使用！

## 優點
* Don't repeat yourself（DRY）程式碼不重複
* Good Encapsulation，好的封裝性
* 提供view模板良好的組織
* 修改程式碼方便

## 參考資料

* <http://redmine.techbang.com.tw/attachments/3776/CustomRailsHelpers.pdf>
Ruby for Rails－Rails 開發者必備的 Ruby 學習手冊 (Ruby for Rails: Ruby Techniques for Rails Developers)