import System.Environment (getArgs)

import Dependencies
import Ergonomics (unique)

data Action
  = Command ([String] -> IO ()) [String]
  | Error String

depends_on :: [String] -> IO ()
depends_on pkgs = collect_revdeps pkgs >>= putStr . unlines . unique

parse_command :: [String] -> Action
parse_command [] = Error "no command given"
parse_command [c] = Error $ "missing argument(s) for command: " <> c
parse_command (c:args) =
  case c of
    "depends-on" -> Command depends_on args
    otherwise -> Error $ "unknown command: " <> c

main = do
  args <- getArgs
  case (parse_command args) of
    Command f args -> f args
    Error msg -> putStrLn $ "Error - " <> msg
