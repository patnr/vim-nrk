let s:mappingsState=1
let s:is_startup=1

function! ToggleNorwegianKeys()
	if s:mappingsState
		" Map "Øø" to escape
		inoremap Ø <Esc>
		vnoremap Ø <Esc>
		" "ø"
		inoremap ø <Esc>
		vnoremap ø <Esc>
		" Don't know why <Esc> mapping in command mode seems to produce <Enter>
		" Use <C-c> instead.
		cmap ø <C-c>
		cmap Ø <C-c>
		" Map "æ" to delete
		inoremap æ <delete>
		"
		nnoremap <silent> ø :noh<return><esc>
		nnoremap <silent> Ø :noh<return><esc>
		if s:is_startup
			let s:is_startup = 0
		else
			echo "Norwegian keys {ø,æ} mapped to {esc, del}."
		endif
	else
		iunmap Ø
		iunmap ø
		unmap ø
		unmap Ø
		cunmap Ø
		cunmap ø
		iunmap æ
		if s:is_startup
			let s:is_startup = 0
		else
			echo "Norwegian keys available as usual."
		endif
	endif

	let s:mappingsState = !s:mappingsState
endfunction

command! NRK call ToggleNorwegianKeys()
NRK
