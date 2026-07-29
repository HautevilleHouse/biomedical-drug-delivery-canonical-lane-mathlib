import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalDrugDeliveryCanonicalLaneLean

structure CompartmentModelPackage where
  compartments : Nat
  transferRates : Vector ℝ (compartments * compartments)
  eliminationRates : Vector ℝ compartments
  initialCondition : Vector ℝ compartments
  timeDomain : Set ℝ

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.compartments > 0 ∧ (∀ r ∈ C.transferRates, r ≥ 0) ∧ (∀ r ∈ C.eliminationRates, r ≥ 0)

end BiomedicalDrugDeliveryCanonicalLaneLean
end HautevilleHouse