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


Hi,我是阿宅,这里是我的个人博客,欢迎你的到来.当前总共有{{ site.posts | size }} 篇博文,计{{ site.categories | size }} 个分类,全站共有{{ total_words }} 个字. 每个读者以({{ site.wpm }} 字/分钟) 的速度来阅读,总计已经被阅读了<span class="time">{{ total_readtime }}</span> 分钟. {% if featuredcount != 0 %}这里 <a href="/featured">共有{{ featuredcount }} 篇我推荐的博文</a>, 希望你能阅读一下.{% endif %} 当前最新的博文是{% for post in site.posts limit:1 %}{% if post.description %}<a href="{{ post.url }}" title="{{ post.description }}">"{{ post.title }}"</a>{% else %}<a href="{{ post.url }}" title="{{ post.description }}" title="Read more about {{ post.title }}">"{{ post.title }}"</a>{% endif %}{% endfor %},此文发表于 {% for post in site.posts limit:1 %}{% assign modifiedtime = post.modified | date: "%Y%m%d" %}{% assign posttime = post.date | date: "%Y%m%d" %}<time datetime="{{ post.date | date_to_xmlschema }}" class="post-time">{{ post.date | date: "%d %b %Y" }}</time>{% if post.modified %}{% if modifiedtime != posttime %} 最后更新于<time datetime="{{ post.modified | date: "%Y-%m-%d" }}" itemprop="dateModified">{{ post.modified | date: "%d %b %Y" }}</time>{% endif %}{% endif %}{% endfor %}. 最后更新于 {{ site.time | date: "%A, %d %b %Y" }} at {{ site.time | date: "%I:%M %p" }} [UTC](http://en.wikipedia.org/wiki/Coordinated_Universal_Time "Temps Universel Coordonné").

