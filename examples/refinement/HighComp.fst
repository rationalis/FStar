module HighComp

module U32 = FStar.UInt32
  
type mint = U32.t
type state = mint * mint
//type state = int
let comp a = state -> M (a * state)

val hreturn : (a:Type) -> a -> comp a
let hreturn (a:Type) (x : a) = fun s -> (x, s)

val hbind : (a:Type) -> (b:Type) -> comp a -> (a -> comp b) -> comp b
let hbind (a:Type) (b:Type) (m : comp a) (f : a -> comp b) = 
    fun s -> let (a, s1) = m s in f a s1

val hread : i:int -> comp mint
let hread (i:int) : comp mint = 
    fun s -> if i = 0 then (fst s, s) 
          else (snd s, s)

val hwrite : i:int -> v:mint -> comp unit
let hwrite (i:int) (v:mint) : comp unit =
    fun s -> if i = 0 then ((), (v, snd s))
          else ((), (fst s, v))

val dread : unit -> comp state
let dread (_ : unit) : comp state = fun s -> (s, s) 

val dwrite : v:state -> comp unit
let dwrite (v : state) : comp unit = fun s -> ((), v)

// NOTE : ommiting type annotations from dread and dwrite defs
// makes the effect definition fail

total reifiable reflectable new_effect {
      HIGH : a:Type -> Effect
      with repr  = comp 
       ; bind     = hbind
       ; return   = hreturn
       ; get      = hread
       ; put      = hwrite
       }
