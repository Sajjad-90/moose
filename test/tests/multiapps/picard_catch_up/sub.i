[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 2
  ny = 2
[]

[Variables]
  [./v]
  [../]
[]

[AuxVariables]
  [./u]
  [../]
[]

[Kernels]
  [./diff_v]
    type = Diffusion
    variable = v
  [../]
  [./force_v]
    type = CoupledForce
    variable = v
    v = u
  [../]
  [./nan]
    type = NanAtCountKernel
    variable = v
    count = 2918
  [../]
[]

[BCs]
  [./left_v]
    type = DirichletBC
    variable = v
    boundary = left
    value = 1
  [../]
  [./right_v]
    type = FunctionDirichletBC
    variable = v
    boundary = right
    value = 0
    function = 't + 1'
  [../]
[]

[Executioner]
  # Preconditioned JFNK (default)
  type = Transient
  num_steps = 2
  dt = 0.1
  solve_type = PJFNK
  petsc_options_iname = '-pc_type -pc_hypre_type'
  petsc_options_value = 'hypre boomeramg'
  nl_abs_tol = 1e-10
[]

[Outputs]
  exodus = true
[]
