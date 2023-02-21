{ config, pkgs, lib, ... }:
let
  typescript-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "typescript.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "jose-elias-alvarez";
      repo = "typescript.nvim";
      rev = "71d2cf67b5ed120a0e31b2c8adb210dd2834242f";
      sha256 = "sha256-PHVY5NJbOGvY9p0F0QNSfMKmAWdqjw1RB0Vspq88qMI=";
    };
    buildPhase = ''
      echo "[DEBUG] typescript-nvim skip build phase"
    '';
  };
  rust-tools-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "rust-tools.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "simrat39";
      repo = "rust-tools.nvim";
      rev = "df584e84393ef255f5b8cbd709677d6a3a5bf42f";
      sha256 = "sha256-+/kK6MU2EiSBFbfqQJwLkJICXZpf8oiShbcvsls3V8A=";
    };
    buildPhase = ''
      echo "[DEBUG] rust-tools-nvim skip build phase"
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
      rust-tools-nvim

      # treesitter
      nvim-treesitter.withAllGrammars
      nvim-treesitter-context

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
      pkgs.nodePackages.vscode-langservers-extracted
      pkgs.vscode-extensions.ms-pyright.pyright
      node2nix."@fsouza/prettierd"
    ];

  };
}
