---
layout: post
title: "深入了解Functions: 通过引用传参是一个谎言"
description: "diving into functions: passing by reference is a lie"
category: Front-End
tags: [javascript, diving into functions]
toc: true
comments: true
share: true
featured: true
---

>[原文](https://wanago.io/2018/05/28/diving-into-functions-passing-by-reference-is-a-lie/)

>Functions 是JavaScript中最基本的特性之一， 如果您好奇它是如何工作的，请在本文中与我一起探讨！

## 函数的基础

实际上，一个函数是一个子程序，可以在代码的另一个地方调用。它有一个函数体，它是一系列语句。它可以将值作为参数传递给它。该函数也可以返回一个值。在JavaScript中，它们是从 ***Function.prototype*** 继承的对象。如果您想了解更多关于原型的信息，请查看我之前的一篇文章：[原型:ES6课程背后的大兄弟](https://wanago.io/2018/03/19/prototype-the-big-bro-behind-es6-class/)。看看这段代码：

```javascript
function fn() {};
Function.prototype.isPrototypeOf(fn); // true
```
***Function*** 的默认返回值是 *undefined*, 这个跟你使用 ***new*** 关键字时有点不同，因为默认值是创建的对象的实例（它指向函数中的那个）。

```javascript
function fn(){
  // not doing anything
}
 
console.log(fn()); // undefined
console.log(new fn()); // {}
```
### 给函数传参

传递给函数的参数总是按值传递。这意味着，如果函数改变了参数的值，它将不会反映在函数范围之外。它适用于基本基本类型（如字符串）和对象。
```javascript
function fn(str, obj) {
  str = '!dlroW olleH';
  obj = {
    str: '!dlroW olleH'
  };
}
 
const str = 'Hello World!';
const obj = {
  str: 'Hello World!'
};
 
fn(str, obj);
console.log(str); // 'Hello World!';
console.log(obj.str); // 'Hello World!';
```

您之前可能已经了解过，对象是通过JavaScript中的引用传递的。如果仔细观察上面的示例，可以看到在“传递引用”情况下， 我们不能从函数内部覆盖obj变量。这种常见的误解源于这样一个事实：当我们将一个对象分配给一个变量时，存储的实际事物就是对该对象的引用（到存储在内存中的某个位置）。变量本身不包含对象的实际值。传给函数的是一个引用的副本，实际上是通过值传递给它的 - 而不是对外部变量的引用。 由于这种行为，我们可以改变我们传递给函数的对象，但是我们不能覆盖变量：

```javascript
function fn(obj) {
  obj.str = '!dlroW olleH';
}
 
const obj = {
  str: 'Hello World!'
};
 
fn(obj);
console.log(obj.str); // '!dlroW olleH';
```

如果您仍然不确定我的观点是始终按值传递所有变量，请查看[this issue on You Don’t Know JS repo](https://github.com/getify/You-Dont-Know-JS/issues/160) 或者 [discussion on Stack Overflow](https://stackoverflow.com/questions/373419/whats-the-difference-between-passing-by-reference-vs-passing-by-value?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)

## 创建函数的方式

实际上有很多方法可以创建一个函数。它们通常属于几个小组之一：

### 函数声明
它使用函数关键字的函数声明的特殊语法，后跟函数的强制名称。它最大的优点是变量提升，这意味着它可以在声明之前被调用：

```javascript
console.log(square(2)); // 4
 
function square(number){
  return number * number;
}
```

因为函数是被声明的，因此函数对象保存其名称。在调试过程中查看调用堆栈时可能很有用。
```javascript
console.log(square.name); // 'square'
```

### 函数表达式

它看起来与函数声明相似，但可以是表达式的一部分。与函数声明相比，主要区别在于函数名称在这里可以省略。使用函数表达式创建的函数不会被提升到顶层，因此在声明之前不能调用它们：

```javascript
console.log(square(2)); // Uncaught ReferenceError: square is not defined
 
const square = function square(number) {
  return number*number;
}
```
#### 匿名表达式
由于我们可以省略函数名称，因此可以使它们成为“匿名”。但是，这种行为在ES6中已更改。现在，他们从他们的句法位置得到一个名字：

```javascript
const square = function (number) {
  return number * number;
}
const obj = {
  square: function(number) {
    return number * number;
  }
}

console.log(square.name); // "square"
console.log(obj.square.name); // "square"
```

在以前的JavaScript版本中，它将是一个空字符串。如果你看看babel编译器，它甚至会将匿名函数改为命名函数。 JavaScript解释器将会提供一个明确的名称：

```javascript
const squareVariable = function square(number) {
  return number * number;
}
 
console.log(squareVariable.name); // "square"
```
如果你仔细观察属性描述符，函数的名称不能被覆盖：
```javascript
Object.getOwnPropertyDescriptor(squareVariable, 'name');

{
  value: "square",
  writable: false,
  enumerable: false,
  configurable: true
}
{
  value: "square",
  writable: false,
  enumerable: false,
  configurable: true
}
```

由于它是可配置的，你可以使用 ***Object.defineProperty*** 函数来定义它：

```javascript
function square(number) {
  return number * number;
}
console.log(square.name); // 'square'
 
square.name = 'square2';
console.log(square.name); // 'square'
 
Object.defineProperty(square, 'name', {
  value: 'name2'
});
console.log(square.name); // 'square2'
```

### 函数构造函数

调用函数构造函数将创建一个从Function.prototype继承的新对象。你可以用这种方式动态地创建一个函数，但它比使用函数表达式或函数语句效率低。以这种方式创建的函数被命名为“匿名”：

```javascript
const square = new Function('number', 'return number * number');
square(2); // 4
console.log(square.name); // "anonymous"
```
在这个构造函数中，最后一个参数总是函数体，而前一个参数是参数。

关于使用函数构造函数创建函数的另一个重要的事情是，创建该函数的函数不会为其创建上下文创建闭包。它们始终在 ***Global*** 范围内创建，只能访问自己的局部变量和全局变量。

```javascript
const number = 2;
  function square() {
    return number * number;
  };
  square(); // 4
})();
JavaScript

(function(){
  const number = 2;
  const square = new Function('return number * number');
  square(); // Uncaught ReferenceError: number is not defined
})();

(function(){
  const number = 2;
  const square = new Function('return number * number');
  square(); // Uncaught ReferenceError: number is not defined
})();
```

### 箭头函数

与创建函数的方式相关的另一个重要概念是箭头函数。你可以在我之前的一篇文章中看到它们：[What is “this”? Arrow functions](https://wanago.io/2018/02/26/what-is-this-arrow-functions/)。

## 参数对象

如前所述，函数可以传递给它们的参数。在函数范围中，您有一个名为 ***arguments*** 的对象，其中包含所有这些对象。
```javascript 
function getArguments(number) {
  return arguments;
}
 
const args = getArguments(2);
 
console.log(args instanceof Array); // false
console.log(args[0]); // 2
```
正如你所见的， 这个并不是一个 Array 对象,  不过你可以通过以下方式转成 Array:

```javascript
const args = Array.from(getArguments(2));
const args = [...getArguments(2)];
```

这是可行的，因为参数是可迭代的：

```javascript
const arguments = getArguments();
console.log(typeof arguments[Symbol.iterator]); // function
```

您可以将任意数量的参数传递给函数，并在函数声明中使用其中的一些参数。参数对象将保留所有这些：

```javascript
function divide(a, b){
  console.log([...arguments]);
  return a / b;
}
 
divide(10, 5, 4, 3, 2, 1);// [10, 5, 4, 3, 2, 1]
```
在过去，我们使用了一个函数的属性，也称为参数，但现在不推荐使用：
```javascript
function factorial(n){
    console.log(factorial.arguments[0]);
    if(n === 1 || n === 0){
        return 1;
    }
    return factorial(n - 1) * n;
}
console.log(factorial(5)); // 3! = 6
// [3]
// [2]
// [1]
```

## 总结
这就是今天的全部！我希望你今天学到了很多东西，并对JavaScript中的功能有了深刻的理解。由于职能是一个如此广泛的话题，未来将会有更多的话题：例如闭合职责。
