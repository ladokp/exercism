"
" Returns the number of steps to reach 1 for a given number
" using the Collatz Conjecture or 3x+1 problem.
" Throws an error if input is less than 1.
"
" Example:
"
"   :echo Steps(16)
"   4
"
"   :echo Steps(-1)
"   E605: Exception not caught: Only positive integers are allowed
"
set maxfuncdepth=158
function! Steps(number) abort
  if a:number < 1
    throw "Only positive integers are allowed"
  endif
  if a:number == 1 
    return 0
  endif
  if a:number % 2 == 0 
    return 1 + Steps(float2nr(floor(a:number / 2)))
  else
    return 1 + Steps(3 * a:number + 1)
  endif
endfunction
