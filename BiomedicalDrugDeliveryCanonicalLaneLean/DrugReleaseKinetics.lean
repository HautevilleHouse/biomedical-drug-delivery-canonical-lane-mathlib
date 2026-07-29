import HautevilleHouse.BiomedicalDrugDeliveryCanonicalLaneLean.Pharmacokinetics

namespace HautevilleHouse
namespace BiomedicalDrugDeliveryCanonicalLaneLean

structure DrugReleaseKinetics where
  releaseProfile : Type
  releaseRate : ℝ → ℝ
  cumulativeRelease : ℝ → ℝ
  modelConsistent : Prop

structure ReleaseKineticsEvidence (R : DrugReleaseKinetics) where
  releaseRateNonnegative : ∀ t, R.releaseRate t ≥ 0
  cumulativeMonotonic : ∀ t1 t2, t1 ≤ t2 → R.cumulativeRelease t1 ≤ R.cumulativeRelease t2
  modelConsistentClosed : R.modelConsistent

def ReleaseKineticsClosed (R : DrugReleaseKinetics) : Prop :=
  (∀ t, R.releaseRate t ≥ 0) ∧ (∀ t1 t2, t1 ≤ t2 → R.cumulativeRelease t1 ≤ R.cumulativeRelease t2) ∧
  R.modelConsistent

theorem release_kinetics_closed_from_evidence (R : DrugReleaseKinetics) (E : ReleaseKineticsEvidence R) :
    ReleaseKineticsClosed R := by
  exact And.intro E.releaseRateNonnegative (And.intro E.cumulativeMonotonic E.modelConsistentClosed)

end BiomedicalDrugDeliveryCanonicalLaneLean
end HautevilleHouse