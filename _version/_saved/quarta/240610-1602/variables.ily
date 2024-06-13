start_custom_span =
#(define-music-function
	(name)
	(string?)
	#{
		\once \override TextSpanner.bound-details.left.text = \markup { \normal-text $name }
		\once \override TextSpanner.bound-details.right.text = \markup { \draw-line #'(0 . -.5) }
		\once \override TextSpanner.bound-details.left-broken.text = ##f
		\once \override TextSpanner.bound-details.right-broken.text = ##f
		\once \override TextSpanner.dash-period = #1
		\once \override TextSpanner.dash-fraction = #.25
		\once \override TextSpanner.thickness = #2
		\once \override TextSpanner.bound-details.right.padding = #-1
		\once \override TextSpanner.bound-details.right.padding = #-1
		\startTextSpan
	#})