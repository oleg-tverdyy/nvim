# AstroNvim Template

**NOTE:** This is for AstroNvim v4+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

#### Setup SourceKit LSP

You need to go to the plugins file `lsp.lua` and modify inside the `lsp-config.sourcekit` field the `cmd` attribute by the path where your *SourceKit* LSP is located.

```lua
cmd = { "/usr/bin/sourcekit-lsp" }, -- Asegúrate de que esta ruta sea correcta
```
In general, you will need to know where to find the `sourcekit-lsp` server exectuable. Some examples:

* With Xcode 11.4+
  * `xcrun sourcekit-lsp` - run the server
  * `xcrun --find sourcekit-lsp` - get the full path to the server
* Toolchain from Swift.org
  * Linux
    * You will find `sourcekit-lsp` in the `bin` directory of the toolchain.
  * macOS
    * `xcrun --toolchain swift sourcekit-lsp` - run the server
    * `xcrun --toolchain swift --find sourcekit-lsp` - get the full path to the server
* Built from source
  * `.build/<platform>/<configuration>/sourcekit-lsp`

#### Setup SourceKit LSP

You need to go to the plugins file `lsp.lua` and modify inside the `lsp-config.jsonls` field the `cmd` attribute by the path where your *vscode* LSP is located.

It is possible that you do not have it installed, to do it with homebrew you must use the following command:

```bash
brew install vscode-langservers-extracted
```

Once installed, the path to the vscode LSP on macOS is: `/opt/homebrew/bin/vscode-json-language-server`, which you have to put in the CMD field of the LSP configuration.

```lua
-- Configuración para JSON Language Server
require("lspconfig").jsonls.setup {
  cmd = { "/opt/homebrew/bin/vscode-json-language-server", "--stdio" }, -- Asegúrate de que el servidor LSP para JSON esté instalado
  filetypes = { "json" },
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
}
```
