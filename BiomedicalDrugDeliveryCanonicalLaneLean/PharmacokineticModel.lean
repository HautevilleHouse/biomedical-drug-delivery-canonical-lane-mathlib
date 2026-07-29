import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BiomedicalDrugDeliveryCanonicalLaneLean

structure PharmacokineticModel where
  compartments : Nat
  volumeOfDistribution : ℝ
  clearance : ℝ
  halfLife : ℝ
  eliminationRateConstant : ℝ
  absorptionRateConstant : ℝ
  bioavailability : ℝ
  linearKinetics : Prop
  steadyStateConcentration : Prop

structure PharmacokineticEvidence (M : PharmacokineticModel) where
  volumeOfDistributionPositive : M.volumeOfDistribution > 0
  clearancePositive : M.clearance > 0
  halfLifePositive : M.halfLife > 0
  linearKineticsClosed : M.linearKinetics
  steadyStateConcentrationClosed : M.steadyStateConcentration

def PharmacokineticClosed (M : PharmacokineticModel) : Prop :=
  M.volumeOfDistribution > 0 ∧ M.clearance > 0 ∧ M.halfLife > 0 ∧ M.linearKinetics ∧ M.steadyStateConcentration

theorem pharmacokinetic_closed_from_evidence (M : PharmacokineticModel) (E : PharmacokineticEvidence M) : PharmacokineticClosed M := by
  exact And.intro E.volumeOfDistributionPositive (And.intro E.clearancePositive (And.intro E.halfLifePositive (And.intro E.linearKineticsClosed E.steadyStateConcentrationClosed)))

end BiomedicalDrugDeliveryCanonicalLaneLean
end HautevilleHouse