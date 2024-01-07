"
" Reverses the passed test
"
" Examples:
"
"   :echo Reverse('Exercism')
"   msicrexE
"
function! Reverse(text) abort
  return join(reverse(split(a:text, '\zs')), '')
endfunction
