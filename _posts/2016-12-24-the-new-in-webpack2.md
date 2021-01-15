---
layout: post
title: 'Webpack2 新特点'
description: 'Then new in webpack2'
category: Front-End
tags: [javascript]
comments: true
featured: true
share: true
---

> 原文[What's new in webpack 2](https://gist.github.com/sokra/27b24881210b56bbaff7), 本文主要说明 Webpack2 的新功能。

目前 Webpack2 还在开发中，这里只是说明至 2.0.5-beta+ 版本的变化

## 主要变更

### ES6 的模块化

Webpack2 原生支持 E6 的模块系统， 这意味着，可以直接在 webpack2 使用`import`跟`export`。不再需要使用转义器（如 Babel)转成 CommonJS 模块:

```javascript
import { currentPage, readPage } from './book'

currentPage === 0
readPage()
currentPage === 1
```

```javascript
// book.js
export var currentPage = 0

export function readPage() {
  currentPage++
}

export default 'This is a book'
```

### 使用 ES6 进行代码分割

在运行时(Runtime)，ES6 Loader 特别定义了一个方法 `System.import` 来动态加载 ES6 模块。Webpack2 根据 `System.import` 来判断分割点, 并以此把需要加载的模块独立成一个代码块。

`System.import` 接受模块名称作为参数，返回一个 `Promise` 对象。

```javascript
function onClick() {
  System.import('./module')
    .then((module) => {
      module.default
    })
    .catch((err) => {
      console.log('Chunk loading failed')
    })
}
```

同时，如果加载失败了，你也可以捕获到，并对其进行处理。

### 动态表达式

也可以把部分表达式传给 `System.import`， 这样跟 CommonJS 中的上下文有点类似。 (webpack 创建一个上下文给所有有需要的文件使用)。

`System.import` 主要是创建了隔离的代码块给各个模块使用。

```javascript
function route(path, query) {
  return System.import('./routes/' + path + '/route').then((route) => new route.Route(query))
}
// This creates a separate chunk for each possible route
```

### ES6 跟 AMD 和 CommonJS 的混搭

你可以方便的混合引用 AMD 跟 CommonJS，以及 ES6 的模块(甚至可以在一个文件内一起引用). 在 Webpack 中，这三个的引用方式其实都是相似的。如下所示：

```javascript
// CommonJS consuming ES6 Module
var book = require('./book')

book.currentPage
book.readPage()
book.default === 'This is a book'
```

```javascript
// ES6 Module consuming CommonJS
import fs from 'fs' // module.exports map to default
import { readFileSync } from 'fs' // named exports are read from returned object+

typeof fs.readFileSync === 'function'
typeof readFileSync === 'function'
```

#### babel 和 webpack

在 Babel 预设的 `es2015` 转义器配置中，默认会把 ES6 模块转成 CommonJS。 为让 Webpack 去处理 ES6 的模块，你应该用 `es2015-webpack` 配置。

#### ES6 特别优化

在静态原生的 ES6 模块系统允许一些新的优化配置可以被导出，哪些不能被导出被导出后并确切被使用到了，同时也确定哪些代码并没被使用到。

在这样的场景中， Webpack 可以确切发现没有被使用的代码, 然后标记并省略掉这些没有用的的代码, 使得这些文件可以最小化。

以下的使用方法，可以确定那些会被用到的代码。

- named import
- default import
- reexport

In the following cases it's not possible to detect usage:

- `import * as ...` when used indirectly
- CommonJS or AMD consuming ES6 module
- `System.import`

> 注：[如何评价 Webpack 2 新引入的 Tree-shaking 代码优化技术？](https://www.zhihu.com/question/41922432/answer/92896063)

### ES6 导出压缩（mangle）

在完全可以跟踪导出代码的使用情况下， Webpack 可以把模块名压缩到一个字节。

## 配置

在以前，经常用配置文件来配置环境变量，用于适应不同的环境。现在，Webpack2 带来了一个全新的配置方式。

配置文件可以导出一个方法，在这个方法中，需要返回一个配置。这个配置方法，可以在 CLI 中被调用。 我们可以通过 `--env` 选项给配置方法传参。

你甚至可以用字符串来省略这个配置（`--env dev` => `"dev"`）, 也可以传入更为复杂的参数对象，如： (`--env.minimize --env.server localhost` => `{minimize: true, server: "localhost"}`)。 我推荐用对象来传参，因为这样更具有扩展性。当然了，这一切都是由你来决定的。

> 示例

```js
// webpack.config.babel.js
exports default function(options) {
  return {
    // ...
    devtool: options.dev ? "cheap-module-eval-source-map" : "hidden-source-map"
  };
}
```
