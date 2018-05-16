---
layout: post
title: "固定背景的使用场景"
description: "Use Cases for Fixed Backgrounds in CSS"
category: Front-End
tags: [css]
comments: true
share: true
---
> 原文:[Use Cases for Fixed Backgrounds in CSS](https://css-tricks.com/use-cases-fixed-backgrounds-css/)

***background-attachment*** 这个属性，对于我，感觉是完全没有用过的，它一直出现在学校的旧有设计中——当页面滚动时，背景是重复的，并且保持不动。

如下面这个例子：

<p data-height="400" data-theme-id="0" data-slug-hash="QEPQqp" data-default-tab="result" data-user="geoffgraham" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/geoffgraham/pen/QEPQqp/">GeoCities!</a> by Geoff Graham (<a href="http://codepen.io/geoffgraham">@geoffgraham</a>) on <a href="http://codepen.io">CodePen</a>.</p>

但是***背景固定***的作用不仅仅时上面那个例子。设置属性***background-attachment:fixed; ***后，一个元素可以增加一些用户体验，比如：更光滑，内容转换。并且这样时不用引入新的依赖的，如Javascript,或CSS动画。

## 制作幻灯片

你是否需要作演讲? 如果只是一个简单的页面的话，那么只需要把它分成几片就好了。如下所示：

```css
.slide {
  background-image: url('path-to-url');
  background-attachment: fixed;
  height: 100vh;
  width: 100%;
}
```

然后我们只是需要在HTML页面重复这个***.slide***元素就行了， 层叠滚动的幻灯片就出来了。

<p data-height="400" data-theme-id="0" data-slug-hash="NAEXyg" data-default-tab="result" data-user="geoffgraham" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/geoffgraham/pen/NAEXyg/">Scrolling Backgrounds in CSS - 01</a> by Geoff Graham (<a href="http://codepen.io/geoffgraham">@geoffgraham</a>) on <a href="http://codepen.io">CodePen</a>.</p>

不需要第三方依赖， 不需要 scrolll jacking，纯CSS，全浏览器支持。有趣的是，跟[CSS Scroll Snap Points](https://css-tricks.com/introducing-css-scroll-snap-points/)是很像的。

## The "Slide Over The Header" Header

假设我们想要一些花哨的标题，内容重叠。我们也可以这样做。

<p data-height="400" data-theme-id="0" data-slug-hash="akrJjY" data-default-tab="result" data-user="geoffgraham" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/geoffgraham/pen/akrJjY/">akrJjY</a> by Geoff Graham (<a href="http://codepen.io/geoffgraham">@geoffgraham</a>) on <a href="http://codepen.io">CodePen</a>.</p>

## The Faux Transparency

还记得教室放映的幻灯片有层叠的效果么？ 我们也可以做同样的事情。

<p data-height="400" data-theme-id="0" data-slug-hash="pbQakX" data-default-tab="result" data-user="geoffgraham" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/geoffgraham/pen/pbQakX/">Scrolling Backgrounds in CSS - Seattle Trip</a> by Geoff Graham (<a href="http://codepen.io/geoffgraham">@geoffgraham</a>) on <a href="http://codepen.io">CodePen</a>.</p>

# Other Awesome Examples

在CodePen上有很多这样的例子，让我们看看下面这几个例子：

## Sliding Panels At The Beginning (But Also In The Middle) Of An Articled

<p data-height="400" data-theme-id="0" data-slug-hash="RRJWAA" data-default-tab="result" data-user="szentz" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/szentz/pen/RRJWAA/">RRJWAA</a> by Shane Zentz (<a href="http://codepen.io/szentz">@szentz</a>) on <a href="http://codepen.io">CodePen</a>.</p>


## Angled And Transparent Overlapping Sections

<p data-height="400" data-theme-id="0" data-slug-hash="XKpzqb" data-default-tab="result" data-user="carpenumidium" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/carpenumidium/pen/XKpzqb/">skewroll</a> by carpe numidium (<a href="http://codepen.io/carpenumidium">@carpenumidium</a>) on <a href="http://codepen.io">CodePen</a>.</p>

<p data-height="400" data-theme-id="0" data-slug-hash="mHFkd" data-default-tab="result" data-user="derekjp" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/derekjp/pen/mHFkd/">Scroll Flip-Book</a> by Derek Palladino (<a href="http://codepen.io/derekjp">@derekjp</a>) on <a href="http://codepen.io">CodePen</a>.</p>

## Mid Article Background Header Breaks

<p data-height="400" data-theme-id="0" data-slug-hash="vKOvgJ" data-default-tab="result" data-user="samstevenson" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/samstevenson/pen/vKOvgJ/">vKOvgJ</a> by Sam Stevenson (<a href="http://codepen.io/samstevenson">@samstevenson</a>) on <a href="http://codepen.io">CodePen</a>.</p>

## Clipped Headers Within Fixed Panels

下面这个其实并没有用到background attachment, 但是也是实现了相关的效果。建议看一下。

<p data-height="600" data-theme-id="0" data-slug-hash="WxoVBo" data-default-tab="result" data-user="StephenScaff" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/StephenScaff/pen/WxoVBo/">Gettin' Clippy</a> by Stephen Scaff (<a href="http://codepen.io/StephenScaff">@StephenScaff</a>) on <a href="http://codepen.io">CodePen</a>.</p>

<script async src="//assets.codepen.io/assets/embed/ei.js"></script>
