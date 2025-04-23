{pkgs, ...}: {
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
    yq
    lazygit
    tmux
    ripgrep
    lldb
    colima
    kubectl
    kubernetes-helm

    # # lsp (commented after using nvf)
    # nil
    # terraform-ls
    # haskellPackages.haskell-language-server
    # nodePackages_latest.typescript-language-server
    # lua-language-server
    # marksman
    # gopls
    # pyright

    # # formatter (commented after using nvf)
    # nodePackages_latest.prettier
    # nixpkgs-fmt
    # shfmt
    # stylua
    # yamlfmt
  ];

  programs = {
    nvf = {
      enable = true;
      settings = import ../nvf/settings;
    };
    neovim = {
      enable = false;
      defaultEditor = true;
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
