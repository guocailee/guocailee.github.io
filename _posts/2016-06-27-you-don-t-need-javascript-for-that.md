---
layout: post
title: "你没有必要用JS来做这些事"
description: "你没有必要用JS来做这些事"
category: Front-End
tags: [javascript]
comments: true
share: true
---

I often use a few CSS alternatives to common JavaScript interactions when I’m developing the front-end of a website (especially a prototype). There are some projects where downloading a plugin or creating a new file for a few lines of code seems like overkill. Here are some components I use created by using only CSS:

## Tooltips

Tooltips are great for showing helpful information that isn’t necessary to a user’s experience. There are a few JavaScript plugins that give us this behavior, but if you don’t feel like adding that weight to your site, we can take care of it with plain ol’ CSS.

We can use pseudo-elements to pull in text and display it on :hover. (You could use the HTML title attribute to effectively accomplish the same solution, but you can’t style the tooltip to your liking.)

HTML:

```html

<a href="#" class="tooltip-toggle" aria-label="Sample text for your tooltip!" tabindex="0">
  Label for your tooltip
</a>

```

SCSS:

```scss

.tooltip-toggle {
  cursor: pointer;
  position: relative;

  //Tooltip text container - above element
  //You can adjust the position to make the container appear below or beside the element
  &::before {
    background-color: #000;
    border-radius: 5px;
    color: #fff;
    content: attr(aria-label); //This pulls in the text from the element with the tooltip
    left: -80px; //This centers the container above the element
    padding: 1rem;
    position: absolute;
    text-transform: none;
    top: -80px; //This places the container above the element that needs a tooltip
    transition: all 0.5s ease;
    width: 160px;
  }

  //Tooltip arrow
  //You can adjust the position of this to align nicely with the element that
  //needs a tooltip. You can also use `transform` to rotate it to make the
  //tooltip work below or next to the element.
  &::after {
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-top: 5px solid #000;
    content: " ";
    font-size: 0;
    left: 9px; //This centers the arrow above the element with the tooltip
    line-height: 0;
    margin-left: -5px;
    position: absolute;
    top: -12px; //This positions the arrow at the bottom of the container
    width: 0;
  }

  //Setting up the transition
  &::before,
  &::after {
    opacity: 0;
    pointer-events: none;
  }

  //Triggering the transition
  &:focus::before,
  &:focus::after,
  &:hover::before,
  &:hover::after {
    opacity: 1;
    transition: all 0.75s ease;
  }
}

```

## Dropdown menu

If you need to implement a simple dropdown menu, you can use CSS to easily trigger the visibility of the menu on :hover.

HTML:

```html

<div class="nav-container">
  <ul class="nav-items">
    <!-- Navigation -->
    <li class="nav-item"><a href="#">Home</a></li>
    <li class="nav-item"><a href="#">About</a></li>
    <li class="nav-item"><a href="#">Contact</a></li>

    <!-- Dropdown menu -->
    <li class="nav-item nav-item-dropdown">
      <a class="dropdown-trigger" href="#">Settings</a>
      <ul class="dropdown-menu">
        <li class="dropdown-menu-item">
          <a href="#">Dropdown Item 1</a>
        </li>
        <li class="dropdown-menu-item">
          <a href="#">Dropdown Item 2</a>
        </li>
        <li class="dropdown-menu-item">
          <a href="#">Dropdown Item 3</a>
        </li>
      </ul>
    </li>
  </ul>
</div>

```

SCSS:

```scss

//Nav bar styling
.nav-container {
  background-color: #fff;
  display: block;
  margin: 0 auto;
  max-width: 400px;
  padding: 1em;
  text-align: center;
}

ul,
li {
  list-style: none;
  -webkit-padding-start: 0;
}

//Navigation menu
.nav-item {
  display: inline;
  padding: 1em;
}

//Dropdown menu
.nav-item-dropdown {
  position: relative;

  &:hover > .dropdown-menu {
    display: block;
    opacity: 1;
  }
}

.dropdown-trigger {
  position: relative;

  &:focus + .dropdown-menu {
    display: block;
    opacity: 1;
  }

  &::after {
    color: #ED3E44;
    content: "›";
    font-size: 24px;
    font-weight: bold;
    position: absolute;
    right: -15px;
    top: -5px;
    transform: rotate(90deg);
  }
}

.dropdown-menu {
  background-color: #fff;
  display: inline-block;
  display: none;
  opacity: 0;
  position: absolute;
  right: -10px;
  text-align: right;
  top: 2.5rem;
  transition: opacity 0.5s ease;
  width: 160px;
}

.dropdown-menu-item {
  cursor: pointer;
  padding: 1em;
  text-align: center;

  &:hover {
    background-color: #ccc;
  }
}

```

## Toggle Visibility

The most common reason I turn to JavaScript is to toggle the visibility of an element. I recently learned that you can use the :checked pseudo-class to change the CSS of an element. (Thanks, [Charlotte Jackson!](http://clearleft.com/thinks/260))

HTML:

```html

<div class="toggle">
  <!-- Checkbox toggle -->
  <input type="checkbox" value="selected" id="beethoven-joke" class="toggle-input">
  <label for="beethoven-joke" class="toggle-label">What was Beethoven's favorite fruit?</label> 

  <!-- Content to toggle -->
  <div role="toggle" class="toggle-content">
    BA-NA-NA-NA!
 </div>
</div>

```

SCSS:

```scss

.toggle {
  margin: 0 auto;
  max-width: 400px;
}

//Style toggle
.toggle-label {
  background: #fff;
  cursor: pointer;
  display: block;
  font-size: 16px;
  margin: 0 auto 1em;
  padding: 1em;

  &:after {
    content: "+";
    float: right;
  }
}

//Style content
.toggle-content {
  padding: 1em;
}

.toggle-input {
  display: none; //Hide input element

  &:not(checked) ~ .toggle-content {
    display: none; //Hide content
  }
}

//Display content when checkbox is "checked"
.toggle-input:checked {
  ~ .toggle-content {
    display: block;
  }

  ~ .toggle-label {
    &:after {
      content: "-"; //Change label's '+' to '-' when checked
    }
  }
}

```

## In the end…

To recap, here’s a few reasons why using CSS over JavaScript can be beneficial to your project:

* Lightweight, no need to install a plugin or add another .js file
* Clarity around what’s happening with styles and transitions
* Keep things simple and get things built quickly

And for good measure, here’s a few reasons to seek alternatives to these CSS-only methods:

* Accessibility concerns - a lot of these components need some JavaScript love to be more accessibility friendly. For more information about web accessibility, check out the WCAG Guidelines
* Support for touch devices - :hover can’t help you on a phone, so seek alternatives for accessing this content on a mobile device
* JavaScript可以帮助你实现更丰富的功能

每一个项目都有不同的需求,所以，你要确保你的解决办法可以完成你的项目目标。没有任何一个解决办法可以迎合所有的项目。但，令人兴奋的是，CSS可以完成一些特定的需求。

译自: [you don't need javascript for that](https://robots.thoughtbot.com/you-don-t-need-javascript-for-that)
