"
" Convert a number to a string, the contents of which depend on the number's
" factors.
"
"   - If the number has 3 as a factor, output 'Pling'.
"   - If the number has 5 as a factor, output 'Plang'.
"   - If the number has 7 as a factor, output 'Plong'.
"   - If the number does not have 3, 5, or 7 as a factor, just pass
"     the number's digits straight through.
"
" Example:
"
"   :echo Raindrops(15)
"   PlingPlang
"
function! Raindrops(number) abort
  let s = ''

  if a:number % 3 == 0 | let s .= 'Pling' | endif
  if a:number % 5 == 0 | let s .= 'Plang' | endif
  if a:number % 7 == 0 | let s .= 'Plong' | endif

  return empty(s) ? string(a:number) : s
endfunction
