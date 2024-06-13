\layout {
	\context {
		\Score
		%%%%%%%%%%%%%%%%%%%
		% TIME SIGNATURE
		%%%%%%%%%%%%%%%%%%%
		%\override TimeSignature.stencil = #format-time-sig-note
		%\override TimeSignature.font-name = "Longinus"
		%\override TimeSignature.font-size = #2
		%\override TimeSignature.transparent = ##t
		%\override TimeSignature.stencil = ##f

		%%%%%%%%%%%%%%%%%%%
		% BAR NUMBER
		%%%%%%%%%%%%%%%%%%%
		\override BarNumber.font-name = "Longinus" % Replace with the actual font name
		\override BarNumber.font-size = #-5 % Adjust the font size as needed
		\override BarNumber.stencil = #(make-stencil-boxer 0.025 0.25 ly:text-interface::print)
		\override BarNumber.break-visibility = ##(#f #t #t)
		\override BarNumber.self-alignment-X = #CENTER
		%\override BarNumber.stencil = ##f

		%%%%%%%%%%%%%%%%%%%
		% DYNAMICs
		%%%%%%%%%%%%%%%%%%%
        \override DynamicText.font-size = #-3 % Adjust the font size value as needed

		%%%%%%%%%%%%%%%%%%%
		% HAIRPINs
		%%%%%%%%%%%%%%%%%%%
        \override Hairpin.thickness = #1.5
        \override Hairpin.height = #.5
        \override Hairpin.bound-padding = #.5

		%%%%%%%%%%%%%%%%%%%
		% REHEARSAL MARK
		%%%%%%%%%%%%%%%%%%%		
		\override RehearsalMark.stencil = #(make-stencil-boxer 0.025 0.5 ly:text-interface::print)
		\override RehearsalMark.font-size = #5
		\override RehearsalMark.self-alignment-X  = #-1

		%%%%%%%%%%%%%%%%%%%
		% STEM
		%%%%%%%%%%%%%%%%%%%
		%\override Stem.stemlet-length = 0.75
		%\override Stem.thickness = #0.5
		\override Stem.details.beamed-lengths = #'(7)
		\override Stem.details.lengths = #'(7)
		%\override Stem.direction = #up
		%\override Stem.stencil = ##f

		%%%%%%%%%%%%%%%%%%%
		% BEAMs & FLAGs
		%%%%%%%%%%%%%%%%%%%
		%\override Beam.stencil = ##f
		%\override Flag.stencil = ##f

		%%%%%%%%%%%%%%%%%%%
		% RESTs
		%%%%%%%%%%%%%%%%%%%
		%\override Rest.stencil = ##f

		%%%%%%%%%%%%%%%%%%%
		% BARLINEs
		%%%%%%%%%%%%%%%%%%%
		%\override BarLine.stencil = ##f

		%%%%%%%%%%%%%%%%%%%
		% SPACING
		%%%%%%%%%%%%%%%%%%%
		%\override SpacingSpanner.strict-note-spacing = ##t
		%\override SpanBar.stencil = ##f

		%%%%%%%%%%%%%%%%%%%
		% PROPORTIONAL DURATION
		%%%%%%%%%%%%%%%%%%%
		% proportionalNotationDuration = #(ly:make-moment 1 16)

	}
}
