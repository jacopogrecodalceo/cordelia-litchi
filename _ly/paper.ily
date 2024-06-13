\paper {

	%%%%%%%%%%%%%%%%%%%
	% TITLE
	%%%%%%%%%%%%%%%%%%%	
	bookTitleMarkup = \markup {
		\override #'(baseline-skip . 3.5)
		\column {
			\fill-line { \fromproperty #'header:dedication }
			\override #'(baseline-skip . 1.25)
			\column {
				\fill-line {
					\huge \larger \larger \bold \fontsize #4
					\fromproperty #'header:title
				}
				\fill-line {
					\fromproperty #'header:subtitle
				}
				\fill-line {
					\fromproperty #'header:composer
				}
				\fill-line {
					\fromproperty #'header:date
				}
				\vspace #.5
				\fill-line {
					\fromproperty #'header:poet
					{ \large \bold \fromproperty #'header:instrument }
				}
				\fill-line {
					\fromproperty #'header:meter
					\fromproperty #'header:arranger
				}
			}
		}
	}

	%%%%%%%%%%%%%%%%%%%
	% INDENT
	%%%%%%%%%%%%%%%%%%%	
	indent = #15

	%%%%%%%%%%%%%%%%%%%
	% SYSTEMs
	%%%%%%%%%%%%%%%%%%%	
	system-system-spacing =
	#'((basic-distance . 3)
		(minimum-distance . 3)
		(padding . 3)
		(stretchability . 5))
	%annotate-spacing = ##t
	%system-count = #4
	%system-separator-markup = \slashSeparator

	%%%%%%%%%%%%%%%%%%%
	% PAPER SIZE
	%%%%%%%%%%%%%%%%%%%	
	#(set-paper-size "a4landscape")

	%%%%%%%%%%%%%%%%%%%
	% MARGINs
	%%%%%%%%%%%%%%%%%%%	
	left-margin = 20
	right-margin = 20
	%bottom-margin = 10
	top-margin = 11

	%%%%%%%%%%%%%%%%%%%
	% INDENT
	%%%%%%%%%%%%%%%%%%%	
	ragged-last-bottom = ##t
	ragged-last = ##t
	%line-width = #120

	%%%%%%%%%%%%%%%%%%%
	% PAGE NUMBER
	%%%%%%%%%%%%%%%%%%%	
	%print-page-number = ##f
	%page-breaking = #ly:one-line-breaking

	%%%%%%%%%%%%%%%%%%%
	% FONTs
	%%%%%%%%%%%%%%%%%%%	
	#(define fonts
		 (set-global-fonts
		  #:roman "Hoefler Text"
		  #:music "lilyboulez"
		  ))
}