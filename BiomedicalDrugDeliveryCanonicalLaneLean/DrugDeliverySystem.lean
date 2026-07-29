import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalDrugDeliveryCanonicalLaneLean

structure CompartmentModel where
  volume : Nat
  clearance : Nat
  steadyStateConcentration : Prop
  halfLife : Prop

default steadyStateConcentration := False
default halfLife := False

structure DrugDeliveryAdmittedObject where
  model : CompartmentModel
  conclusion : model.steadyStateConcentration

structure DrugDeliveryWitness where
  object : DrugDeliveryAdmittedObject
  witnessProof : object.conclusion

def DrugDeliveryWitnessClosed (W : DrugDeliveryWitness) : Prop :=
  W.witnessProof

end BiomedicalDrugDeliveryCanonicalLaneLean
end HautevilleHouse