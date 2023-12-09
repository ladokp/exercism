"
" Calculate the score of a single dart toss, given the distance
" from the center of the board in the X and Y graph axes.
" The circular dartboard is ten units wide from the center to the edge.
"
" Example:
"
" :echo Darts(0, 0)
" 10
"
" :echo Darts(11, 11)
" 0
"
function! Darts(x, y) abort
  let distance = sqrt(a:x*a:x + a:y*a:y)
  if distance <= 1
    return 10
  endif
  if distance <= 5
    return 5
  endif
  if distance <= 10
    return 1
  endif
  return 0
endfunction
