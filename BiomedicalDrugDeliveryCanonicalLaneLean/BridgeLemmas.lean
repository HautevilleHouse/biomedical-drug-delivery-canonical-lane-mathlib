import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalDrugDeliveryCanonicalLaneLean

open AdmissibleClass

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DrugDeliveryWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BiomedicalDrugDeliveryCanonicalLaneLean
end HautevilleHouse