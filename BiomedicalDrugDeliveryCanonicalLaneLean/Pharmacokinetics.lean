import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalDrugDeliveryCanonicalLaneLean

structure PharmacokineticParameters where
  volumeOfDistribution : ℝ
  clearance : ℝ
  halfLife : ℝ
  bioavailability : ℝ
  parametersValid : Prop

def PharmacokineticsClosed (P : PharmacokineticParameters) : Prop :=
  P.parametersValid

theorem pharmacokinetics_closed_from_parameters (P : PharmacokineticParameters) (h : P.parametersValid) : PharmacokineticsClosed P := h

end BiomedicalDrugDeliveryCanonicalLaneLean
end HautevilleHouse