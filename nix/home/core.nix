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

    # tools
    jq
    lazygit
    tmux
    ripgrep
    lldb

    # lsp
    rnix-lsp
    terraform-ls
    haskellPackages.haskell-language-server
    lua-language-server
    marksman

    # formatter
    nixpkgs-fmt
    shfmt
    stylua
  ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
