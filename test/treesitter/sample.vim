" Vim sample
function! Greet(name)
  let msg = "Hello, " . a:name
  echo msg
endfunction

call Greet("world")
