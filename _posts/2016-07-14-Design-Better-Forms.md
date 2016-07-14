---
layout: post
title: "设计更好的表单"
description: "设计更好的表单"
category: UI
tags: [Form Deisign]
comments: true
share: true
---

>原文:[Design Better Forms](https://uxdesign.cc/design-better-forms-96fadca0f49c#.uuo2uz30e)

此文展示一些通常的表设计错误并给出一些解决办法。

![](/images/post/better-forms/1.jpeg)

无论它是一个注册流程，或者是一个多步骤页面，异或仅仅是一个数据录入页面， 表单是一个最常使用到的重要组件，本文章专注举例说明一些有用的表单设计，并同时举出错误的例子。 请牢记这些通用的表单设计规则，相信以后对你有用的。

### 表单元素应该只使用一列

![](/images/post/better-forms/2.jpeg)

> 多列表单，会打断用户的输入趋势。（原文为：垂直趋势）

---

### 顶端对齐标签

![](/images/post/better-forms/3.jpeg)

> 用户在顶部对齐的标签下，比左端对齐的情况下，更容易输完表单信息。同时，顶部标签更适合移动设备的浏览。 不过，当表单存在大量数据需要用户进行输入的时候，应该考虑左侧标签对齐，因为左侧标签对齐可在在用户的视线下扫描到更多的输入域，并且有效减少表单的高度，同时如果有提示时，左侧方式更容易放下提示信息。

---

### 把标签跟它对应的输入域放一起

![](/images/post/better-forms/4.jpeg)

> 将标签与输入框放得足够近，并确保每对都有足够的距离

---

### 避免全大写字母

![](/images/post/better-forms/5.jpeg)

> 全大写字母不利于用户查看

---

### 如果选择个数少于6,那么应该全部显示出来

![](/images/post/better-forms/6.jpeg)

> 下拉选择框，至少需要用户进行两次的点击，并且无法默认显示选择项。如果选择项超过

---

### Resist using placeholder text as labels

![](/images/post/better-forms/7.jpeg)

> It is tempting to optimize space by using placeholder text as labels. This causes many usability issues that have been summarized by Katie Sherwin of Nielsen Norman Group.

---

### Place checkboxes (and radios) underneath each other for scannability

![](/images/post/better-forms/8.jpeg)

> Placing checkboxes underneath each other allows easy scanning.


---

### Make CTAs descriptive

![](/images/post/better-forms/9.jpeg)

> A call to action should state the intent.

---

### Specify errors inline

![](/images/post/better-forms/10.jpeg)

> Show the user where the error occurred and provide a reason.

---

### Use inline validation after the user fills out the field (unless it helps them while in the process)

![](/images/post/better-forms/11.jpeg)

> Don’t use inline validation while the user is typing —unless it helps them— like in the case of creating a password, username, or message with a character count.

---

### Don’t hide basic helper text

![](/images/post/better-forms/12.jpeg)

> IExpose basic helper text wherever possible. For complex helper text, consider placing it next to the input during its focused state.

---

### Differentiate primary from secondary actions

![](/images/post/better-forms/13.jpeg)

> There is a bigger philosophical debate regarding whether a secondary option should even be included.

---

### Use field length as an affordance

![](/images/post/better-forms/14.jpeg)

> The length of the field affords the length the answer. Employ this for fields that have a defined character count like phone numbers, zip codes, etc.

---

### Ditch the * and denote optional fields

![](/images/post/better-forms/15.jpeg)

> Users don’t always know what is implied by the required field marker (*). Instead, it is better to denote optional fields.

---

### Group related information

![](/images/post/better-forms/16.jpeg)

> Users think in batches, and long forms can feel overwhelming. By creating logical groups the user will make sense of the form much faster.

### Why ask?

Omit optional fields and think of other ways to collect data. Always ask yourself if the question can be inferred, postponed, or completely excluded.
Data entry is increasingly automated. For example, mobile and wearable devices collect large amounts of data without the user’s conscious awareness. Think of ways you can leverage social, conversational UI, SMS, email, voice, OCR, location, fingerprint, biometric, etc.

### Make it fun

Life is short. No one wants to fill out a form. Be conversational. Be funny. Gradually engage. Do the unexpected. It is the role of the designer to express their company’s brand to elicit an emotional reaction. If done correctly, it will increase completion rates. Just make sure you don’t violate the rules listed above.
