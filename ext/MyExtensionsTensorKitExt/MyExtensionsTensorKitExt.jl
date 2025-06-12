module MyExtensionsTensorKitExt

using TensorKit:
    AbstractTensorMap,
    AdjointTensorMap,
    DiagonalTensorMap,
    TensorMap,
    codomain,
    dim,
    domain,
    numin,
    numout,
    sectortype


function pprint_tensormap(io, t::AbstractTensorMap)
    print(io, nameof(typeof(t)))
    print(io, "{$(eltype(t)), $(sectortype(t)), $(numout(t)), $(numin(t))}")
    return print(io, " shape ($(dim.(Tuple(codomain(t)))), $(dim.(Tuple(domain(t)))))")
end


# Quality of life type piracy
Base.size(t::AbstractTensorMap) = dim.(Tuple(codomain(t))), dim.(Tuple(domain(t)))

Base.show(io::IO, t::AbstractTensorMap) = pprint_tensormap(io, t)

function __init__()
    @eval Base.show(io::IO, t::TensorMap) = pprint_tensormap(io, t)
    @eval Base.show(io::IO, t::AdjointTensorMap) = pprint_tensormap(io, t)
    @eval Base.show(io::IO, t::DiagonalTensorMap) = pprint_tensormap(io, t)
end

function Base.show(io::IO, ::MIME"text/plain", t::AbstractTensorMap)
    pprint_tensormap(io, t)
    println(io, "\ncodomain = ", codomain(t))
    return print(io, "domain = ", domain(t))
end

end
