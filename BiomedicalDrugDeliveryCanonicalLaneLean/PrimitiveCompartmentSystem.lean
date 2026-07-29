import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalDrugDeliveryCanonicalLaneLean

structure PrimitiveDrug where
  name : String
  molecularWeight : ℝ
  solubility : ℝ

def PrimitiveDrugValid (d : PrimitiveDrug) : Prop :=
  d.molecularWeight > 0 ∧ d.solubility ≥ 0

structure PrimitiveCompartment where
  compartmentId : Nat
  volume : ℝ

def PrimitiveCompartmentValid (c : PrimitiveCompartment) : Prop :=
  c.volume > 0

structure PrimitiveCompartmentSystem where
  drugs : List PrimitiveDrug
  compartments : List PrimitiveCompartment
  drugDistribution : DrugDistribution
  transferRates : ℝ → ℝ

def DrugDistribution : Type := drug -> compartment -> ℝ

def PrimitiveCompartmentSystemValid (s : PrimitiveCompartmentSystem) : Prop :=
  (∀ d ∈ s.drugs, PrimitiveDrugValid d) ∧ (∀ c ∈ s.compartments, PrimitiveCompartmentValid c)

end BiomedicalDrugDeliveryCanonicalLaneLean
end HautevilleHouse