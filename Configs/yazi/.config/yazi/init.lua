require("duckdb"):setup({
  mode = "standard",            -- Default: "summarized"
  row_id = true,                -- Default: false
  minmax_column_width = 30      -- Default: 21
})