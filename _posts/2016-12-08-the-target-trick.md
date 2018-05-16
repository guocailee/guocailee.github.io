---
layout: post
title: "伪类:target的使用技巧"
description: "The :target Trick"
category: Front-End
tags: [css]
comments: true
share: true
---

>原文：[The :target Trick](https://bitsofco.de/the-target-trick/) 

:target伪类指的是URL指向的一个元素, 详细请看:[:target](https://developer.mozilla.org/en-US/docs/Web/CSS/:target)

最近，我发现可以利用***:target***来创建具有交互作用的元素，而不依赖Javascript。

## 示例1-隐藏&显示内容

:target伪类选择器的简单的使用场景就是用来隐藏和显示一个内容是否被指向了。举例说明一下：在一个博文中，我们也许不想显示评论区的内容，除非用户点击显示按钮。为了实现这样的效果，我们可以用:target来显示或隐藏评论区。

```html
<a href="#comments">Show Comments</a>

<section id="comments">  
    <h3>Comments</h3>
    <!-- Comments here... -->
    <a href="#❌">Hide Comments</a>
</section>  

```

```css
#comments:not(:target) {
    display: none;
}
#comments:target {
    display: block;
}

```
![](/images/post/targetselector/Target_hide_show.gif)

<p style="text-align: center;"><a href="http://demo.bitsofco.de/the-target-trick/hide-show.html">View Live Demo</a></p>

## 示例2-一个侧滑的导航抽屉
另一个用例是创建滑出导航抽屉。 我们可以固定相对于视口的导航抽屉，以确保当用户点击打开时不会有跳跃。

```css
#nav {
    position: fixed;
    top: 0;
    height: 100%;
    width: 80%;
    max-width: 400px;
}

#nav:not(:target) {
    right: -100%;
    transition: right 1.5s;
}

#nav:target {
    right: 0;
    transition: right 1s;
}
```

![](/images/post/targetselector/Target_Slideout_drawer.gif)

<p style="text-align: center;"><a href="http://demo.bitsofco.de/the-target-trick/slide-out.html">View Live Demo</a></p>

## 示例3-一个弹出窗
进一步，我们可以创建一个模态窗口，将填充整个页面。

```css
#modal-container {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.8);
    display: flex;
    justify-content: center;
    align-items: center;
}

.modal {
    width: 70%;
    background: #fff;
    padding: 20px;
    text-align: center;
}

#modal-container:not(:target) {
    opacity: 0;
    visibility: hidden;
    transition: opacity 1s, visibility 1s;
}

#modal-container:target {
    opacity: 1;
    visibility: visible;
    transition: opacity 1s, visibility 1s;
}

```
![](/images/post/targetselector/Target_modal.gif)

<p style="text-align: center;"><a href="http://demo.bitsofco.de/the-target-trick/modal.html">View Live Demo</a></p>

## 示例4-更改全局样式

最后一个用例，虽然语义不太合适，但可以应用：target到<body>元素本身，并完全重新整理页面或更改其布局。

```css
#body:not(:target) {
    main { width: 60%; }
    aside { width: 30%; }
    .show-sidebar-link { display: none; }
}

#body:target {
    main { width: 100%; }
    aside { display: none; }
    .hide-sidebar-link { display: none; }
}
```
![](/images/post/targetselector/Target_body.gif)

<p style="text-align: center;"><a href="http://demo.bitsofco.de/the-target-trick/body.html">View Live Demo</a></p>