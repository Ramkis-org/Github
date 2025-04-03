# Notepad++ v8.7.9 - Regression Fixes, Bug Fixes & Enhancements

This release addresses several regressions, fixes bugs, and introduces enhancements.

## Key Changes:

1.  **Syntax Highlighting Fixes:** Corrected regressions that caused incorrect syntax highlighting in various languages.
2.  **Scintilla & Lexilla Updates:** Updated to Scintilla 5.5.5 and Lexilla 5.4.3 for improved performance and stability.
3.  **Plugin Toolbar Button Settings:** Resolved an issue where plugin button hiding settings within `toolbarButtonsConf.xml` were being ignored.
4.  **SQL Backslash Escape Preference:** Fixed a bug that prevented the SQL Backslash Escape preference from taking effect immediately.
5.  **DirectX11 DirectWrite Rendering:** Introduced a new low-level DirectX11 DirectWrite 1.1 Scintilla rendering mode for potentially smoother text rendering.
6.  **Library Version Information:** Added the versions of external libraries (Scintilla, Lexilla, Boost) to the Debug Info, aiding in troubleshooting.

## Details:

* **Syntax Highlighting:** The syntax highlighting engine has been improved to address recent regressions, ensuring accurate and consistent highlighting for various programming languages and file types.
* **Scintilla and Lexilla:** These core components have been updated to their latest stable versions, providing bug fixes, performance improvements, and new features.
* **Plugin Toolbar Customization:** Users can now reliably customize the toolbar by hiding or showing plugin buttons using the `toolbarButtonsConf.xml` configuration file.
* **SQL Editing:** The SQL Backslash Escape preference now takes effect immediately upon modification, streamlining SQL editing.
* **Rendering Improvements:** The new DirectX11 DirectWrite 1.1 rendering mode offers an alternative rendering pipeline that may provide improved performance and visual fidelity on compatible systems.
* **Debugging:** Including the versions of external libraries in the Debug Info facilitates easier troubleshooting and bug reporting.

## How to Update:

* Download the latest installer from the official Notepad++ website.
* Install the update, following the on-screen instructions.

## Feedback:

Please report any issues or suggestions on the Notepad++ GitHub repository.
