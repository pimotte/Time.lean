import Lake
open Lake DSL

def cDir   := "native"
def ffiSrc := "native.c"
def ffiO   := "ffi.o"
def ffiLib := "ffi"

package time {
  -- add package configuration options here
}

lean_lib Time {
  -- add library configuration options here
}

target ffi.o (pkg : Package) : FilePath := do
  let oFile := pkg.buildDir / ffiO
  let srcJob ← inputFile <| pkg.dir / cDir / ffiSrc
  buildFileAfterDep oFile srcJob fun srcFile => do
    let flags := #["-I", (← getLeanIncludeDir).toString, "-fPIC"]
    compileO ffiSrc oFile srcFile flags

extern_lib ffi (pkg : Package) := do
  let name := nameToStaticLib ffiLib
  let ffiO ← fetch <| pkg.target ``ffi.o
  buildStaticLib (pkg.buildDir / "lib" / name) #[ffiO]



@[default_target]
lean_exe time {
  root := `Main
}
