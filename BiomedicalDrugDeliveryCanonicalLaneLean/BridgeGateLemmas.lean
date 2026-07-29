import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiomedicalDrugDeliveryCanonicalLaneLean.DrugDeliverySystem

namespace HautevilleHouse
namespace BiomedicalDrugDeliveryCanonicalLaneLean

structure AdmissibleClass where
  object : DrugDeliveryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let W : DrugDeliveryWitness := { object := A.object, witnessProof := A.object.conclusion }
  DrugDeliveryWitnessClosed W

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  by
    unfold bridgeClosed
    exact A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end BiomedicalDrugDeliveryCanonicalLaneLean
end HautevilleHouse