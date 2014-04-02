---
layout: post
title: Java Stack的实现
description: "Java模拟实现Stack"
modified: 2011-01-22
tags: [java, stack]
image:
  feature: abstract-4.jpg
  background: wallpaper/wood2.jpg
comments: true
share: true
---

[Java stack](http://docs.oracle.com/javase/7/docs/api/java/util/Stack.html) 己在Java 的API中己实现，这个代码只是无聊中写的。有兴趣的就看看吧，有啥错误请直接指出。


###Stack 接口

{% highlight java %}
{% raw %}
package stack;

public interface Stack<T> {
	// 得到栈顶元素
	public T peek();

	// 弹出栈顶元素
	public T pop();

	// 向栈内压入元素
	public void push(T elment);

	// 是否为空
	public boolean isEmpty();

	// 是否己满
	public boolean isFull();

}
{% endraw %}
{% endhighlight %}

####Stack 接口的实现

{% highlight java %}
{% raw %}
package stack.impl;

import java.util.ArrayList;
import java.util.List;

import stack.Stack;

public class StackImpl<T> implements Stack {
	private List<T> node = new ArrayList<T>();
	private int maxSize;
	private int top;

	StackImpl(int maxSize) {
		this.maxSize = maxSize;
		this.top = -1;
	}

	@Override
	public Object peek() {
		if (this.isEmpty()) {
			throw new java.lang.NullPointerException("this stack is empty");
		}
		return this.node.get(top);
	}

	@Override
	public Object pop() {
		if (this.isEmpty()) {
			throw new java.lang.NullPointerException("this stack is empty");
		}

		Object topNode = this.node.get(top);
		this.node.remove(top);
		top--;
		return topNode;
	}

	@Override
	public boolean isEmpty() {
		if (top == -1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean isFull() {
		if (this.maxSize == this.node.size()) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void push(Object elment) {
		if (this.isFull()) {
			throw new java.lang.NullPointerException("this stack is full");
		}
		this.node.add((T) elment);
		top++;
	}
}
{% endraw %}
{% endhighlight %}
