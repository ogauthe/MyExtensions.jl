module MyExtensionsPEPSKitExt

using TensorKit: domain
using PEPSKit: CTMRGEnv

Base.show(io::IO, env::CTMRGEnv) = print(io, "CTMRGEnv with unit cell ", Base.tail(size(env)))

function Base.show(io::IO, ::MIME"text/plain", env::CTMRGEnv)
    println(io, env)
    println(io, "Corner spaces:")
    return map(c -> println(io, only(domain(c))), env.corners)
end

end
