require("auto-session").setup({
	auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
	auto_session_enabled = true,
	auto_save_enabled = true,
	auto_restore_enabled = true,
	auto_session_enable_last_session = false,
	auto_session_use_git_branch = false, -- one session per dir
	pre_save_cmds = { "NvimTreeClose", "tabdo q" },
	post_restore_cmds = { "NvimTreeOpen" },
})

vim.keymap.set("n", "<leader>ss", ":SessionSave<CR>", { desc = "Session Save" })
vim.keymap.set("n", "<leader>sr", ":SessionRestore<CR>", { desc = "Session Restore" })

