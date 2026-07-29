import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalDrugDeliveryCanonicalLaneLean

structure DiagnosticTest where
  sensitivity : ℝ
  specificity : ℝ
  prevalence : ℝ
  positivePredictiveValue : ℝ
  negativePredictiveValue : ℝ
  testValid : Prop

def DiagnosticInferenceClosed (D : DiagnosticTest) : Prop :=
  D.testValid

theorem diagnostic_inference_closed (D : DiagnosticTest) (h : D.testValid) : DiagnosticInferenceClosed D := h

end BiomedicalDrugDeliveryCanonicalLaneLean
end HautevilleHouse