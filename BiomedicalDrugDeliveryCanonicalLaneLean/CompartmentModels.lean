import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalDrugDeliveryCanonicalLaneLean

structure CompartmentModel where
  numberOfCompartments : Nat
  rateConstants : Type
  differentialEquations : Prop
  initialConditions : Prop

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.differentialEquations ∧ M.initialConditions

theorem one_compartment_model_closed : CompartmentModelClosed ({
  numberOfCompartments := 1
  rateConstants := Type
  differentialEquations := True
  initialConditions := True
} : CompartmentModel) := by
  unfold CompartmentModelClosed
  constructor <;> exact True.intro

end BiomedicalDrugDeliveryCanonicalLaneLean
end HautevilleHouse