import Time
import Time.Time

def main : IO Unit := do
  let curTime ← Time.current_time
  IO.println s!"Hello, {curTime}!"
