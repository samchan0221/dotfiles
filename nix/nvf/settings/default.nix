{
  vim.viAlias = false;
  vim.vimAlias = false;
  vim.globals.mapleader = "\\";
  vim.lazy.enable = true;
  vim.useSystemClipboard = true;

  vim.options = {
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
  };

  vim.keymaps = [
    {
      key = ">";
      mode = "v";
      silent = true;
      action = ">gv";
    }
    {
      key = "<";
      mode = "v";
      silent = true;
      action = "<gv";
    }
  ];

  vim.filetree.nvimTree = {
    enable = true;
    openOnSetup = false;
    mappings = {
      findFile = "<leader>F";
      toggle = "<leader>f";
      refresh = "<leader>R";
      focus = null;
    };
  };

  vim.statusline.lualine = {
    enable = true;
    theme = "dracula";
  };

  vim.tabline.nvimBufferline = {
    enable = true;
    mappings = {
      closeCurrent = "<leader>x";
      cycleNext = "<tab>";
      cyclePrevious = "<s-tab>";
      moveNext = null;
      movePrevious = null;
    };
    setupOpts.options.numbers = "none";
  };

  vim.terminal.toggleterm = {
    enable = true;
    lazygit = {
      enable = true;
      package = null;
      direction = "float";
      mappings.open = "<leader>g";
    };
  };

  vim.telescope = {
    enable = true;
    mappings = {
      findFiles = ";f";
      liveGrep = ";g";
      buffers = null;
      diagnostics = null;
      findProjects = null;
      gitBranches = null;
      gitBufferCommits = null;
      gitCommits = null;
      gitStash = null;
      gitStatus = null;
      helpTags = null;
      lspDefinitions = null;
      lspDocumentSymbols = null;
      lspImplementations = null;
      lspReferences = null;
      lspTypeDefinitions = null;
      lspWorkspaceSymbols = null;
      open = null;
      resume = null;
      treesitter = null;
    };
  };

  vim.lsp = {
    mappings = {
      codeAction = "<leader>ca";
      format = "<leader><space><space>";
      goToDeclaration = "<leader>D";
      goToDefinition = "<leader>d";
      goToType = "<leader>t";
      hover = "K";
      listReferences = "<leader>r";
      nextDiagnostic = "<leader>d";
      openDiagnosticFloat = "<leader>e";
      renameSymbol = "<leader>rn";
      documentHighlight = null;
      listDocumentSymbols = null;
      listImplementations = null;
      listWorkspaceFolders = null;
      previousDiagnostic = null;
      removeWorkspaceFolder = null;
      signatureHelp = null;
      toggleFormatOnSave = null;
    };
  };

  vim.languages = {
    enableLSP = true;
    enableTreesitter = true;
    enableFormat = true;

    bash.enable = true;
    clang.enable = true;
    css.enable = true;
    elixir.enable = true;
    go.enable = true;
    haskell.enable = true;
    html.enable = true;
    lua.enable = true;
    markdown.enable = true;
    nix.enable = true;
    rust.enable = true;
    sql.enable = true;
    terraform.enable = true;
    ts.enable = true;
  };

  vim.autocomplete.nvim-cmp = {
    enable = true;
    mappings = {
      confirm = "<CR>";
      next = "<C-n>";
      previous = "<C-p>";
      close = null;
      complete = null;
      scrollDocsDown = null;
      scrollDocsUp = null;
    };
  };

  vim.theme = {
    enable = true;
    style = "warmer";
  };
}
