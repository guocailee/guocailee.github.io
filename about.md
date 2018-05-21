---
layout: page
permalink: /about/index.html
title:  阿宅
tags: [author,阿宅]
imagefeature: fourseasons.jpg
chart: true
---


{% for post in site.posts %}
    {% assign post_words = post.content | strip_html | number_of_words %}
    {% assign readtime = post_words | append: '.0' | divided_by:200 %}
    {% assign total_words = total_words | plus: post_words %}
    {% assign total_readtime = total_readtime | plus: readtime %}
    {% if post.featured %}
    {% assign featuredcount = featuredcount | plus: 1 %}
    {% endif %}
{% endfor %}

Hi， 我是阿宅， 这里是我的个人博客， 欢迎你的到来。

到目前为止，以下为本站的简单统计：


* 博文数： <a href="/">{{ site.posts | size }}</a> 篇 
* 分类数： <a href="/categories">{{ site.categories | size }}</a> 个
{% if featuredcount != 0 %}* 推荐博文数： <a href="/featured">{{ featuredcount }} </a>{% endif %}篇
* 总字数： {{ total_words }} 个


