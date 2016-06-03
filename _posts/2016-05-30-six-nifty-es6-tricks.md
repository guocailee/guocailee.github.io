---
layout: post
title: "六条有用的ES6技巧"
description: "六条有用的ES6技巧"
category: FE
tags: [javascript]
comments: true
share: true
---

>原文:[Six nifty ES6 tricks](http://www.2ality.com/2016/05/six-nifty-es6-tricks.html)

在这篇博文中，我会详述关天ES6的小技巧，在每个技巧后面，会链接到 《[Exploring ES6](http://exploringjs.com/es6/)》对应的章节。

#### 1.强制调用函数必须传参数

ES6的方法参数在不被使用的情况下，是不强制传递的。下面的例子展示了如何强制要求传递：

```javascript

/**
* Called if a parameter is missing and
* the default value is evaluated.
*/
function mandatory() {
  throw new Error('Missing parameter');
}
function foo(mustBeProvided = mandatory()) {
  return mustBeProvided;
}

```

当调用 mandatory()时，没有传入 mustBeProvided参数，就会抛出异常

结果:

```bash
> foo()
Error: Missing parameter
> foo(123)
123
```
更多信息见： [Required parameters](http://exploringjs.com/es6/ch_parameter-handling.html#_required-parameters)

#### 2.使用for-of循环对数组进行迭代
