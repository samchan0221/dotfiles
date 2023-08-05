{ config, pkgs, pkgs-2211, lib, ... }:
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
  nx-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "nx.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "Equilibris";
      repo = "nx.nvim";
      rev = "4ff337ff03eb17c8ac3e0e8fe784e68ea8a56763";
      sha256 = "sha256-+/kK6MU2EiSBFbfqQJwLkJICXZpf8oiShbcvsls3V8A=";
    };
  };
  telescope-fzf-native-nvim-prebuilt = pkgs.vimUtils.buildVimPlugin
    {
      name = "telescope-fzf-native-nvim-prebuilt";
      src = pkgs.fetchFromGitHub {
        owner = "nvim-telescope";
        repo = "telescope-fzf-native.nvim";
        rev = "9bc8237565ded606e6c366a71c64c0af25cd7a50";
        sha256 = "sha256-en1SBdM1ZLQNa2hCDnQwaZsFUfQ334z2X664aUwftjw=";
      };
      buildPhase = ''
        make
      '';
    };
  node2nix = pkgs.callPackage ../node2nix { };
in
{
  xdg.configFile."nvim/init.lua".source = lib.cleanSource ../../.config/nvim/init.lua;
  xdg.configFile."nvim/lua".source = lib.cleanSource ../../.config/nvim/lua;

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
      telescope-fzf-native-nvim-prebuilt

      # nvim-tree
      nvim-web-devicons
      nvim-tree-lua

      # cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp-vsnip
      vim-vsnip
      nvim-cmp

      # magic
      copilot-vim

      # misc
      lualine-nvim
      toggleterm-nvim
      trouble-nvim
      comment-nvim
      vim-fugitive
      vim-surround
      gitsigns-nvim
      dracula-nvim
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
