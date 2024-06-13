\version "2.24.3"
\language "english"
\header {
title = \markup "my heavy head"
composer = "jacopo greco d'alceo"
tagline = "jacopo greco d'alceo"
}
\include "/Users/j/Documents/CLI/cordelia-litchi/_ly/paper.ily"
\include "/Users/j/Documents/CLI/cordelia-litchi/_ly/layout.ily"
\score
{
    % OPEN_BRACKETS:
    \new Score
    <<
        % OPEN_BRACKETS:
        \new Staff
        {
            % OPEN_BRACKETS:
            \new Voice
            {
                % OPENING:
                % COMMANDS:
                \time 4/4
                g'8
                % AFTER:
                % ARTICULATIONS:
                \f
                d'''2..
                g'8
                d'''2.
                ef''8
                g'4
                d'''16
                ef''8.
                d''2
                g'8.
                d'''16
                ef''4.
                d''16
                g'16
                d'''16
                ef''16
                d''8
                gs'8
                ef'''2..
                gs'8
                ef'''8
                f''2.
                gs'16
                ef'''4
                f''2
                d''8.
                gs'8.
                ef'''16
                f''8
                d''16
                gs'16
                ef'''4.
                f''16
                d''16
                g'2..
                c'''8
                g'8
                c'''2.
                f''8
                g'8.
                c'''2
                f''16
                ef''4
                g'16
                c'''8
                f''16
                ef''16
                g'8.
                c'''16
                f''4.
                ef''16
                g'8
                c''2..
                g'8
                c''2.
                f''8
                g'8.
                c''16
                f''2
                ef''4
                g'8
                c''16
                f''16
                ef''16
                g'16
                c''8.
                f''16
                ef''4.
                g'8
                d''2..
                g'2.
                d''8
                fs''8
                g'4
                d''8.
                fs''2
                e''16
                g'16
                d''4.
                fs''16
                e''8.
                g'16
                d''16
                fs''8
                e''16
                gs'2..
                ef'''8
                gs'2.
                ef'''8
                f''8
                gs'2
                ef'''8.
                f''4
                d''16
                gs'16
                ef'''16
                f''8.
                d''16
                gs'16
                ef'''16
                f''8
                d''4.
                g'8
                c'''2..
                g'2.
                c'''8
                f''8
                g'8.
                c'''2
                f''4
                ef''16
                g'4.
                c'''16
                f''8.
                ef''16
                g'16
                c'''8
                f''16
                ef''16
                g'2..
                d''8
                g'2.
                d''8
                fs''8
                g'4
                d''16
                fs''2
                e''8.
                g'16
                d''16
                fs''16
                e''8.
                g'8
                d''4.
                fs''16
                e''16
                g'2..
                c''8
                g'2.
                c''8
                fs''8
                g'4
                c''16
                fs''2
                e''8.
                g'16
                c''4.
                fs''16
                e''8.
                g'16
                c''16
                fs''16
                e''8
                g'8
                c''2..
                g'2.
                c''8
                fs''8
                g'16
                c''2
                fs''8.
                e''4
                g'16
                c''16
                fs''16
                e''4.
                g'8
                c''16
                fs''8.
                e''16
                g'2..
                c''8
                g'8
                c''8
                f''2.
                g'2
                c''4
                f''8.
                ef''16
                g'16
                c''16
                f''16
                ef''8
                g'8.
                c''16
                f''4.
                ef''16
                g'8
                d'''2..
                g'8
                d'''8
                ef''2.
                g'4
                d'''16
                ef''8.
                d''2
                g'16
                d'''16
                ef''8
                d''16
                g'16
                d'''4.
                ef''8.
                d''16
                g'8
                d'''2..
                g'2.
                d'''8
                ef''8
                g'4
                d'''16
                ef''2
                d''8.
                g'8
                d'''16
                ef''16
                d''16
                g'8.
                d'''4.
                ef''16
                d''16
                gs'8
                ef'''2..
                gs'2.
                ef'''8
                f''8
                gs'8.
                ef'''16
                f''2
                d''4
                gs'16
                ef'''16
                f''16
                d''4.
                gs'8.
                ef'''8
                f''16
                d''16
                g'2..
                c'''8
                g'8
                c'''8
                f''2.
                g'2
                c'''16
                f''4
                ef''8.
                g'4.
                c'''16
                f''16
                ef''16
                g'8.
                c'''8
                f''16
                ef''16
                g'8
                c''2..
                g'2.
                c''8
                f''8
                g'2
                c''4
                f''16
                ef''8.
                g'16
                c''16
                f''8
                ef''16
                g'8.
                c''16
                f''4.
                ef''16
                g'8
                d''2..
                g'2.
                d''8
                fs''8
                g'16
                d''8.
                fs''2
                e''4
                g'8.
                d''16
                fs''16
                e''4.
                g'16
                d''16
                fs''16
                e''8
                gs'8
                ef'''2..
                gs'8
                ef'''8
                f''2.
                gs'8.
                ef'''16
                f''4
                d''2
                gs'8
                ef'''16
                f''8.
                d''16
                gs'16
                ef'''16
                f''16
                d''4.
                g'2..
                c'''8
                g'8
                c'''2.
                f''8
                g'8.
                c'''4
                f''2
                ef''16
                g'4.
                c'''16
                f''8
                ef''16
                g'16
                c'''16
                f''16
                ef''8.
                g'2..
                d''8
                g'2.
                d''8
                fs''8
                g'16
                d''8.
                fs''2
                e''4
                g'4.
                d''16
                fs''8.
                e''16
                g'16
                d''8
                fs''16
                e''16
                g'8
                c''2..
                g'2.
                c''8
                fs''8
                g'4
                c''2
                fs''16
                e''8.
                g'16
                c''16
                fs''8.
                e''16
                g'4.
                c''8
                fs''16
                e''16
                g'8
                c''2..
                g'8
                c''8
                fs''2.
                g'2
                c''4
                fs''16
                e''8.
                g'8
                c''16
                fs''4.
                e''16
                g'16
                c''16
                fs''8.
                e''16
                g'2..
                c''8
                g'8
                c''2.
                f''8
                g'8.
                c''16
                f''4
                ef''2
                g'8
                c''16
                f''16
                ef''16
                g'16
                c''4.
                f''16
                ef''8.
                g'8
                d'''2..
                g'8
                d'''2.
                ef''8
                g'8.
                d'''4
                ef''2
                d''16
                g'8
                d'''16
                ef''16
                d''16
                g'16
                d'''8.
                ef''4.
                d''16
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
                \new Voice
                {
                    <cs' fs'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf g' c'''>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'''>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs' cs''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf af''>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf g' cs''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' g' cs''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf g' f''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' d''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b b'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' g'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' cs'' b''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b af''>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf e''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs' b'>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' g'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs''>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' af' ef''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' a'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'' g'' cs'''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f' ef''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' c''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef'>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef' af' g''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' af''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' d''>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' bf' ef''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' bf' ef''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' g'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b g' c''>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f' bf'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' fs'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf g'>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' af'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf g'>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f' bf'>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' g' d''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' b'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d'>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' af'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' fs'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' af'>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' ef''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e' f''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' g'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs'>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a' d'' b''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef' cs''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' fs'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f' fs''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f'>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf cs''>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' g'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' af' ef''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b'>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' fs' cs''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf bf'>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef' a''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f'>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' fs' b' fs''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef' af' ef''>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' g''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' fs'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf b'>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b c''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf g'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' g' ef''>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' af'>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf d''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' af'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' fs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' b'>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef' af'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf af'>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' bf'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef''>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' fs'>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' b'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef' af'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' af'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf' ef''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f' b'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef'>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' fs'>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs''>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e' b'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' fs'>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' g'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' fs' f''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' g'>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d'>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f' bf' e''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' fs' b'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' cs''>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' fs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' g'>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' af'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' cs''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e' b' fs'' b''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef' d''>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf bf'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' fs' b'>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e' cs''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' g'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' af'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b cs'' g''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf d''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' fs' b'>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d'>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' g'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' d''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b c'''>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf af' cs''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' cs''>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' bf'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs' cs''>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf' ef''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf g' c''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' g' cs''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' af' ef''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b g'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f' ef''>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' af' d''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f' bf''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f' e''>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' bf'>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' g'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' af' e'' b''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf g' cs''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs' c''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' af' d'' bf''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' fs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf b''>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' g' c'' fs''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' af' ef''>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e' a'>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a' d''>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' bf' ef''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' c''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' fs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' c''>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f'>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef' e''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' af'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' g'>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' fs' c''>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf ef''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f' b'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' fs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' bf'>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' g'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs' c''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f'>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e' a'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf ef''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' g'>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f' bf'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef''>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e' a'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' g'>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f' bf'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b cs''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b ef''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e' g''>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs'>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b d''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b c'' bf''>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' e''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' g' cs''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' fs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' ef''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' g' d''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' cs''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' fs'>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' bf'>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a' d''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d'>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef' e''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d''>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf b'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' fs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' b'>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf bf' a''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b g' c''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' af'>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b b'>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs''>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' bf'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' c''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf g'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' af' ef''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e' bf'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' fs' b'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f' bf'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs' c''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' fs'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b af' d''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' g' cs''>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' b'>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b fs'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' fs' b'>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs''>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' d''>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' f''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f' bf'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b ef''>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs'>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' g'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f'>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' fs'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' fs'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' b'>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b d''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' b'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b g'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef' d''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' b'>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf a'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' g' c''>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a''>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf d''>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c' f'>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' a'>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c'>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf g' f'' b''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d' d''>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs' af'>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                % CLOSE_BRACKETS:
                }
            % CLOSE_BRACKETS:
            }
            % OPEN_BRACKETS:
            \context Staff = "bass"
            {
                % OPEN_BRACKETS:
                \new Voice
                {
                    % OPENING:
                    % COMMANDS:
                    \clef "bass"
                    <bf,, e,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, e, fs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g,, af, d>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, af, cs>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a, f>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, bf, ef>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, ef>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs, fs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, c f>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, c>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, fs, d>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e,,, c,, af,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef,, cs, b,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, af, cs>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, g, fs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, b, e>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, af,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c f>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, ef>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af,>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, b,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d,, e, e>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, bf,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, a, e>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, f>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, f, e>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, bf, ef>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf, ef>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, ef>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, bf, ef>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, b, e>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, f, b, g>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b,, af,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, bf,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g,>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs,, ef, bf,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af,, e, cs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs, cs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, c>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs, c>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, bf, e>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, g, d>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, f, c>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af,, f, c g>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, b,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, c>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, e, ef>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, c f>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, af,>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, a, ef>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, g, cs>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, fs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, a, ef af>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, a, d>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b,, g, c>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, b, e>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, b, f>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, af, e>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, ef,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, f, e a>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, cs>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f,, ef, fs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, bf,>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, bf, ef>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, d, a,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, f>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, fs, e>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f,, e, c>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, bf, e>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, d>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, e, c>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, cs fs>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, b,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g,, c>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, e>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, c>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af, d>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, f>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af,, ef,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af, d>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, g, fs>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, g, c>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, d af>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, f, a>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, g, c>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, a,>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af,, d, cs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf, ef>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g,, ef, bf,>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, bf, e>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d,>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, bf, ef>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, cs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, ef>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, fs, ef>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, a, e>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, a,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, bf, af>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, e a>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, af, a>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, g, c>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, g,>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, bf, g>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, bf, e>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, fs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs, cs>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, bf,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b,,>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, b,>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, c fs>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, bf, e a>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, e>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, b,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, g,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, g>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, b,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, g, a>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, b, e a>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, b,>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, g, cs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, a,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, ef af>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b,, cs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, b,>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, g,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, c fs>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, bf, ef>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, a,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, f,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, a, ef>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, b, e a>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b,, f, c>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, bf, g>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, a>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, b, e>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, af, e a>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, a, e>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, fs, cs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, g,>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, g, g>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g,, cs, e>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, a, a>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs,, b,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, fs, c>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, g,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, g, e>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b,, f,>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, c>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, af, d a>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, f, cs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b,,, a,>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af,, g, ef>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, af, f>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, f, ef a>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, cs fs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, f>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, af, ef>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, b,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, bf,>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, bf, ef>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, g, fs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, bf,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, d g>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g,, f>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, bf, f>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, e, d>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, ef>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, a,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, g,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, c fs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, d g>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e,>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, g, e>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, f,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, b,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, a,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, c f>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, ef>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs,>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, bf, e>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, cs fs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, c fs>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs, c>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, ef>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b,, g, ef>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af, ef>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, e>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, c f>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g,, cs, ef a>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af, g>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d,>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, c f>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, a>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs, c fs>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, c>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, d>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, af,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af, d>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, d>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, g,>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, bf,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b,, bf, e>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, cs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, af, fs>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, c f>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af, d>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, d g>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef,>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, g, d>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, af, e>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, a,>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, f,>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b,, bf, fs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, cs af>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, fs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, g, c>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, c>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, g>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, cs g>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, f, e>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, a, d>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af, d>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, b,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, cs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, a, fs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, b,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g,, fs,>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs,>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, bf, ef>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, g, d>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, f>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, bf,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, g>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, c>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af,, cs,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, a,>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, af,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, g, f>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, g, f>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, e>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b,, bf, f>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, bf,>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, af,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, d g>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, f,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, af,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, g,>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, e, f>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, fs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, d>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, b, e>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e,, c, bf,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b,, b,>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, a,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af, cs>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f,, fs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, af, fs>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, d>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, g, e>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, bf, f>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, a, f>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, b,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, bf, ef>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d g>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af,, f,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, c>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, g, cs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, bf, e>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, af,>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b,, e,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, b, f>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, e>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, bf, f>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f,, e, e>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, c>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, af,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, c>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, g>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, bf, ef>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, bf, f>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, cs fs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b,, fs, d g>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, f, c>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, g, g>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, b,>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, cs fs>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, g, d a>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, fs>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, e a>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, b,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, a, d>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, af, e a>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, g,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <b,, fs, c>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, fs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, b,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, d, af, a>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, g,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, a, e>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, c fs>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, b, e>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, b, f>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e,, d,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, b, e a>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af, cs fs>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, b, f>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e,,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, g,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, a, e>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f,>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, f, cs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, g,>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, b,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f,,>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, fs, f>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, bf, ef>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, af, d af>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f,, bf,, a, af>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, f>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, af, ef>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, a, ef>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af,, ef>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, b, fs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, g, e>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d,>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, f>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f,, c g>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, b, fs>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, c>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, bf,>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af, cs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, a, d>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <cs, cs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af, g>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, bf, e a>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, ef>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g,, b, e>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, fs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, fs, d>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, af, a>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, a, f>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <d, c>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, e>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <bf,, fs, c>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a,, d, c>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af, fs>2..
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, c fs>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, a,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g,>2.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <af,, d, e>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a, d g>4
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, ef>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <a, d>2
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <g, d g>4.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <fs, cs fs>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, af,>8.
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <f, bf, a>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <c, cs g>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    r16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <e, ef>16
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                    <ef, bf,>8
                    % AFTER:
                    % ARTICULATIONS:
                    \arpeggio
                % CLOSE_BRACKETS:
                }
            % CLOSE_BRACKETS:
            }
        % CLOSE_BRACKETS:
        >>
    % CLOSE_BRACKETS:
    >>
    \layout {}
}
