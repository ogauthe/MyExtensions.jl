module MyExtensionsPEPSKitExt

using TensorKit: domain
using PEPSKit: CTMRGEnv

Base.show(io::IO, env::CTMRGEnv) = print(io, "CTMRGenv with unit cell ", size(env)[2:end])

function Base.show(io::IO, ::MIME"text/plain", env::CTMRGEnv)
    println(io, env)
    println(io, "Corner spaces:")
    return map(c -> println(io, only(domain(c))), env.corners)
end

end
