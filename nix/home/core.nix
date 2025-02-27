{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # lang
    python311
    deno
    poetry
    clang clang-tools lld

    # tools
    jq
    yq
    lazygit
    tmux
    ripgrep
    lldb
    colima

    # lsp
    nil
    terraform-ls
    haskellPackages.haskell-language-server
    nodePackages_latest.typescript-language-server
    lua-language-server
    marksman
    gopls
    pyright

    # formatter
    nodePackages_latest.prettier
    nixpkgs-fmt
    shfmt
    stylua
    yamlfmt
  ];

  programs = {
    nvf = {
      enable = true;
      settings = import ../nvf/settings;
    };
    # neovim = {
    #   enable = true;
    #   defaultEditor = true;
    # };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
