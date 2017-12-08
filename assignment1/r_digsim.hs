import Graphics.Gnuplot.Simple

dampingCoefficient = 8.88 :: Rational
dt = 0.01 :: Rational
gravity = 9.88 :: Rational
mass = 1.0 :: Rational
springCoefficient = 39.47 :: Rational
tStop = 2.5 :: Rational
xIC = 0.0 :: Rational
xdIC = 0.0 :: Rational

type State = (Rational, Rational, Rational, Rational)

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

mapTuple :: (a -> b) -> (a , a) -> (b, b)
mapTuple f (a1, a2) = (f a1, f a2)

main = do
    makeXPlot
    makeXdPlot
    print $ map (mapTuple fromRational) $ getTXList meow