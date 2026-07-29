import HautevilleHouse.BiomedicalDrugDeliveryCanonicalLaneLean.PharmacokineticModel

namespace HautevilleHouse
namespace BiomedicalDrugDeliveryCanonicalLaneLean

structure TherapeuticWindow (M : PharmacokineticModel) where
  therapeuticIndex : ℝ
  minimumEffectiveConcentration : ℝ
  maximumSafeConcentration : ℝ
  adversEventsAtSupertherapeutic : Prop
  narrowWindow : Prop
  wideWindow : Prop

structure TherapeuticWindowEvidence {M : PharmacokineticModel} (T : TherapeuticWindow M) where
  therapeuticIndexPositive : T.therapeuticIndex > 0
  minEffectivePositive : T.minimumEffectiveConcentration > 0
  maxSafePositive : T.maximumSafeConcentration > 0
  windowConsistency : T.minimumEffectiveConcentration < T.maximumSafeConcentration
  adverseEventsDocumented : T.adversEventsAtSupertherapeutic

def TherapeuticWindowClosed {M : PharmacokineticModel} (T : TherapeuticWindow M) : Prop :=
  T.therapeuticIndex > 0 ∧ T.minimumEffectiveConcentration > 0 ∧ T.maximumSafeConcentration > 0 ∧ T.minimumEffectiveConcentration < T.maximumSafeConcentration ∧ T.adversEventsAtSupertherapeutic

theorem therapeutic_window_closed_from_evidence {M : PharmacokineticModel} (T : TherapeuticWindow M) (E : TherapeuticWindowEvidence T) : TherapeuticWindowClosed T := by
  exact And.intro E.therapeuticIndexPositive (And.intro E.minEffectivePositive (And.intro E.maxSafePositive (And.intro E.windowConsistency E.adverseEventsDocumented)))

end BiomedicalDrugDeliveryCanonicalLaneLean
end HautevilleHouse