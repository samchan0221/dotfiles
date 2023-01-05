{ config, pkgs, lib, ... }:
let typescript-nvim = pkgs.vimUtils.buildVimPlugin {
  name = "typescript.nvim";
  src = pkgs.fetchFromGitHub {
    owner = "jose-elias-alvarez";
    repo = "typescript.nvim";
    rev = "f66d4472606cb24615dfb7dbc6557e779d177624";
    sha256 = "sha256-PHVY5NJbOGvY9p0F0QNSfMKmAWdqjw1RB0Vspq88qMI=";
  };
  buildPhase = ''
    echo "[DEBUG] typescript-nvim skip build phase"
  '';
};
in
{
  xdg.configFile."nvim/settings.lua".source = lib.cleanSource ../.config/nvim/init.lua;
  xdg.configFile."nvim/lua".source = lib.cleanSource ../.config/nvim/lua;

  programs.neovim = {
    enable = true;
    withPython3 = true;
    withNodeJs = true;
    withRuby = true;
    plugins = with pkgs.vimPlugins; [
      # lsp
      nvim-lspconfig
      null-ls-nvim
      typescript-nvim

      # treesitter
      nvim-treesitter.withAllGrammars

      # telescope
      plenary-nvim
      telescope-nvim

      # nvim-tree
      nvim-web-devicons
      nvim-tree-lua

      # cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp

      # misc
      lualine-nvim
      toggleterm-nvim
      trouble-nvim
    ];
    extraPackages = with pkgs; [
      sumneko-lua-language-server
      rnix-lsp
      nodePackages.typescript
      nodePackages.typescript-language-server
    ];
    extraConfig = ''
      luafile ~/.config/nvim/settings.lua
    '';
  };
}
