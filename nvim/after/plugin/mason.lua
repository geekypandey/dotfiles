require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'tsserver', 'tailwindcss', 'pylsp'},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	}
})
