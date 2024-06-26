{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # lang
    python311
    deno
    poetry
    clang
    clang-tools
    lld
    nodejs_21

    # tools
    jq
    yq
    lazygit
    tmux
    ripgrep
    lldb

    # lsp
    rnix-lsp
    terraform-ls
    haskellPackages.haskell-language-server
    nodePackages_latest.typescript-language-server
    lua-language-server
    marksman
    gopls

    # formatter
    nodePackages_latest.prettier
    nixpkgs-fmt
    shfmt
    stylua
    yamlfmt
  ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
