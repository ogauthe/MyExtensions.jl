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
end
