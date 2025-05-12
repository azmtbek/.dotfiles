return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.completion.list.selection = {
      preselect = false, -- Do not preselect
      auto_insert = true, -- Do not auto insert
    }
    return opts
  end,
}
