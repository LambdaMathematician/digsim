import Graphics.Gnuplot.Simple

dampingCoefficient = 8.88 :: Double
dt = 0.01 :: Double
gravity = 9.88 :: Double
mass = 1.0 :: Double
springCoefficient = 39.47 :: Double
tStop = 2.5 :: Double
xIC = 0.0 :: Double
xdIC = 0.0 :: Double

type State = (Double, Double, Double, Double)

newstate :: State -> State
newstate (t, x, xd, xdd) = (t', x', xd', xdd')
    where
        xdd' = -(springCoefficient * x + dampingCoefficient * xd)/mass - gravity
        x' = x + xd * dt
        xd' = xd + xdd' * dt
        t' = t + dt

mew = iterate newstate (xIC, xdIC, 0, 0)

stopCondition (t, a, b, c) = t < tStop

meow = takeWhile stopCondition mew

getTX (t, x, _, _) = (t,x)
getTXd (t, _, xd, _) = (t, xd)

getTXList = map getTX
getTXdList = map getTXd

makeXPlot = plotList [] $ getTXList meow
makeXdPlot = plotList [] $ getTXdList meow

main = do
    makeXPlot
    makeXdPlot