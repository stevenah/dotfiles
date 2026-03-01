return {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "html", "css", "typescriptreact", "javascriptreact", "vue", "svelte" },
  root_markers = { "tailwind.config.js", "tailwind.config.ts", "tailwind.config.mjs" },
}
