let reverse_string str =
  let len = String.length str in
  String.init len (fun index -> str.[len - 1 - index])
