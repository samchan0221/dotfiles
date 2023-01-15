pkgs:
with pkgs;
(rust-bin.stable."1.66.0".default.override {
  extensions = [
    "rust-src"
    "rust-analyzer"
  ];
})
