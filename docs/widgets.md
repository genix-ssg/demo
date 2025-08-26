# Widgets

# Introduction

**Widgets** are reusable HTML partials in Genix. They allow you to define components — like cards, buttons, or sections — once and reuse them across multiple pages using shortcodes. Widgets help separate **content from structure**, making your site easier to maintain and scale.

# Content

The shortcode name "CONTENT" is a reserved word, and is used to reference the content within an enclosing tag. It is possible to use the attribute name of "content" to provide text to be inserted into the widget in place of the shortcode \[CONTENT\].

# Variables

Genix shortcodes support a powerful **variable substitution mechanism**, allowing you to pass dynamic data into widgets through **attributes** and **inner content**.

When a shortcode is rendered, all attribute names are automatically converted to **uppercase variable placeholders** inside the widget file. These variables can be used to inject content directly into the HTML output of the widget.

## Example Shortcode:

	[BTN path="/about-us"]Click Here[/BTN]

## Example Widget:

File: *widgets/btn.tmpl*

	<a href="[PATH]" class="btn">[CONTENT]</a>

