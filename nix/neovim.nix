{ config, pkgs, lib, ... }:
let
  typescript-nvim = pkgs.vimUtils.buildVimPlugin {
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
  node2nix = pkgs.callPackage ./node2nix { };
in
{
  xdg.configFile."nvim/init.lua".source = lib.cleanSource ../.config/nvim/init.lua;
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
      comment-nvim
      vim-fugitive
      vim-surround
      gitsigns-nvim
    ];

    extraPackages = [
      pkgs.sumneko-lua-language-server
      pkgs.rnix-lsp
      pkgs.nodePackages.typescript
      pkgs.nodePackages.typescript-language-server
      pkgs.nodePackages.eslint_d
      node2nix."@fsouza/prettierd"
    ];

  };
}
