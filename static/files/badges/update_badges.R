library(webshot2)
library(rsvg)

pubs <- read.csv("static/files/badges/pubs.csv", stringsAsFactors = FALSE)
pubs$doi <- trimws(pubs$doi)   # strips stray tabs/spaces around DOIs
dir.create("static/files/badges/altmetric",  showWarnings = FALSE, recursive = TRUE)
dir.create("static/files/badges/dimensions", showWarnings = FALSE, recursive = TRUE)

make_page <- function(doi) {
  sprintf('<!DOCTYPE html><html><body style="margin:0;background:white">
<div id="dim" style="display:inline-block;padding:50px">
  <span class="__dimensions_badge_embed__" data-doi="%s"
        data-hide-zero-citations="true"></span>
</div>
<div id="alt" style="display:inline-block;padding:20px">
  <div class="altmetric-embed" data-badge-type="medium-donut" data-doi="%s"
       data-condensed="true" data-hide-no-mentions="true"></div>
</div>
<script src="https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js"></script>
<script async src="https://badge.dimensions.ai/badge.js" charset="utf-8"></script>
</body></html>', doi, doi)
}

grab <- function(page, selector, out) {
  out <- normalizePath(out, mustWork = FALSE)   # full absolute path

  shot <- tryCatch(
    suppressWarnings(webshot(page, out, selector = selector, delay = 4, zoom = 3, expand = 3)),
    error = function(e) { message("  Error: ", conditionMessage(e)); NULL })

  # Backup: if webshot wrote elsewhere, copy it to where we want it
  written <- if (!is.null(shot)) as.character(shot) else ""
  if (!file.exists(out) && nzchar(written) && file.exists(written)) {
    file.copy(written, out, overwrite = TRUE)
  }

  good <- file.exists(out) && isTRUE(file.size(out) > 200)
  if (!good && file.exists(out)) file.remove(out)
  message("  ", basename(dirname(out)), ": ", if (good) "saved" else "no badge")
  invisible(good)
}

for(i in seq_len(nrow(pubs))){
  key <- pubs$key[i]
  message("Processing ", key)

  tryCatch({
    page <- tempfile(fileext = ".html")
    writeLines(make_page(pubs$doi[i]), page)

    grab(page, "#alt", file.path("static/files/badges/altmetric",  paste0(key, ".png")))
    grab(page, "#dim", file.path("static/files/badges/dimensions", paste0(key, ".png")))
  }, error = function(e) message("  Skipped ", key, ": ", conditionMessage(e)))
}
