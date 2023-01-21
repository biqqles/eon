import System.Environment (getArgs)
import Ergonomics (unique)
import Dependencies

main = getArgs
        >>= collect_revdeps
        >>= putStr.unlines.unique
