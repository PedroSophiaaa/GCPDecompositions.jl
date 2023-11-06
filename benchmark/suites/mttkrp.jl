module BenchmarkMTTKRP

using BenchmarkTools

using Random
using GCPDecompositions

const SUITE = BenchmarkGroup()

bench_mttkrp = SUITE

szs = [
    (10, 10, 10),
    (30, 30, 30),
    (50, 50, 50),
    (80, 80, 80),
    (120, 120, 120),
    (200, 200, 200),
]
ns = 1:3
rs = 20:20:200

for sz in szs, r in rs, n in ns
    Random.seed!(0)
    X = randn(sz)
    U = [randn(Ik,r) for Ik in sz]
    bench_mttkrp["size=$sz, rank=$r, mode=$n"] = @benchmarkable GCPDecompositions.mttkrp($X, $U, $n)
end

end