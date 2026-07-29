import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalDrugDeliveryCanonicalLaneLean

open CompartmentModelPackage

structure PharmacokineticFoundation where
  compartmentModel : CompartmentModelPackage
  absorptionModel : Prop
  distributionModel : Prop
  metabolismModel : Prop
  eliminationModel : Prop

def PharmacokineticFoundationClosed (F : PharmacokineticFoundation) : Prop :=
  CompartmentModelClosed F.compartmentModel ∧ F.absorptionModel ∧ F.distributionModel ∧ F.metabolismModel ∧ F.eliminationModel

theorem pk_foundation_closed_from_evidence (F : PharmacokineticFoundation) (h : PharmacokineticFoundationClosed F) : PharmacokineticFoundationClosed F :=
  h

end BiomedicalDrugDeliveryCanonicalLaneLean
end HautevilleHouse