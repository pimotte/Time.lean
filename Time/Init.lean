namespace Time

/-!
  # Time Initialization

  This module automatically initializes the socket environment, and users need not care about it.
  To initialization the environment, two steps are required:

  1. Register external classes like `Time`

 -/

/-- The initialization function. Users shouldn't call this. -/
@[extern "lean_time_initialize"]
opaque initTime : IO Unit

builtin_initialize initTime

end Time