#!/usr/bin/Rscript
#' define a sedna object
#'
#' a sedna object contains all the information needed to comiple a report
#' these informations are all optional and can be used separately. some 
#' objects must have certain attributes and may or may not break or complete
#' improperly without error.
#'
#' @param sedna_object_name the official name of the object, will define to 
#' whatever the object name is. Use this to customize the official reports of
#' title.
#' @param sedna_author the author you want displayed. will default to system user
#" @sedna_company the default name for the machine you are using
#' @param render_type the type of object or objects to be rendered
#' @param sections a character vector of sections to be included. refer to details
#' for the specific default values for each type of render
#' @param style_template the style template you want to make. 
#'
#' @details this function called without a defined \code{sedna_object_name} will
#' generate all of the default possibilities. Providing details to this function
#' will really unlock a lot of the customization with the software.
#'
#' @export define_sedna_object
define_sedna_object <- function(
   sedna_object_name = Sys.Date(),
   sedna_author = Sys.info()[['user']],
   sedna_company = Sys.inf()[['machine']],
   render_type = c('html','latex','shiny','rmarkdown','script'),
   style_template = c('cv','resume','startpage','raw','memo','article')


                                ) {
   # create the sedna object
   sedna_object = list(
                       name = sedna_object_name,
                       author = sedna_author,
                       type = render_type,
                       template = style_template
                       )
   print(sedna_object)
   if ('html' %in% tolower(render_type)) {
      style = 'style.css' # later style name of template
      lines = c('<html>','<head>','</head>','<body>','</body>','</html>')
   }
}

message('default')
define_sedna_object()
message("startpage")
define_sedna_object("goldcase","moonvest","sedna",'html','startpage')





