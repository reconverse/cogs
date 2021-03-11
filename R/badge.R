#' Create url for status badge
#'
#' `badge_url` generates the URL for one of the 4 reconverse badges (concept,
#'   experimental, maturing or stable) using shields.io.
#'
#' @note Currently `badge_url` is hard-coded and hacky for this specific use
#'   case but could always be generalised (although at that stage you could just
#'   use either [badgr](https://github.com/matt-dray/badgr) or
#'   [badger](https://github.com/GuangchuangYu/badger).
#'
#' @param status The repository status. One of "concept", "experimental",
#'   "maturing" or "stable"
#'
#' @return url for the created badge
#'
#' @export
badge_url <- function(status = c("concept", "experimental", "maturing", "stable")) {
  # TODO -

  status <- match.arg(status)

  colour <- switch(
    status,
    concept = "e6e6e6",
    experimental = "276dc3",
    maturing = "7c6f91",
    stable = "ca225e"
  )

  base64image <- switch(
    status,
    concept = base64enc::base64encode(system.file("images/lifecycle_icons_concept.png", package = "cogs")),
    experimental = base64enc::base64encode(system.file("images/lifecycle_icons_exp.png", package = "cogs")),
    maturing = base64enc::base64encode(system.file("images/lifecycle_icons_maturing.png", package = "cogs")),
    stable = base64enc::base64encode(system.file("images/lifecycle_icons_stable.png", package = "cogs"))
  )

  paste0(
    "https://img.shields.io/badge/RECON-",
    status,
    "-",
    colour,
    "?style=flat&logo=data:image/png;base64,",
    base64image
  )

}





