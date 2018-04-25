library(DiagrammeR)

grViz("
	digraph causal {
      
      # Nodes
      node [shape = plaintext]
      A [label = 'Entrepreneurial training (A)']
      W [label = 'Baseline covariates (W)']
      Y [label = 'Business creation (Y)']
      UA [label = 'UA']
      UW [label = 'UW']
      UY [label = 'UY']
      
      # Edges
      edge [color = black,
      arrowhead = vee]
      rankdir = LR
      A->Y
      W->Y
      UA->A
      UY->Y
      UW->W

      #Edges2
      edge [color=black,
      arrowhead = vee,
      style = dotted]
      UW->UY [dir='both']

      # Graph
      graph [overlap = true, fontsize = 10]
      }")
