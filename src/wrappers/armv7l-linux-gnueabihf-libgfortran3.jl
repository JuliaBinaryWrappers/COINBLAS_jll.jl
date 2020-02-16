# Autogenerated wrapper script for COINBLAS_jll for armv7l-linux-gnueabihf-libgfortran3
export libcoinblas

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libcoinblas`
const libcoinblas_splitpath = ["lib", "libcoinblas.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libcoinblas_path = ""

# libcoinblas-specific global declaration
# This will be filled out by __init__()
libcoinblas_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libcoinblas = "libcoinblas.so.0"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"COINBLAS")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global libcoinblas_path = normpath(joinpath(artifact_dir, libcoinblas_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libcoinblas_handle = dlopen(libcoinblas_path)
    push!(LIBPATH_list, dirname(libcoinblas_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

