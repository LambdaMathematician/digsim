import Graphics.Gnuplot.Simple

myfun :: Double -> Double
myfun x
    | x < 1.4 = 1/x
    | x < 2 = 1/(x - 0.6)-0.1
    | x < 3 = 1/(x - 1.3)
    | otherwise = 1/(x - 1.3) + 0.5

domain = [1, 1.01..7]
yvalues = map myfun domain
xyvalues = zip domain yvalues
makePlot = plotList [] $ xyvalues

main = do
    makePlot