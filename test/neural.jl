net = init_network((2,2,2))

@assert abs(net.weights[1][1]) > 0.0001

# reset "random" weights so we get predictable results
net.weights = (
  [
    -0.42700000000000005 0.7829999999999999;
    0.8089999999999999 0.02299999999999991;
    -0.06999999999999995 0.24;
  ],
  [
    -0.7010000000000001 -0.783;
    -0.917 0.4099999999999999;
    -0.834 0.9550000000000001;
  ])

@assert train(net, [0.15,0.7],[0.1,0.9]) == 0.026566707596555807

# review data
@assert net.weights == (
[
  -0.42731782254634215 0.7832271291136619;
  0.8075168281170702 0.02405993586375571;
  -0.07211881697561397 0.24151419409107971;
],
[
  -0.7017660587853684 -0.7754389164772143;
  -0.9177482539018814 0.4173853473864355;
  -0.8352632670143251 0.9674685828154825;
])

@assert net.activation_nodes == (
  [0.15,0.7,1.0],
  [0.6064108194715588,0.5923165042674361,1.0],
  [0.14157761100099062,0.6732739153591676])

@assert net.deltas == (
  [-0.00847526790245606 0.006056776364318863 0.0],
  [-0.005053068057300355 0.049874331261929916]
)

@assert net.last_changes == (
  [
    -0.0012712901853684088 0.0009085164546478294;
    -0.005932687531719241 0.004239743455023204;
    -0.00847526790245606 0.006056776364318863;
  ],
  [
    -0.0030642351414730666 0.030244334091142907;
    -0.002993015607525591 0.02954138954574243;
    -0.005053068057300355 0.049874331261929916;
  ]
)
