-- lua <<EOF
function ModeColor()
    if vim.fn.mode() == 'i' then
        vim.cmd("hi ActiveBuffer ctermfg=0 ctermbg=154 cterm=bold")
    elseif vim.fn.mode() == 'n' then
        vim.cmd("hi ActiveBuffer ctermfg=255 ctermbg=26 cterm=bold")
    elseif vim.fn.mode() == 'c' then
        vim.cmd("hi ActiveBuffer ctermfg=255 ctermbg=88 cterm=bold")
    elseif vim.fn.mode() == 'R' then
        vim.cmd("hi ActiveBuffer ctermfg=0 ctermbg=140 cterm=bold")
    elseif vim.fn.mode() == 'v' then
        vim.cmd("hi ActiveBuffer ctermfg=0 ctermbg=36 cterm=bold")
    elseif vim.fn.mode() == '\x16' then
        vim.cmd("hi ActiveBuffer ctermfg=0 ctermbg=116 cterm=bold")
    elseif vim.fn.mode() == 'V' then
        vim.cmd("hi ActiveBuffer ctermfg=0 ctermbg=51 cterm=bold")
    elseif vim.fn.mode() == 's' then
        vim.cmd("hi ActiveBuffer ctermfg=0 ctermbg=172 cterm=bold")
    elseif vim.fn.mode() == 'S' then
        vim.cmd("hi ActiveBuffer ctermfg=0 ctermbg=223 cterm=bold")
    elseif vim.fn.mode() == '\x13' then
        vim.cmd("hi ActiveBuffer ctermfg=0 ctermbg=214 cterm=bold")
    elseif vim.fn.mode() == 't' then
        vim.cmd("hi ActiveBuffer ctermfg=255 ctermbg=red cterm=bold")
    else
        vim.cmd("hi ActiveBuffer ctermbg=22")
    end
end
function allbuf(cur)
	local bufcon= {}
	for _,v in pairs(vim.fn.getbufinfo({buflisted=1})) do
		local bufbloc = v.bufnr ..'.'  .. vim.fn.fnamemodify(v.name, ":t")
		if(v.bufnr == cur.buf) then
                        bufbloc= '%#activebuffer#'.. bufbloc .. '%*'
                end
                table.insert(bufcon, bufbloc)
        end
	vim.o.statusline =table.concat(bufcon, '|')..'%=%l/%L:%c'	
end
vim.cmd([[
    autocmd bufenter,TermOpen * lua allbuf({buf = vim.fn.bufnr()})
    autocmd ModeChanged,CmdwinEnter * lua ModeColor()
]])
-- EOF
