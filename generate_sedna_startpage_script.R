#!/usr/bin/Rscript
#' generate startpage from a sedna_startpage object
#'
sedna_startpage = readRDS('data/sedna_startpage.rds')
names(sedna_startpage)
sedna_startpage$title
verbose = TRUE
source('data-raw/create_sedna_startpage_layouts.R')

# logic for configuring layouts -------------------------------------------
if (sedna_startpage$layout_style == "simple") {
  if (verbose) message('processing simple layout')
  names(sedna_startpage$sections)
  if (verbose) message('simple layout includes title in title bar currently')
  # scripts here need to create the general HTML file styles for the html tags
  # and the header scripts with appropriate style.css file and also ensure
  # creation of the img directory. perhaps google logo on domain and scale
  # to a square object for image file and wget and rename the file
  if (verbose) message('identifying link sections')
  links = grep('_links', names(sedna_startpage$sections), value = TRUE)
  if (verbose) message('identifying search boxes')
  boxes = grep('_boxes', names(sedna_startpage$sections), value = TRUE)
  if (length(boxes) > 1) {
    message(paste0(
      'multiple boxes not supported with simple layout, choosing first item'))
    boxes = boxes[1]
  }

  links_html = '<div id="sections">\n\t\t<div class="section">\n\t\t'
  for (link in links) {
    if (verbose) message(paste('processing\t',link))
    links_html = paste(
      links_html,
      paste0('<div class="iconHeader">',link,'</div>'),
      '<div class="iconLinks">',
      sep = '\n\t\t\t'
    )
    links_html <- paste0(
      links_html,
      create_piclink(sedna_startpage$sections[[link]]),
      '\n\t\t\t</div>')

  }
  links_html <- paste(links_html,
                      '</div>', # should end the section id div,
                      '<div class="boxes">',
                      boxes, '</div>',
                      sep = '\n\t')
  print(links_html)

} else if (sedna_startpage$layout_style == 'trendyFart') {

} else if (sedna_startpage$layout_style == 'minimal') {

} else if (sedna_startpage$layout_style == 'vaporwave') {

} else {
  stop(paste0(
    'layout_style ', startpage$layout_style, ' not found.'))
}
write(links_html, file='start.html', ncolumns = 1)
