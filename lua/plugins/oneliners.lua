return {
    {
	-- Git Plugin
	'tpope/vim-fugitive',
    },
    {
	-- CSS Colors
	'brenoprata10/nvim-highlight-colors',
	config = function()
	    require('nvim-highlight-colors').setup({})
	end
    },
}
