module Dependencies
  ( collect_revdeps
  ) where

import Data.List.Split (splitOn)
import System.Process (readProcess)
import Text.Regex.PCRE ((=~))

import Ergonomics

eopkg_info :: [String] -> IO [String]
eopkg_info pkgs = do
  info <- readProcess "eopkg" ("info" : pkgs) []
  return $ splitOn "\n\n" info

revdeps_of :: [String] -> IO [String]
revdeps_of pkgs = do
  infos <- eopkg_info pkgs
  return $
    infos
    |> filter is_remote
    |> map extract_revdeps
    |> concat
    |> filter (not . is_subpackage)
  where
    is_remote = (`contains` "Package found")
    is_subpackage pkg = (pkg `ends_with`) `any` ["dbginfo", "devel"]
    extract_revdeps = words . (=~ "[^:]+\\z")

collect_revdeps :: [String] -> IO [String]
collect_revdeps start = do
  revdeps <- revdeps_of start
  if null revdeps
    then return start
    else do
      tree <- collect_revdeps revdeps
      return (start ++ revdeps ++ tree)
