# Pages

# Introduction

In Genix, a **Page** is the starting point for building a web document. It holds the **content specific to that individual page**, expressed through an array of **shortcodes**. Each shortcode can represent simple content (like text or an image) or a more complex structure powered by a widget.

Pages are intentionally content-focused. They don’t control layout or global design. Those responsibilities are handled by **Templates** and **Widgets**. Instead, Pages describe *what* should appear on a page, while Genix decides *how* to render it by parsing the shortcodes and passing them into the appropriate templates and widget files.

This separation allows you to write your content once, re-use widgets across multiple pages, and update layout and styling globally without touching the page files themselves.

# Self Enclosed Tags

A **self-enclosed shortcode** is a compact, one-line tag that does not contain inner content. It is used to represent a component or element that only requires attributes to render, without any nested text or child elements.

To indicate that the shortcode is self-contained, it must **end with `/]`** . This tells the Genix parser that there is no upcoming content to capture for this shortcode. Without this marker, the parser will expect a closing tag and try to record inner content.

These are ideal for widgets like images, horizontal rules, or icons. Anything that doesn’t need body content.

## Example

	[image src="cat.jpg" alt="A cute cat" /]

# Enclosing Tags

An **enclosing shortcode** is a tag that wraps around inner content. Unlike self-enclosed shortcodes, these are used when a widget needs to render **both attributes and child content**, including text, HTML, or even other shortcodes.

Enclosing shortcodes **must have both an opening tag and a matching closing tag** (e.g., `[card]...[/card]`). Everything between the opening and closing tags is captured as the **inner content** and passed to the corresponding widget as `[content]`.

## Example

	[card title="My Cat"]
	  <p>Meet Muffin, the fluffiest cat on the block.</p>
	[/card]

# Attributes

**Attributes** are name-value pairs passed into shortcodes to control how a widget renders. They act like **variables**, allowing you to customize content and layout directly from the page file. Each attribute name must be **unique** within a shortcode. Attribute values are always enclosed in **double quotes**, and special characters like `[` or `"` can be escaped using a backslash (`\`) to prevent parsing errors. For example: 

	title="A quote: \"Wow\" and a bracket: \["

Attributes are only parsed at the **shortcode level**, not inside inner content. This means that any `[` characters found within the body of an enclosing shortcode will be **ignored during attribute parsing**, allowing content like `[text]` or `[code]` to be written without breaking the parser.

