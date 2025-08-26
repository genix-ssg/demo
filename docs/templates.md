# Templates

# Introduction

In Genix, a **Template** defines the overall structure of a web page. It determines **where** content is inserted and **how** different shortcodes are arranged to build the final HTML output. Templates give you full control over layout while keeping page content clean and focused.

Templates use the **same shortcode syntax** as widgets to define **insertion points**. Each shortcode in a template corresponds to a shortcode defined in the page. During rendering, Genix replaces these shortcodes with the fully rendered output of their matching content blocks.

Shortcode resolution within a template follows this priority order:

1. **Page-level shortcodes** — defined directly in the page file  
2. **Page variables** — defined on the `[HEAD]` tag in the page  
3. **Global variables** — shared values available across the site

This system allows you to modularize your layout while giving each page the flexibility to provide its own content or overrides.

# HEAD Tag

The `[HEAD]` tag in Genix is a **required shortcode** that appears at the top of every page and serves two primary purposes: it defines **page-level variables** (such as `title`, `description`, or `template`), and it instructs Genix which **template file** to use when rendering the page. Any attributes declared on the `[HEAD]` tag are automatically converted into **page variables** and can be referenced within the template using `[TITLE]`, `[DESCRIPTION]`, and so on. The `template` attribute is reserved and tells Genix which layout to apply, allowing you to switch between different designs like full-width, minimal, or form-based pages.

## Page Example

	[HEAD title="About Us" template="full" description="A webpage about us"]
	  <script>console.log("Hello World");</script>
	[/HEAD]

## Template Example

	<head>
	  <title>[TITLE]</title>
	  <meta name="description" content="[DESCRIPTION]">
	</head>

