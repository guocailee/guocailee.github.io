---
layout: post
title: 计算某数的阶乘以及末尾含零的数量
description: "计算某数的阶乘以及末尾含零的数量"
modified: 2011-07-20
tags: [算法,阶乘]
image:
  feature: abstract-10.jpg
  credit: dargadgetz
  creditlink: http://www.dargadgetz.com/ios-7-abstract-wallpaper-pack-for-iphone-5-and-ipod-touch-retina/
comments: true
share: true  
---

###计算某数的阶乘末尾有多少个零
这个算法主要参考[Factorials and Trailing Zeroes](http://www.purplemath.com/modules/factzero.htm)这个文章进行编写的。

假设我们需要计算10！的末尾有多少个零，如果直接算那就跟下面一样：
1×2×3×4×5×6×7×8×9×10

但因为我们只需要计算末尾有多少个零就可以，我们可以查找2x5，10(同样可以转成2x5).可以产生零的乘数就可以。但是从5x2之后，都是5与2的倍数相乘。即，我们只需要查找10之内所有5并有与之相对的偶数相乘成10就可以。

上面的式子可以转换成如下：

* (5x5×5)x(2x2x2)x2×3××6×7×8×9×1

得到有3个5与偶数相乘，最终10！结果有3个零。

我们再计算一下100！的结果：

100内有多少个五呢?

即：5、10、15、20、25、30...100。

* 100/5=20

* 20/5=4

即包含了24个5，答案就出来了，100!末尾有24个0.

{% highlight java %}
{% raw %}
	public static int ZerosTails(int number) {
		int five = 5;
		int count = 0;
		while (number / five > 0) {
			count += number / five;
			five = five * 5;
		}
		System.out.println(count);
		return count;
	}
	
{% endraw %}
{% endhighlight %}

###计算某数的阶乘结果

{% highlight java %}
{% raw %}
	public static String factorial(int value) {
		ArrayList result = new ArrayList();
		int carryBit = 0;
		result.add(new Integer(1));
		for (int out = 2; out <= value; out++) {
			for (int in = 0; in < result.size(); in++) {
				int temp = ((Integer) result.get(in)).intValue() * out
						+ carryBit;
				result.set(in, new Integer(temp % 10));
				carryBit = temp / 10;
			}
			while (carryBit != 0) {
				result.add(new Integer(carryBit % 10));
				carryBit = carryBit / 10;
			}
		}
		StringBuffer sb = new StringBuffer(result.size());
		for (int i = 0; i < result.size(); i++) {
			sb.append(result.get(i));
		}
		sb = sb.reverse();
		// System.out.println("result=" + sb);
		// System.out.println("结果位数" + result.size());
		return sb.toString();
	}

{% endraw %}
{% endhighlight %}
