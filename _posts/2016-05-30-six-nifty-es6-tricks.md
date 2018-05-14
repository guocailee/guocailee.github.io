---
layout: post
title: "六条有用的ES6技巧"
description: "六条有用的ES6技巧"
category: Front-End
tags: [javascript]
comments: true
share: true
---

>原文:[Six nifty ES6 tricks](http://www.2ality.com/2016/05/six-nifty-es6-tricks.html)

在这篇博文中，我会详述关天ES6的小技巧，在每个技巧后面，会链接到 《[Exploring ES6](http://exploringjs.com/es6/)》对应的章节。

#### 1. 强制调用函数必须传参数

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

#### 2. 使用for-of循环对数组进行迭代

方法 forEach() 允许你遍历一个数组的元素和索引：

```javascript

var arr = ["a", "b", "c"];
arr.forEach(function (elem, index) {
    console.log("index = "+index+", elem = "+elem);
});
// Output:
// index = 0, elem = a
// index = 1, elem = b
// index = 2, elem = c

```
ES6 的 for-of 循环支持 ES6 迭代（通过 iterables 和 iterators）和解构。如果你通过数组的新方法 enteries() 再结合解构，可以达到上面 forEach 同样的效果：

```javascript
const arr = ["a", "b", "c"];
for (const [index, elem] of arr.entries()) {
    console.log(`index = ${index}, elem = ${elem}`);
}
```
arr.enteries() 通过索引-元素配对返回一个可迭代对象。然后通过解构数组 [index, elem] 直接得到每一对元素和索引。 console.log() 的参数是 ES6 中的模板字面量特性，这个特性带给字符串解析模板变量的能力。

#### 3. 遍历 Unicode 表示的字符串

一些 Unicode 编码的字由两个 JavaScript 字符组成，例如，emoji 表情：

![Unicode](/images/post/mqiQfma.png)

字符串实现了 ES6 迭代，如果你通过迭代来访问字符串，你可以获得编码过的单个字（每个字用 1 或 2 个 JavaScript 字符表示）。例如：

```javascript
for (const ch of "x\uD83D\uDE80y") {
    console.log(ch.length);
}
// Output:
// 1
// 2
// 1

```
这让你能够很方便地得到一个字符串中实际的字数：

```bash
> [..."x\uD83D\uDE80y"].length
3
```
展开操作符 ( ... ) 将它的操作对象展开并插入数组。

#### 4. 通过变量解构交换两个变量的值

如果你将一对变量放入一个数组，然后将数组解构赋值相同的变量（顺序不同），你就可以不依赖中间变量交换两个变量的值：

```javascript
[a, b] = [b, a];
```
可以想象，JavaScript 引擎在未来将会针对这个模式进行特别优化，去掉构造数组的开销。

### 5. 通过模板字面量（template literals）进行简单的模板解析

ES6 的模板字面量与文字模板相比，更接近于字符串字面量。但是，如果你将它们通过函数返回，你可以使用他们来做简单的模板渲染：

```javascript
const tmpl = addrs => `
    <table>
    ${addrs.map(addr => `
        <tr><td>${addr.first}</td></tr>
        <tr><td>${addr.last}</td></tr>
    `).join("")}
    </table>
`;
```
tmpl 函数将数组 addrs 用 map （通过 箭头函数 ） join 拼成字符串。 tmpl() 可以批量插入数据到表格中：

```javascript
const data = [
    { first: "<Jane>", last: "Bond" },
    { first: "Lars", last: "<Croft>" },
];
console.log(tmpl(data));
// Output:
// <table>
//
//     <tr><td><Jane></td></tr>
//     <tr><td>Bond</td></tr>
//
//     <tr><td>Lars</td></tr>
//     <tr><td><Croft></td></tr>
//
// </table>
```

#### 6.通过子类工厂实现简单的合成器

当 ES6 类继承另一个类，被继承的类可以是通过任意表达式创建的动态类：

```javascript
// Function id() simply returns its parameter
const id = x => x;

class Foo extends id(Object) {}
```
这个特性可以允许你实现一种合成器模式，用一个函数来将一个类 C 映射到一个新的继承了 C 的类。例如，下面的两个函数 Storage 和 Validation 是合成器：

```javascript
const Storage = Sup => class extends Sup {
    save(database) { ··· }
};
const Validation = Sup => class extends Sup {
    validate(schema) { ··· }
};
```
你可以使用它们去组合生成一个如下的 Employee 类：

```javascript
class Person { ··· }
class Employee extends Storage(Validation(Person)) { ··· }
```

参考: [【译】六个漂亮的 ES6 技巧](http://www.zcfy.cc/article/346)
