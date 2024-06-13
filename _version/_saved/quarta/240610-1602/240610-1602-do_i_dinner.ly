\version "2.24.3"
\language "english"

\header {
title = "quarta"
composer = "jacopo greco d'alceo"
tagline = "jacopo greco d'alceo"
}

\include "./paper.ily"
\include "./layout.ily"
\include "./variables.ily"


\score
{
	% OPEN_BRACKETS:
	\new Score
	<<
		% OPEN_BRACKETS:
		\new Staff
		{
			% OPEN_BRACKETS:
			\accidentalStyle neo-modern
			\new Voice
			{
				% OPENING:
				% COMMANDS:
				\time 4/4
				r1
				r1
				r1
				r1
				r8
				bf''2.. \mp
				r8
				bf''4
				f''4
				ef''4
				r8
				c''4
				bf''2
				f''8.
				r16
				r8
				bf''16
				r8.
				ef''16
				c''16
				bf''4.
				r16
				ef''16
				cs''1
				r8
				f''2.. (
				c''8 )
				r4
				r8
				d''4 \ppp
				r4
				c''8. (
				f''16~
				f''8.
				ef''16~
				ef''4..
				d''16 )
				r4..
				ef''16
				d''8
				c''16
				r16
				ef''16
				d''8.
				r1
				c''8
				r2..
				c''4
				r8
				r4
				ef''4
				c''8
				c''2 ^\markup { più buio }
				r8.
				f''16
				ef''4
				r16
				r16
				f''4.
				ef''8
				c''16
				bf''16
				f''16
				r8.
				r1
				c''2..
				r8
				c''8
				r8
				\tuplet 3/2 {
				ef''4 %{ ^\markup {
				    \italic \teeny \column {
				        \line { molto libero, ma }
				        \line { tanto dolce } 
				    }
				}  %}(
				b''4 \pp )
				r4
				}
				r4 \fermata
				r2
				f''8.
				r4
				d''16
				r4.
				f''8.
				r16
				d''8
				r16
				f''16
				ef''16
				d''16
				c''1
				r8
				bf''2..
				c''4 (
				bf''8 )
				r8
				ef''4
				c''4
				c''8
				r8
				bf''8.
				f''2
				r16
				c''16
				r16
				r4.
				ef''16
				c''8.
				bf''16
				f''16
				ef''8
				c''1
				c''8
				r2..
				c''8
				f''8
				r4
				d''4
				c''4
				c''16
				f''8.
				ef''4
				d''2
				r16
				r8.
				ef''16
				d''8
				r4.
				r16
				ef''16
				d''16
				c''1
				c''8
				bf''2..
				r8
				r4
				f''4
				ef''8
				r4
				r8.
				bf''2
				r4
				ef''16
				c''16
				bf''4.
				f''16
				ef''16
				c''8.
				r16
				r8
				ef''16
				c''1
				r2..
				r8
				r4
				r8
				ef''8
				d''4
				r4
				c''16
				r2
				ef''4
				r8.
				c''8.
				f''16
				ef''4.
				d''16
				c''16
				f''16
				ef''16
				d''8
				r1
			% CLOSE_BRACKETS:
			}
		% CLOSE_BRACKETS:
		}

		% OPEN_BRACKETS:
		\new Staff
		{
			% OPEN_BRACKETS:
			\accidentalStyle neo-modern
			\new Voice 
			{
				% OPENING:
				% COMMANDS:
				\time 4/4
				R1*2
				r4
				a'2. \pp \< (
				\after 2 \! bf'2... \mf \> ) \glissando a'16
			% CLOSE_BRACKETS:
			}
		% CLOSE_BRACKETS:
		}

		% OPEN_BRACKETS:
		\new PianoStaff
		<<
			% OPEN_BRACKETS:
			\context Staff = "treble"
			{
				% OPEN_BRACKETS:
				\accidentalStyle neo-modern
				\new Voice
				{
					\clef "treble"
					<c' f'>2.. ^>
					<f' bf'>8
					<c'>8.
					<d'' ~ >16
					d''16
					r16
					<c' f' c''>4
					<c'>8.
					r16					
					<f'>8 \f ( \startTextSpan
					<bf>4 )
					<c' a' f''>8. \arpeggio
					r16
					\after 4 \stopTextSpan <c' f' bf'>2 
					<ef'>4.
					<bf>16
					<ef'>16
					<bf>8.
					<d' bf'>8
					<bf c'' f''>16
					<bf>16
					<ef'>16
					<bf>1
					r8
					<bf g'>2..
					<d' g'>4
					<bf d''>4
					<c' f'>4
					<d'>8
					<bf ~ g'~>8
					<bf g'>8.
					<c'>2
					<bf g'>16
					r4
					<a'>8.
					<bf e''>16
					<bf a'>16
					<c' f' b'>16
					<bf a'>8
					r16
					<f'>4.
					<e' bf'>16
					<ef'>1
					<c'>8
					<bf' a''>2..
					<f'>4
					<d''>4
					\tuplet 3/2 {
					<f' c''>8
					<bf g' c''>8
					<f' c''>8
					}
					<bf>4
					<c' a'>8.
					<bf~ c''~>8
					<bf c''>4.
					r16
					<c' f'>4
					<bf>16
					<bf'>16
					<c' f'>16
					bf'16~
					bf'4
					r16
					bf8.
					<ef' c'' g''>16
					<c' f' bf'>16
					<f' bf'>8
					<ef'>1
					<c' f'>8
					r2..
					<d'>4
					<d'>4
					<bf>8
					r4
					<d' bf'>8
					r2
					<d' e''>4
					<d' d''>16
					<bf a'>8.
					<bf a'>8.
					<d' c''>16
					<bf bf'>16
					<f'>4.
					<bf g'>16
					<d' g' c''>8
					<d' c''>16
					<c' f'>16
					<bf>1
					<bf>8
					<bf>2..
					<c' bf'>8
					<c' f''>4
					<ef' bf'>4
					<c''>4
					<c' bf'>8
					<bf'>2
					<c'>16
					<c' f'>4
					<ef' d''>8.
					<c' bf'>16
					<bf a''>16
					<c' bf'>16
					<bf>8.
					<c'>8
					<c' f' g''>16
					<bf'>16
					<c'>4.
					<bf>1
					<ef'>2..
					<bf>8
					<d'>4
					<ef'>8
					<bf>4
					<a'>8
					<d' a'>4
					<c'>2
					<bf a' e''>16
					<ef'>4
					<d' a'>8.
					<c' g'>16
					<d' g'>16
					<c' g'>16
					<c' b'>4.
					r16
					<c' f'>8.
					r8
					<f' b'>16
					<c'>1
					<f'>2..
					<c'>8
					<bf>4
					<bf'>8
					<ef'>4
					<bf>8
					<bf>4
					<bf bf'>2
					<ef' d''>16
					<d'>8.
					<c' f' c''>4
					<bf>4.
					<bf f''>16
					<bf d''>16
					r8
					<bf>8.
					<d'>16
					<f' bf'>16
					<c' f'>16
					<bf>1
					<bf a'>2..
					<d'>8
					<bf>4
					<c'>4
					<f'>8
					<f' b'>4
					<bf>8
					<f'>2
					<a' d''>8.
					<bf a'>16
					r4
					<c' f'>16
					<c'>8
					<bf>4.
					<d'>16
					r16
					<f'>16
					<bf c''>8.
					<d'>16
					<d'>1
				% CLOSE_BRACKETS:
				}
			% CLOSE_BRACKETS:
			}
			% OPEN_BRACKETS:
			\context Staff = "bass"
			{
				% OPEN_BRACKETS:
				\accidentalStyle neo-modern
				\new Voice
				{
					\clef "bass"
					<b,, cs>2.. ^> \f
					<bf,, af,>8 \p
					<cs, bf, ef>4
					<ef, ef af>8
					<bf,,>4
					<af,, fs, ef>8.
					r16
					<bf,, fs, cs>8
					<bf,, fs, cs>4
					<bf,, ef>8.
					<ef, af, cs g>16
					<cs,>2
					<bf,, af, ef>4.
					<cs, c f>16
					<f, bf, ef>16
					<cs, fs, f>8.
					<cs, fs,>8
					<f>16
					<bf,, af, ef>16
					<ef,, cs, af,>16
					<ef, af, ef>1
					<ef,, b,, bf, a>8
					<g, c>2..
					<bf,, af,>4
					<f,, cs,>4
					<f, d>4
					<fs, c f>8
					<af,, g,>8
					<bf,, c>8.
					<f,, b,, bf,>2
					<bf,, c>16
					<af,, f, d>4
					<cs, bf, af>8.
					<cs, d>16
					<cs, bf,>16
					<af,>16
					<bf,, fs,>8
					<e,, ef, c f>16
					<bf,, fs, d>4.
					<af,, ef,>16
					<ef,, bf,, af,>1
					<cs, bf, ef>8
					<cs,, af>2..
					<af,, cs, af,>4
					<f, ef af>4
					<bf,, fs,>8
					<cs,>8
					<cs, bf, ef>4
					<b,, fs,>8.
					<ef,~ f~>8
					<ef, f>4.
					<af,, cs, bf, af>16
					<f, cs>4
					<bf,, af, ef>16
					<ef, af,>16
					<ef, cs>16
					r16
					r4
					r16
					<ef, af, cs>8.
					<bf,,>16
					<fs,>16
					<fs,, f,>8
					<f, bf, ef>1
					<ef, d>8
					<af,, af, d af>2..
					<fs,, f, ef>4
					<ef, af, ef>4
					<bf,, ef, d>8
					<fs,, af, d g>4
					<fs,, ef,>8
					<bf,, ef, af, d>2
					<ef, ef>4
					<b,, f>16
					<bf,, fs,>8.
					<cs, bf,>8.
					<cs, f>16
					<af,, f,>16
					<bf,, af, d>4.
					<bf,, g,>16
					<cs,>8
					<c, f>16
					<cs, g,>16
					<c, bf, f>1
					<f, bf, ef>8
					<bf,, af, ef>2..
					<cs, af,>8
					<af,, cs>4
					<fs,, ef,>4
					<af,, fs, g>4
					<fs,, af,>8
					<cs,, ef, af>2
					<cs, bf, ef>16
					<ef, af,>4
					<bf,, ef>8.
					<af,, fs,>16
					<af, ef>16
					<e,, ef,>16
					<bf,, fs, cs>8.
					<cs, af, ef>8
					<c>16
					<fs,, cs, g>16
					<bf,, af, ef>4.
					<f, bf, ef>1
					<bf,, ef, c>2..
					<bf,, fs, d>8
					<bf,, af, ef>4
					<c, bf, ef>8
					<fs,, f, c>4
					<cs, bf, a>8
					<af,, fs,>4
					<af,, g, cs>2
					<ef,>16
					<f,, ef, bf,>4
					<b,, bf,>8.
					<fs, c>16
					<cs, af,>16
					<c, fs,>16
					<cs,, fs,>4.
					<bf,,, af,, bf, af>16
					<ef, d>8.
					<cs, af, d g>8
					<cs,, b,,>16
					<c, af, f>1
					<bf,, ef, af,>2..
					<ef, af, ef>8
					<cs, af, f>4
					<bf,, af, af>8
					<f, bf, ef>4
					<bf,, af, ef>8
					<ef,, cs, ef>4
					<ef, af,>2
					<ef, ef>16
					<ef, af, ef>8.
					<cs,>4
					<bf,, af, ef>4.
					<bf,, ef>16
					<cs, ef>16
					<b,, af, cs g>8
					<bf,, af, ef>8.
					<cs, af, ef>16
					<af,, fs,>16
					<cs, c>16
					<ef, bf, ef>1
					<fs,, f,>2..
					<cs, af, d>8
					<bf,, fs, d>4
					<af, d g>4
					<bf,, fs, d>8
					<ef, af,>4
					<bf,, f, ef>8
					<bf,, af, d>2
					<f, af>8.
					<f, bf,>16
					<fs,, b,, f, c>4
					<ef, d>16
					<f,, ef, cs>8
					<g, c f>4.
					<cs, af, f>16
					<cs, af, d g>16
					<bf,, af, d>16
					<bf,, f,>8.
					<ef, af, d>16
					<ef, af, f>1
				% CLOSE_BRACKETS:
				}
			% CLOSE_BRACKETS:
			}
		% CLOSE_BRACKETS:
		>>
	% CLOSE_BRACKETS:
	>>
	\layout {}
	\midi{}
}
