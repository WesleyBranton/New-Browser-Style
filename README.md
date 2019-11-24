[<img align="right" src="https://img.shields.io/github/release/WesleyBranton/New-Browser-Style.svg">](https://github.com/WesleyBranton/New-Browser-Style/releases)

# Browser Style Override
The goal of this project is to provide an updated version of the default browser styles used by extensions in Firefox. The builtin stylesheet is dated and no longer reflects the current Firefox Photon appearance.

This stylesheet is designed to be a replacement for the built-in Firefox browser style. Using these styles requires similar HTML code to the default browser styles.

## Adding to your extension
Download the latest `new_browser_style.css` file from [the release section of Github](https://github.com/WesleyBranton/New-Browser-Style/releases) and save it in your extension directory. It's generally recommended to include it in the extension root inside of a `lib` folder.

## Adding to a page
Once the CSS file is added to your extension's directory, you simply need to add it to the page that want to use it on, using the following code to point to the file:

    <link rel="stylesheet" href="PATH/new_browser_style.css">
	
In some cases, you may need to disable the built-in Firefox browser style for your extension. Doing this may vary depending on how you have implemented your page. For example, doing this on an options UI page would require you to change your `manifest.json` code to:

    "options_ui": {
        "page": "options/options.html",
        "browser_style": false
    }

After the above has been completed, you just need to enable the new browser styles on your page. This is done by giving the wrapping element a class value of `browser-style`. Generally, this class is added to the `<body>`, but it can be added to another element of your page, if you only want the browser style to appear on elements within another container.

## Elements
See `example.html` for an example of how to use the various elements available in this project.

This stylesheet was designed to be a replacement for the builtin Firefox browser style CSS code that is used by browser extensions. Therefore, it closely mirrors Mozilla's implementation of various UI elements, as described in detail on [the MDN page on this topic](https://developer.mozilla.org/docs/Mozilla/Add-ons/WebExtensions/user_interface/Browser_styles).

## Contributing
### Making A Donation
This project is free to include in your extension project. I would love it if you could give me credit in your extension. Although it's not required, [a donation of any size](https://www.paypal.me/wbrantonaddons) would be greatly appreciated!

### Filing A Bug
If you happen to find an issue with the code, please [create an issue](https://github.com/WesleyBranton/New-Browser-Style/issues) so that I can take a look. It's helpful if you can include a link to a Github repository or sample code in your issue.

### Editing Code
If you feel like tackling an issue or just improving the code, please do! Pull requests are always welcome!