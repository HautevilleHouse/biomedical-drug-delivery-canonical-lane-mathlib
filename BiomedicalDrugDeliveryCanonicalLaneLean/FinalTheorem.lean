import HautevilleHouse.BiomedicalDrugDeliveryCanonicalLaneLean.BridgeGateLemmas

namespace HautevilleHouse
namespace BiomedicalDrugDeliveryCanonicalLaneLean

def ConstrainedDrugDeliveryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_drug_delivery_endgame (A : AdmissibleClass) : ConstrainedDrugDeliveryClosure A :=
  by
    exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiomedicalDrugDeliveryCanonicalLaneLean
end HautevilleHouse