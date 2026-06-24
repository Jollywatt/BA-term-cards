#let Date(text) = toml(bytes("date = " + text)).date

#let term-name = [Summer 2026]
#let start-date = Date("2026-07-13")
#let end-date = start-date + duration(weeks: 10)

// a bunch of random mnemonic icons to label events
#let formal-icon = box(rotate(45deg, polygon.regular(vertices: 4, size: .7em, fill: yellow.lighten(20%))))
#let bop-icon = box(circle(stroke: 3pt + fuchsia.lighten(50%), radius: 0.25em))
#let bar-icon = box(polygon.regular(vertices: 3, size: .8em, fill: blue.lighten(50%)))
#let superbar-icon = box(polygon.regular(vertices: 3, size: .7em, stroke: 2pt + blue.lighten(50%)))
#let other-icon = box(move(text(1.2em, sym.star), dy: -0.1em))
#let talk-icon = box(rotate(45deg, polygon.regular(vertices: 4, size: .8em, fill: orange.lighten(50%))))


#let events = (


// BA FORMALS, THEMED DINNERS AND SWAPS
..(
  ("2026-07-17", [BA Formal]),
  ("2026-07-22", [BA Formal]),
  ("2026-07-31", [BA Formal]),
  ("2026-08-07", [BA Formal]),
).map(((date, label)) => (
  label: label,
  dates: Date(date),
  icon: if label == [BA Formal] {formal-icon} else {
    box(rotate(45deg, polygon.regular(vertices: 4, size: .65em, stroke: 2.5pt+yellow.lighten(20%))), inset: (x: 2pt))
  },
  color: yellow,
)),



// BAR NIGHTS

..(
  ("2026-04-29", [BAr Night]),
  ("2026-05-06", [BAr Night]),
  ("2026-05-13", [Karaoke BAr Night]),
  ("2026-06-03", [BAr Night]),
  ("2026-06-10", [BAr Night]),
  ("2026-06-17", [BAr Night]),
  ("2026-06-24", [BAr Night]),
).map(((date, label)) => (
  label: label,
  dates: Date(date),
  color: blue,
  icon: if label == [BAr Night] { bar-icon } else { superbar-icon },
)),

(
  title: [BAr Nights],
  icon: bar-icon,
  description: [Usually from 7pm or 8pm at the College Bar],
  order: 2,
),

// BA SOCIETY


)