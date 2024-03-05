"""
Generalized CP Decomposition module. Provides approximate CP tensor decomposition with respect to general losses.
"""
module GCPDecompositions

# Imports
import Base: require_one_based_indexing
import Base: ndims, size, show, summary
import Base: getindex
import LinearAlgebra: norm
using Compat
using IntervalSets
using LinearAlgebra: lu!, mul!, rdiv!, rmul!, Diagonal
using LBFGSB: lbfgsb

# Exports
export CPD
export ncomponents
export gcp
export GCPLosses, GCPConstraints, GCPAlgorithms

include("type-cpd.jl")
include("type-losses.jl")
include("type-constraints.jl")
include("type-algorithms.jl")
include("kernels.jl")
include("gcp-opt.jl")

if !isdefined(Base, :get_extension)
    include("../ext/LossFunctionsExt.jl")
end

end
