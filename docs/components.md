# Component Documentation
This page includes the documentation for all of the UI components in this library. It will include the HTML code required to make the component and some components also include examples of how to use the elements.

Some code snippets may contain placeholders. These are surrounded with % characters. For example, `%TEXT%` is a placeholder for some text.

> **Table of Contents**
> - [Theme](#theme)
> - [Page Layout](#page-layout)
> - [Sections](#sections)
>   - [Regular section](#regular-section)
>   - [Section with description](#section-with-description)
>   - [Collapsible Section](#collapsible-section)
>   - [Section note](#section-note)
>   - [Header](#header)
>   - [Footer](#footer)
> - [Dividers](#dividers)
> - [Tabs](#tabs)
> - [List menu](#list-menu)
> - [Message bars](#message-bars)
> - [Buttons](#buttons)
> - [Links](#links)
> - [Checkboxes](#checkboxes)
> - [Radio Buttons](#radio-buttons)
> - [Switches](#switches)
> - [Dialogs](#dialogs)
> - [Progress Bar](#progress-bar)
> - [Progress Wheel](#progress-wheel)

## Theme
This library supports both light and dark mode. The theme class **MUST** be set on the HTML element of the document. If no theme is set, the theme will automatically be applied based on whether the user's browser has requested the light mode or dark mode version using the `prefers-color-scheme` media query.

#### Themes
<table>
    <tr>
        <th>Theme</th>
        <th>Class</th>
        <th>Version</th>
    </tr>
    <tr>
        <td>Automatic</td>
        <td>None</td>
        <td>2.0+</td>
    </tr>
    <tr>
        <td>Light</td>
        <td><code>browser-style-light</code></td>
        <td>2.0+</td>
    </tr>
    <tr>
        <td>Dark</td>
        <td><code>browser-style-dark</code></td>
        <td>2.0+</td>
    </tr>
</table>

#### Code
```html
    <html class="%THEME%">
        <!-- Content -->
    </html>
```

#### Example
```html
    <html class="browser-style-dark">
        <!-- Content -->
    </html>
```

## Page Layout
When working with browser extensions, you have the option to open content in the browser's UI or a new tab. For example, for an options page, you can display the options on the `about:addons` page in Firefox or open the options in a new tab.

Setting the page layout to Page mode adds a body background and puts the page content in a centered container, similar to the styling provided for Firefox browser pages. If you are using the Page layout, the class **MUST** be placed in the document's body element and the body element **MUST** have a container element that uses the <code>browser-style-container</code> class.

If no page layout is specified, the layout defaults to Inline mode, which works best when it's displayed in a browserAction popup or internal options page.

#### Layouts
<table>
    <tr>
        <th>Layout</th>
        <th>Class</th>
        <th>Version</th>
    </tr>
    <tr>
        <td>Inline</td>
        <td>None</td>
        <td>1.0+</td>
    </tr>
    <tr>
        <td>Page</td>
        <td><code>browser-style-page</code></td>
        <td>2.0+</td>
    </tr>
</table>

#### Code
```html
<body class="browser-style %LAYOUT%">
    <div class="browser-style-container">
        <!-- Content -->
    </div>
</body>
```

#### Example
```html
<body class="browser-style browser-style-page">
    <div class="browser-style-container">
        <!-- Content -->
    </div>
</body>
```

## Sections
Sections are container elements for parts of the UI. This will ensure that the content is spaced correctly on the screen. You do not need to use sections, but it is strongly recommended.

Every section is a horizontal flex box. The first child of the section will be stretched to take up as much space as possible. All subsquent children will take up as little space as possible.

### Regular section
A regular section is a normal section.

#### Code
```html
<div class="panel-section">
    <!-- Content -->
</div>
```

### Section with description
A section with a description consists of two sections: one is the main content and the other is the descriptive text. This section is ideal for providing further information about settings in on options UI screen.

#### Code
```html
<div class="panel-section has-help">
    <!-- Content -->
</div>
<div class="panel-section help-row">
    <!-- Description --> 
</div>
```

## Collapsible Section
A collapsible section can be hidden by the user and is a great place for storing advanced options on a settings page. You can create your own button to toggle the collapsible panel instead of using the provided `panel-collapsible-header` element.

> **IMPORTANT:**
> When toggling a collapsible section, make sure to set the `data-state` attribute on both the `panel-collapsible` and `panel-collapsible-header` elements.

> **TIP:**
> Including a `data-target` attribute on your collapsible panel header that matches the `id` attribute of your collapsible panel will make it easy to toggle the panel using Javascript.

#### Animation
The collapsible panel can be animated by setting the `max-height` of the panel when the user toggles the panel to open. When animating a panel, it is recommended that you remove the `max-height` from the panel after the animation is completed. Failing to do so could cause issues if the content in the panel resizes or reflows.

Additionally, it's recommended that you set the `display` property of the panel to `none` after the opening animation is completed. Failing to do so will cause issues with keyboard navigation selecting items that are within the closed panel.

Animations are automatically disabled if the user has disabled animations on their system, as recommended by the WCAG standards.

#### Types
<table>
    <tr>
        <th>Type</th>
        <th>Class</th>
        <th>Version</th>
    </tr>
    <tr>
        <td>Default</td>
        <td>None</td>
        <td>2.1+</td>
    </tr>
    <tr>
        <td>Animated</td>
        <td><code>animated</code></td>
        <td>2.1+</td>
    </tr>
</table>

#### States
<table>
    <tr>
        <th>State</th>
        <th>Value</th>
        <th>Version</th>
    </tr>
    <tr>
        <td>Collapsed</td>
        <td><code>close</code></td>
        <td>2.1+</td>
    </tr>
    <tr>
        <td>Open</td>
        <td><code>open</code></td>
        <td>2.1+</td>
    </tr>
</table>

#### Icons
<table>
    <tr>
        <th>Icon</th>
        <th>Class</th>
        <th>Version</th>
    </tr>
    <tr>
        <td>No icon</td>
        <td>None</td>
        <td>2.1+</td>
    </tr>
    <tr>
        <td>Icon on left</td>
        <td><code>icon-left</code></td>
        <td>2.1+</td>
    </tr>
    <tr>
        <td>Icon on right</td>
        <td><code>icon-right</code></td>
        <td>2.1+</td>
    </tr>
</table>

#### Code
```html
<button class="panel-section panel-collapsible-header %ICON%" data-state="%STATE%">
    <!-- Title -->
</button>
<div class="panel-collapsible" data-state="%STATE%">
    <!-- Content -->
</div>
```

#### Example
```html
<button class="panel-section panel-collapsible-header icon-right" data-state="close" data-target="collapsible1">
    <span>Advanced Setting</span>
</button>
<div id="collapsible1" class="panel-collapsible" data-state="close">
    <div class="panel-section">
        <label>Erase your current settings</label>
        <button class="secondary">Restore To Default</button>
    </div>
</div>
```

### Section note
A section note is a special section that displays italic text in a bordered box.

#### Code
```html
<div class="panel-section note">
    <!-- Content -->
</div>
```

### Header
The header is a special section that can contain two components: an image and text. It's recommended that you use an image that's 32px by 32px in size. The image element does not need to be included in the header if you do not wish to display an image in your header.

#### Code
```html
<header class="panel-section panel-section-header">
    <img class="icon-section-header" src="%IMAGE_URL%">
    <h1 class="text-section-header">%TITLE%</h1>
</header>
```

### Footer
The footer is a special section designed to be displayed at the bottom of your content. Unlike a regular section, all children elements grow/shrink to take up an even amount of space in the footer. This is ideal for displaying a save and cancel button at the bottom of an options UI.

#### Code
```html
<footer class="panel-section panel-section-footer">
    <!-- Content -->
</footer>
```

#### Example
```html
<footer class="panel-section panel-section-footer">
    <button class="default">Save</button>
    <button class="secondary">Cancel</button>
</footer>
```

## Dividers
A divider is used to separate sections. You can use different types of dividers by specifying an additional class to indicate the type.

#### Types
<table>
    <tr>
        <th>Type</th>
        <th>Class</th>
        <th>Version</th>
    </tr>
    <tr>
        <td>Solid</td>
        <td>None</td>
        <td>1.0+</td>
    </tr>
    <tr>
        <td>Dashed</td>
        <td><code>dashed</code></td>
        <td>1.1+</td>
    </tr>
    <tr>
        <td>Rounded</td>
        <td><code>rounded</code></td>
        <td>1.1+</td>
    </tr>
    <tr>
        <td>Dotted</td>
        <td><code>dotted</code></td>
        <td>1.1+</td>
    </tr>
</table>

#### Code
```html
<div class="panel-section-separator %TYPE%"></div>
```

## Tabs
A tab bar consists of a single container element with button children. Tabs will appear selected by adding the appropriate class to the tab button. A tab bar can contain regular dividers between each tab, but these are not required.

#### Types
<table>
    <tr>
        <th>Type</th>
        <th>Class</th>
    </tr>
    <tr>
        <td>Default</td>
        <td>None</td>
    </tr>
    <tr>
        <td>Selected</td>
        <td><code>selected</code></td>
    </tr>
</table>

#### Code
```html
<section class="panel-section-tabs">
    <button type="button" class="panel-section-tabs-button selected">%TITLE%</button>
    <div class="panel-section-tabs-separator"></div>
    <button type="button" class="panel-section-tabs-button">%TITLE%</button>
    <div class="panel-section-tabs-separator"></div>
    <button type="button" class="panel-section-tabs-button">%TITLE%</button>
    ...
</section>
```

#### Example
```html
<section class="panel-section-tabs">
    <button type="button" class="panel-section-tabs-button">Home</button>
    <div class="panel-section-tabs-separator"></div>
    <button type="button" class="panel-section-tabs-button">About</button>
    <div class="panel-section-tabs-separator"></div>
    <button type="button" class="panel-section-tabs-button selected">Options</button>
    <div class="panel-section-tabs-separator"></div>
    <button type="button" class="panel-section-tabs-button">Credits</button>
</section>
```

## List menu
A list menu is a container with items in it. Each item has three components within: an icon, text and text shortcut. The icon is displayed on the left side of the element and should contain an HTML `<img>` element. The text is the main text of the item. The text shortcut is text that's displayed on the right side of the item. Only the text element is required in a list item. The other components can be excluded.

#### Types
<table>
    <tr>
        <th>Type</th>
        <th>Class</th>
    </tr>
    <tr>
        <td>Default</td>
        <td>None</td>
    </tr>
    <tr>
        <td>Disabled</td>
        <td><code>disabled</code></td>
    </tr>
</table>

#### Code
```html
<div class="panel-section panel-section-list">
    <div class="panel-list-item">
        <div class="icon">%IMAGE%</div>
        <div class="text">%TEXT%</div>
        <div class="text-shortcut">%TEXT%</div>
    </div>
    <div class="panel-list-item">
        <div class="icon">%IMAGE%</div>
        <div class="text">%TEXT%</div>
        <div class="text-shortcut">%TEXT%</div>
    </div>
    ...
</div>
```

#### Examples
```html
<div class="panel-section panel-section-list">
    <div class="panel-list-item">
        <div class="text">Cut</div>
        <div class="text-shortcut">Ctrl+X</div>
    </div>
    <div class="panel-list-item">
        <div class="text">Copy</div>
        <div class="text-shortcut">Ctrl+C</div>
    </div>
    <div class="panel-list-item">
        <div class="text">Paste</div>
        <div class="text-shortcut">Ctrl+V</div>
    </div>
    <div class="panel-list-item disabled">
        <div class="text">Undo</div>
        <div class="text-shortcut">Ctrl+Z</div>
    </div>
</div>
```

## Message bars
Message bars can contain text messages. The bar includes an icon on the left side of the text. There are some message bar types included with this library.

You can create your own custom message bar type by excluded the type from the class. You can then set the CSS `background-color` of the message bar to change the color and the `background-image` CSS to add an icon.

#### Types
<table>
    <tr>
        <th>Type</th>
        <th>Class</th>
    </tr>
    <tr>
        <td>General</td>
        <td><code>general</code></td>
    </tr>
    <tr>
        <td>Success</td>
        <td><code>success</code></td>
    </tr>
    <tr>
        <td>Warning</td>
        <td><code>warning</code></td>
    </tr>
    <tr>
        <td>Error</td>
        <td><code>error</code></td>
    </tr>
</table>

#### Code
```html
<div class="message-bar %TYPE%">%TEXT%</div>
```

#### Examples
```html
<div class="message-bar general">General message bar</div>
<div class="message-bar success">Success message bar</div>
<div class="message-bar warning">Warning message bar</div>
<div class="message-bar error">Error message bar</div>
```

## Buttons
Buttons can include two pieces of information: the type and size. The size is optional and excluding the size from the class will make the button display in the default size.

The special expand button is intended to be used to control collapsible sections.

#### Types
<table>
    <tr>
        <th>Type</th>
        <th>Class</th>
    </tr>
    <tr>
        <td>Primary</td>
        <td><code>default</code></td>
    </tr>
    <tr>
        <td>Secondary</td>
        <td><code>secondary</code></td>
    </tr>
    <tr>
        <td>Tertiary</td>
        <td><code>ghost</code></td>
    </tr>
</table>

#### Sizes
<table>
    <tr>
        <th>Size</th>
        <th>Class</th>
    </tr>
    <tr>
        <td>Regular</td>
        <td>None</td>
    </tr>
    <tr>
        <td>Small</td>
        <td><code>micro</code></td>
    </tr>
    <tr>
        <td>Large</td>
        <td><code>puffy</code></td>
    </tr>
</table>

#### Special
<table>
    <tr>
        <th>Type</th>
        <th>Class</th>
        <th>Notes</th>
    </tr>
    <tr>
        <td>Expand</td>
        <td><code>expander</code></td>
        <td>Do not put text in the button<br>Exclude other classes</td>
    </tr>
</table>

#### Code
```html
<button class="%TYPE% %SIZE%">%TEXT%</button>
```

#### Examples
```html
<button class="default">Submit</button>
<button class="secondary">Restart</button>

<button class="default puffy">I Agree</button>
<br>
<button class="ghost">I Do Not Agree</button>
```

## Links
When using this library, links are automatically marked as external or internal. The intention is to provide transparency to the user by clarifying when they are clicking a link that will take them away from the website they are currently on.

Links are automatically detected as external if the URL attached to them includes a protocol (`HTTP://` for example).

Classes are provided to allow developers to manually specify the link type. It's highly recommended that developers include the link type class to ensure that links are not incorrectly marked by the automatic detection. These classes always override automatic detection, so they can be used to fix incorrectly marked links. But these classes should **NOT** used to mislead users into thinking that they are clicking an internal link that's actually external or vice versa.

#### Types
<table>
    <tr>
        <th>Type</th>
        <th>Class</th>
        <th>Version</th>
    </tr>
    <tr>
        <td>Auto Detect</td>
        <td>None</td>
        <td>1.1+</td>
    </tr>
    <tr>
        <td>External</td>
        <td><code>external</code></td>
        <td>1.1+</td>
    </tr>
    <tr>
        <td>Internal</td>
        <td><code>internal</code></td>
        <td>1.1+</td>
    </tr>
</table>

#### Code
```html
<a href="%URL%" class="%TYPE%">%TEXT%</a>
```

#### Example
```html
<a href="/about">Auto detect (is internal)</a>
<a href="https://mozilla.org">Auto detect (is external)</a>
<a href="/about" class="internal">Internal</a>
<a href="https://mozilla.org" class="external">External</a>
```

## Checkboxes
When using this library, you can choose to have the checkbox style match the rest of the elements on the page. To do this, simply add the "checkbox" class to the element.

There are currently no additional options to provide for this component.

#### Types
<table>
    <tr>
        <th>Type</th>
        <th>Class</th>
        <th>Version</th>
    </tr>
    <tr>
        <td>Default</td>
        <td>None</td>
        <td>2.1+</td>
    </tr>
</table>

#### Code
```html
<input class="checkbox" type="checkbox">
```

#### Example
```html
<input class="checkbox" type="checkbox">
```

## Radio Buttons
When using this library, you can choose to have the radio button style match the rest of the elements on the page. To do this, simply add the "radio" class to the element.

There are currently no additional options to provide for this component.

#### Types
<table>
    <tr>
        <th>Type</th>
        <th>Class</th>
        <th>Version</th>
    </tr>
    <tr>
        <td>Default</td>
        <td>None</td>
        <td>2.1+</td>
    </tr>
</table>

#### Code
```html
<input class="radio" type="radio">
```

#### Example
```html
<input class="radio" type="radio">
```

## Switches
Switches are a widely accepted alternative to checkboxes, especially when working on mobile platforms. This library allows developers to easily replace a checkbox with a switch by adding the required class to the HTML checkbox element.

By default, turning a switch on or off will show an animation. However, this animation can be disabled by using a class. To ensure that the switch complies with criterion 2.3.3 of Web Content Accessibility Guidelines, this animation is automatically disabled if the user has animations disabled in their settings.

#### Animations
<table>
    <tr>
        <th>Animation</th>
        <th>Class</th>
        <th>Version</th>
    </tr>
    <tr>
        <td>Default</td>
        <td>None</td>
        <td>2.1+</td>
    </tr>
    <tr>
        <td>None</td>
        <td><code>no-animate</code></td>
        <td>2.1+</td>
    </tr>
</table>

#### Code
```html
<input class="switch %ANIMATION%" type="checkbox">
```

#### Example
```html
<input class="switch" type="checkbox">
```

## Dialogs
A dialog (sometimes called a popup or modal) includes content that is only visible to the user under certain situations. When the dialog is open, it appears above all other content on the page.

Dialogs can contain any content that would otherwise be visible on the page, including sections. By default, the content of a dialog can take up 60% of the user's viewport height. If the content exceeds that size, the content within the dialog will become scrollable. This can be adjusted using CSS by setting the `max-height` of the `dialog-content` element.

By default, the dialog will take up 80% of the user's viewport width at a maximum of 600px. The width and maximum width of the dialog can be adjusted using CSS by setting the `width` and `max-width` respectively of the `dialog-container` element.

> **TIP:**
> To ensure that your website works properly for users that depend on keyboard navigation, it's recommended that you set the `tab-index` values of all content that is not in the dialog to `-1`. This will limit keyboard navigation to only what's in the dialog. Failing to do this will make it possible for the user to focus and edit fields that are not included in the dialog.

#### States
<table>
    <tr>
        <th>State</th>
        <th>Value</th>
        <th>Version</th>
    </tr>
    <tr>
        <td>Hidden</td>
        <td><code>close</code></td>
        <td>2.1+</td>
    </tr>
    <tr>
        <td>Visible</td>
        <td><code>open</code></td>
        <td>2.1+</td>
    </tr>
</table>

#### Code
```html
<div class="dialog" data-state="%STATE%">
    <div class="dialog-container">
        <section class="dialog-header">
            %HEADER_CONTENT%
        </section>
        <section class="dialog-content">
            %CONTENT%
        </section>
        <section class="dialog-footer">
            %FOOTER_CONTENT%
        </section>
    </div>
</div>
```

#### Example
```html
<div class="dialog" data-state="close">
    <div class="dialog-container">
        <section class="dialog-header">
            Title Here
        </section>
        <section class="dialog-content">
            Content Here
        </section>
        <section class="dialog-footer">
            <button class="default">Ok</button>
            <button class="secondary">Cancel</button>
        </section>
    </div>
</div>
```

## Progress Bar
Progress bars can be used to indicate when something is loading or in cases where you need to display progress to the user. For example, when a page is loading or at the bottom of a form with multiple pages.

This library includes two types of progress bars: Percentage or infinite.

To adjust the percentage of a loading bar, update the CSS `width` of the `progress-bar-percentage` element. When using an infinite progress bar, the `progress-bar-percentage` element is not required.

The progress bar can also be anchored to the top of the page by providing the special class.

#### Types
<table>
    <tr>
        <th>Type</th>
        <th>Class</th>
        <th>Version</th>
    </tr>
    <tr>
        <td>Default</td>
        <td>None</td>
        <td>2.1+</td>
    </tr>
    <tr>
        <td>Infinite</td>
        <td><code>infinite</code></td>
        <td>2.1+</td>
    </tr>
</table>

#### Special
<table>
    <tr>
        <th>Type</th>
        <th>Class</th>
        <th>Version</th>
    </tr>
    <tr>
        <td>Anchor to top of page</td>
        <td><code>fixed-top</code></td>
        <td>2.1+</td>
    </tr>
</table>

#### Code
```html
<div class="progress-bar %TYPE% %SPECIAL%">
    <div class="progress-bar-percentage"></div>
</div>
```

#### Example
```html
<div class="progress-bar">
    <div class="progress-bar-percentage"></div>
</div>
```

## Progress Wheel
A progress wheel is a spinning loading wheel that can be used to display when something is loading. The library only currently supports an infinite progress wheel.

> **IMPORTANT:**
> The `infinite` class is required.

#### Animations
<table>
    <tr>
        <th>Type</th>
        <th>Class</th>
        <th>Version</th>
    </tr>
    <tr>
        <td>Infinite</td>
        <td><code>infinite</code></td>
        <td>2.1+</td>
    </tr>
</table>

#### Code
```html
<div class="progress-wheel %TYPE%"></div>
```

#### Example
```html
<div class="progress-wheel infinite"></div>
```