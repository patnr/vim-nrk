let s:is_on=1

function! ToggleNorwegianKeys(silence)
  " Toggle keys
  if s:is_on
    " ø
    inoremap Ø <Esc>
    inoremap ø <Esc>
    tnoremap Ø <Esc>
    tnoremap ø <Esc>
    vnoremap Ø <Esc>
    vnoremap ø <Esc>
    " cmap to <Esc> seems to produce <CR>. Use <C-c> instead.
    cnoremap Ø <C-c>
    cnoremap ø <C-c>

    " æ
    inoremap æ <delete>
    inoremap Æ <delete>
    tnoremap æ <delete>
    tnoremap Æ <delete>
    " Avoid common error of typing :wq and then wanting to cancel with `ø` but
    " typing `æ` instead, sometimes writing files called `æ`.
    cnoremap Æ <delete>
    cnoremap æ <delete>
    " cnoremap æ <C-c>

    " NB: dont use these (inconvenient since ´ is deadkey) -- simply use <C-ø>
    " Workarounds
    " inoremap ´Ø Ø
    " inoremap ´ø ø
    " tnoremap ´Ø Ø
    " tnoremap ´ø ø
    " vnoremap ´Ø Ø
    " vnoremap ´ø ø
    " cnoremap ´Ø Ø
    " cnoremap ´ø ø
    "
    " inoremap ´æ æ
    " inoremap ´Æ Æ
    " tnoremap ´æ æ
    " tnoremap ´Æ Æ
    " cnoremap ´Æ Æ
    " cnoremap ´æ æ

  else
    iunmap Ø
    iunmap ø
    tunmap Ø
    tunmap ø
    vunmap Ø
    vunmap ø
    cunmap Ø
    cunmap ø
    nunmap Ø
    nunmap ø

    iunmap Æ
    iunmap æ
    tunmap Æ
    tunmap æ
    cunmap Æ
    cunmap æ
  endif

  " Echo
  if !a:silence
    if s:is_on
      echo "Norwegian keys {ø,æ} mapped to {esc, del}."
    else
      echo "Norwegian keys available as usual."
    endif
  endif

  " Toggle state
  let s:is_on = !s:is_on
endfunction

command! NRK call ToggleNorwegianKeys(1)
NRK
