# Using this library
## Adding to your add-on
To use this library in your browser extension, you need to include the `new_browser_style.css` file in your extension source code. You can download this file from [the release section of this repository](https://github.com/WesleyBranton/New-Browser-Style/releases). For the best experience, it's recommended that you download the latest release.

> **WARNING:** This is the only official repository to download this library. Beware of other unofficial versions that may be published elsewhere on the internet.

The CSS file can be saved anywhere in your extension source code. However, it's recommended that you include the file in a folder called `lib` to keep your source code organized.

## Adding to a page
Unlike the browser styles already included in Firefox, you can use this library on any page in your browser extension. Although it was specifially designed to be used in Firefox extensions, this library should also work for Google Chrome extensions as well.

To use this library on an HTML page, you need to include a link to the file, as you would for any other stylesheet. This is done by adding the following HTML code in your page's `<head>` element:

```html
<link rel="stylesheet" href="{PATH_TO_FILE}/new_browser_style.css">
```

You will also need to make sure that the you disable Firefox's built-in browser style rules. The steps to do this may vary depending on how the Firefox page you are using. Generally, this will be done by setting the `browser_style` value to `false` within the `manifest.json` file. For example, doing this on an options UI page would look like this:

```json
"options_ui": {
    "page": "options/options.html",
    "browser_style": false
}
```

After the above is done, you need to add the `browser-style` class to the container element. If you want the styles to apply to all of the elements on the page, this would just involve adding the class to the HTML document body element:

```html
<body class="browser-style">
```

## Components
For a complete guide of every UI component in this library, please see the [Component Documentation](components.md).

## Terms of use
This library is released under Mozilla Public License 2.0. Usage of this library must be under the conditions of that license, which can be viewed in the LICENSE file of this repository. Please keep the comment header in the `new_browser_style.css` file.
