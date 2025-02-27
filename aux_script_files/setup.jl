import Pkg

Pkg.activate(".")

# Needed for gridenum.jl
packages = [
    "MetaGraphs",
    "IterTools",
    "DataStructures",
    "Combinatorics",
    "StatsBase",
    "ArgParse",
    "LightGraphs",
    "RandomNumbers"
]

for pkg in packages
    try
        Pkg.add(pkg)
    catch e
        @warn "Failed to install $pkg" exception = e
    end
end

# The symbolics package can sometimes fail in this. You can just skip it as it is not
# needed to run the package
unregistered_packages = [
    "https://github.com/peterrrock2/Multi-Scale-Map-Sampler#msms_with_alpha",
]

for pkg_url in unregistered_packages
    try
        Pkg.add(url=pkg_url)
    catch e
        @warn "Failed to install package from $pkg_url" exception = e
    end
end

Pkg.resolve()

println("Environment setup is complete.")

