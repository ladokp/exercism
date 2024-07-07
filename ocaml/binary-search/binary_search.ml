open Base

let find (xs : int array) (value : int) : (int, string) result =
  let rec go lo hi =
    if lo > hi then Error "value not in array"
    else 
      let mid = lo + (hi - lo) / 2 in
      let mid_val = xs.(mid) in
      if mid_val < value then
        go (mid + 1) hi
      else if mid_val > value then
        go lo (mid - 1)
      else
        Ok mid
  in
  if Array.is_empty xs then Error "value not in array"
  else go 0 (Array.length xs - 1)
