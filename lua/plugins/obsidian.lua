return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  -- Load when opening markdown files OR your vault directory
  dependencies = { "nvim-lua/plenary.nvim" },

  opts = {

    -- ── Vault location ─────────────────────────
    -- All your notes live here. Adjust the path as needed.
    workspaces = {
      { name = "personal", path = "~/notes" },
    },

    -- ── Folder layout inside ~/notes ───────────
    -- personal/   → daily journal entries
    -- dsa/        → DSA topic + problem notes
    -- work/       → work task tracking
    notes_subdir = "inbox",   -- default new note goes to inbox/

    -- ── Daily notes config ──────────────────────
    daily_notes = {
      folder        = "personal/daily",
      date_format   = "%Y-%m-%d",
      alias_format  = "%B %-d, %Y",
      template      = "daily.md",    -- looks in templates/
    },

    -- ── Templates ───────────────────────────────
    templates = {
      subdir        = "templates",
      date_format   = "%Y-%m-%d",
      time_format   = "%H:%M",
    },

    -- ── Note ID format ───────────────────────────
    -- Use readable titles as filenames (not random IDs)
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return suffix
    end,

    -- ── Frontmatter ──────────────────────────────
    -- Auto-written at top of every note
    note_frontmatter_func = function(note)
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do out[k] = v end
      end
      return out
    end,

    -- ── Completion ───────────────────────────────
    completion = {
      nvim_cmp     = true,   -- works with nvim-cmp
      min_chars    = 2,
    },

    -- ── Mappings (all under <leader>n) ───────────
    mappings = {

      -- Smart enter: follow links or open note under cursor
      ["<CR>"] = {
        action = function() return require("obsidian").util.smart_action() end,
        opts   = { buffer = true, expr = true, desc = "Obsidian smart action" },
      },

      -- ── Daily / Personal ─────────────────────
      ["<leader>nd"] = {
        action = "<cmd>ObsidianToday<cr>",
        opts   = { buffer = false, desc = "Open today's daily note" },
      },
      ["<leader>nD"] = {
        action = "<cmd>ObsidianYesterday<cr>",
        opts   = { buffer = false, desc = "Open yesterday's note" },
      },
      ["<leader>nj"] = {
        action = "<cmd>ObsidianDailies<cr>",
        opts   = { buffer = false, desc = "Browse journal entries" },
      },

      -- ── Search / Navigation ───────────────────
      ["<leader>ns"] = {
        action = "<cmd>ObsidianSearch<cr>",
        opts   = { buffer = false, desc = "Search notes (grep)" },
      },
      ["<leader>nf"] = {
        action = "<cmd>ObsidianQuickSwitch<cr>",
        opts   = { buffer = false, desc = "Quick switch to note" },
      },
      ["<leader>nb"] = {
        action = "<cmd>ObsidianBacklinks<cr>",
        opts   = { buffer = false, desc = "Show backlinks" },
      },
      ["<leader>nl"] = {
        action = "<cmd>ObsidianLinks<cr>",
        opts   = { buffer = false, desc = "Show links in note" },
      },
      ["<leader>ng"] = {
        action = "<cmd>ObsidianGraph<cr>",
        opts   = { buffer = false, desc = "Open graph view" },
      },

      -- ── New Notes ────────────────────────────
      ["<leader>nn"] = {
        action = "<cmd>ObsidianNew<cr>",
        opts   = { buffer = false, desc = "New note (inbox)" },
      },
      ["<leader>nN"] = {
        -- Creates note in specific folder via input
        action = function()
          local folder = vim.fn.input("Folder (personal/dsa/work): ", "", "file")
          if folder == "" then return end
          local title  = vim.fn.input("Note title: ")
          if title == "" then return end
          vim.cmd("ObsidianNew " .. folder .. "/" .. title)
        end,
        opts = { buffer = false, desc = "New note in folder" },
      },

      -- ── Templates ────────────────────────────
      ["<leader>nt"] = {
        action = "<cmd>ObsidianTemplate<cr>",
        opts   = { buffer = false, desc = "Insert template" },
      },

      -- ── Tags ─────────────────────────────────
      ["<leader>nT"] = {
        action = "<cmd>ObsidianTags<cr>",
        opts   = { buffer = false, desc = "Search by tag" },
      },

      -- ── Rename current note ───────────────────
      ["<leader>nr"] = {
        action = "<cmd>ObsidianRename<cr>",
        opts   = { buffer = false, desc = "Rename note" },
      },

      -- ── Paste image (screenshots) ─────────────
      ["<leader>np"] = {
        action = "<cmd>ObsidianPasteImg<cr>",
        opts   = { buffer = false, desc = "Paste image from clipboard" },
      },

      -- ── Checkbox toggle ───────────────────────
      ["<leader>nc"] = {
        action = "<cmd>ObsidianToggleCheckbox<cr>",
        opts   = { buffer = false, desc = "Toggle checkbox" },
      },
    },

    -- ── UI ──────────────────────────────────────
    ui = {
      enable = true,
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo"    },
        ["x"] = { char = "", hl_group = "ObsidianDone"    },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde"  },
      },
      bullets          = { char = "•", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text   = { hl_group = "ObsidianRefText" },
      highlight_text   = { hl_group = "ObsidianHighlightText" },
      tags             = { hl_group = "ObsidianTag" },
      block_ids        = { hl_group = "ObsidianBlockID" },
    },

    -- ── Attachments (images etc.) ────────────────
    attachments = {
      img_folder = "assets/imgs",
    },
  },
}
