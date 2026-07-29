import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalDrugDeliveryCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DrugDeliveryWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiomedicalDrugDeliveryCanonicalLaneLean
end HautevilleHouse