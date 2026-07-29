import HautevilleHouse.BiomedicalDrugDeliveryCanonicalLaneLean.PharmacokineticModel

namespace HautevilleHouse
namespace BiomedicalDrugDeliveryCanonicalLaneLean

structure DrugReleaseProfile (M : PharmacokineticModel) where
  releaseMechanism : Type
  dissolutionRate : ℝ
  releaseHalfLife : ℝ
  immediateReleaseFraction : ℝ
  sustainedReleaseDuration : ℝ
  zeroOrderKinetics : Prop
  firstOrderKinetics : Prop
  diffusionControlled : Prop

structure DrugReleaseEvidence {M : PharmacokineticModel} (R : DrugReleaseProfile M) where
  dissolutionRatePositive : R.dissolutionRate > 0
  releaseHalfLifePositive : R.releaseHalfLife > 0
  immediateReleaseFractionInRange : 0 ≤ R.immediateReleaseFraction ∧ R.immediateReleaseFraction ≤ 1
  releaseKineticsClosed : R.zeroOrderKinetics ∨ R.firstOrderKinetics

def DrugReleaseClosed {M : PharmacokineticModel} (R : DrugReleaseProfile M) : Prop :=
  R.dissolutionRate > 0 ∧ R.releaseHalfLife > 0 ∧ (0 ≤ R.immediateReleaseFraction ∧ R.immediateReleaseFraction ≤ 1) ∧ (R.zeroOrderKinetics ∨ R.firstOrderKinetics)

theorem drug_release_closed_from_evidence {M : PharmacokineticModel} (R : DrugReleaseProfile M) (E : DrugReleaseEvidence R) : DrugReleaseClosed R := by
  exact And.intro E.dissolutionRatePositive (And.intro E.releaseHalfLifePositive (And.intro E.immediateReleaseFractionInRange E.releaseKineticsClosed))

end BiomedicalDrugDeliveryCanonicalLaneLean
end HautevilleHouse