---
layout: post
title: "固定背景的使用场景"
description: "Use Cases for Fixed Backgrounds in CSS"
category: FE 
tags: [ci]
comments: true
share: true
---
原文:[Use Cases for Fixed Backgrounds in CSS](https://css-tricks.com/use-cases-fixed-backgrounds-css/)

***background-attachment*** 这个属性，对于我，感觉是完全没有用过的，它一直出现在学校的旧有设计中——当页面滚动时，背景是重复的，并且保持不动。

如下面这个例子：

<p data-height="400" data-theme-id="0" data-slug-hash="QEPQqp" data-default-tab="result" data-user="geoffgraham" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/geoffgraham/pen/QEPQqp/">GeoCities!</a> by Geoff Graham (<a href="http://codepen.io/geoffgraham">@geoffgraham</a>) on <a href="http://codepen.io">CodePen</a>.</p>

但是***背景固定***的作用不仅仅时上面那个例子。设置属性***background-attachment:fixed; ***后，一个元素可以增加一些用户体验，比如：更光滑，内容转换。并且这样时不用引入新的依赖的，如Javascript,或CSS动画。

## 制作幻灯片

Making a presentation? A single page broken up into "slides" is pretty straightforward:

```css
.slide {
  background-image: url('path-to-url');
  background-attachment: fixed;
  height: 100vh;
  width: 100%;
}
```

When we call the .slide element three times in our HTML, then we have slides that appear to overlap one another as the page scrolls down.

<p data-height="400" data-theme-id="0" data-slug-hash="NAEXyg" data-default-tab="result" data-user="geoffgraham" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/geoffgraham/pen/NAEXyg/">Scrolling Backgrounds in CSS - 01</a> by Geoff Graham (<a href="http://codepen.io/geoffgraham">@geoffgraham</a>) on <a href="http://codepen.io">CodePen</a>.</p>

No libraries. No scroll-jacking. Pure CSS with full browser support. Might be a fun thing to pair with [CSS Scroll Snap Points](https://css-tricks.com/introducing-css-scroll-snap-points/).

## The "Slide Over The Header" Header

Let's say we wanted some fancy header that gets overlapped by content. We can do that as well.

<p data-height="400" data-theme-id="0" data-slug-hash="akrJjY" data-default-tab="result" data-user="geoffgraham" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/geoffgraham/pen/akrJjY/">akrJjY</a> by Geoff Graham (<a href="http://codepen.io/geoffgraham">@geoffgraham</a>) on <a href="http://codepen.io">CodePen</a>.</p>

## The Faux Transparency

Remember when classrooms had overhead projectors and teachers would have to create what they called transparencies to present layered information? We can do the same!

<p data-height="400" data-theme-id="0" data-slug-hash="pbQakX" data-default-tab="result" data-user="geoffgraham" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/geoffgraham/pen/pbQakX/">Scrolling Backgrounds in CSS - Seattle Trip</a> by Geoff Graham (<a href="http://codepen.io/geoffgraham">@geoffgraham</a>) on <a href="http://codepen.io">CodePen</a>.</p>

# Other Awesome Examples

There are so many other great examples of this in action over on CodePen. Here's are a few to feast on.

## Sliding Panels At The Beginning (But Also In The Middle) Of An Articled

<p data-height="400" data-theme-id="0" data-slug-hash="RRJWAA" data-default-tab="result" data-user="szentz" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/szentz/pen/RRJWAA/">RRJWAA</a> by Shane Zentz (<a href="http://codepen.io/szentz">@szentz</a>) on <a href="http://codepen.io">CodePen</a>.</p>


## Angled And Transparent Overlapping Sections

<p data-height="400" data-theme-id="0" data-slug-hash="XKpzqb" data-default-tab="result" data-user="carpenumidium" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/carpenumidium/pen/XKpzqb/">skewroll</a> by carpe numidium (<a href="http://codepen.io/carpenumidium">@carpenumidium</a>) on <a href="http://codepen.io">CodePen</a>.</p>

<p data-height="400" data-theme-id="0" data-slug-hash="mHFkd" data-default-tab="result" data-user="derekjp" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/derekjp/pen/mHFkd/">Scroll Flip-Book</a> by Derek Palladino (<a href="http://codepen.io/derekjp">@derekjp</a>) on <a href="http://codepen.io">CodePen</a>.</p>

## Mid Article Background Header Breaks

<p data-height="400" data-theme-id="0" data-slug-hash="vKOvgJ" data-default-tab="result" data-user="samstevenson" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/samstevenson/pen/vKOvgJ/">vKOvgJ</a> by Sam Stevenson (<a href="http://codepen.io/samstevenson">@samstevenson</a>) on <a href="http://codepen.io">CodePen</a>.</p>

## Clipped Headers Within Fixed Panels

This one doesn't actually use background-attachment, but it's very cool and a related effect.

<p data-height="600" data-theme-id="0" data-slug-hash="WxoVBo" data-default-tab="css,result" data-user="StephenScaff" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/StephenScaff/pen/WxoVBo/">Gettin' Clippy</a> by Stephen Scaff (<a href="http://codepen.io/StephenScaff">@StephenScaff</a>) on <a href="http://codepen.io">CodePen</a>.</p>

<script async src="//assets.codepen.io/assets/embed/ei.js"></script>
