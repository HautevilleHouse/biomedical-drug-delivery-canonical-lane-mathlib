import HautevilleHouse.BiomedicalDrugDeliveryCanonicalLaneLean.PharmacokineticModel

namespace HautevilleHouse
namespace BiomedicalDrugDeliveryCanonicalLaneLean

structure FormulationComponent where
  name : String
  role : String
  concentration : ℝ
  solubility : ℝ

structure FormulationDependency where
  component : FormulationComponent
  dependsOn : List String
  interactionType : String
  synergistic : Bool
  antagonistic : Bool

structure FormulationDependencyEvidence (D : FormulationDependency) where
  dependencyCycleFree : Prop
  interactionsDocumented : D.synergistic ∨ D.antagonistic

def FormulationDependencyClosed (D : FormulationDependency) : Prop :=
  D.synergistic ∨ D.antagonistic

theorem formulation_dependency_closed (D : FormulationDependency) (E : FormulationDependencyEvidence D) : FormulationDependencyClosed D := by
  exact E.interactionsDocumented

end BiomedicalDrugDeliveryCanonicalLaneLean
end HautevilleHouse