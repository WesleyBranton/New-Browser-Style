# Component Documentation
This page includes the documentation for all of the UI components in this library. It will include the HTML code required to make the component and some components also include examples of how to use the elements.

Some code snippets may contain placeholders. These are surrounded with % characters. For example, `%TEXT%` is a placeholder for some text.

> **Table of Contents**
> - [Page Layout](#page-layout)
> - [Sections](#sections)
>   - [Regular section](#regular-section)
>   - [Section with description](#section-with-description)
>   - [Section note](#section-note)
>   - [Header](#header)
>   - [Footer](#footer)
> - [Dividers](#dividers)
> - [Tabs](#tabs)
> - [List menu](#list-menu)
> - [Message bars](#message-bars)
> - [Buttons](#buttons)
> - [Links](#links)

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
        <td>1.2+</td>
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

#### Type
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