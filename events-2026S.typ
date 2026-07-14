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
  ("2026-07-24", [BA Formal]),
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
  ("2026-07-15", [BAr Night]),
  ("2026-07-29", [BAr Night]),
  ("2026-08-05", [BAr Night]),
  ("2026-08-12", [BAr Night]),
  ("2026-08-19", [BAr Night]),
  ("2026-08-26", [BAr Night]),
  ("2026-09-02", [BAr Night]),
  ("2026-09-09", [BAr Night]),
  ("2026-09-16", [BAr Night]),
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


(
  dates: Date("2026-08-01"),
  label: [PostDoc Picnic],
  description: [
    Picnic and networking with the PostDoc Society, Fellow's Garden from 3pm
  ],
  color: red,
  shape: rect
),

(
  dates: Date("2026-07-19"),
  label: [World Cup Final],
  description: [Watch party for the FIFA world cup, location TBD, from 8pm],
  shape: circle,
  color: red,
),

(
  dates: Date("2026-07-29"),
  label: [Cores~do~Samba],
  description: [
    Part of _Sounds Green_ in the Botanic Gardens, samba, bossa nova and funk, on the Garden's Main Lawn, from 6pm
  ],
  shape: circle,
  color: green,
),

(
  dates: Date("2026-08-15"),
  label: [Rally Karting],
  description: [
    Outdoor go karting, Kings Ripton Road, Huntingdon from 1pm
  ],
  color: orange,

),

(
  dates: Date("2026-08-08"),
  label: [Sea Day Trip],
  description: [Day trip to the ocean, location to be announced, morning start],
  color: blue.lighten(90%).saturate(100%),
  shape: "tri",
),

// run & coffee
(
  label: [Run & Coffee],
  dates: (
    "2026-07-24",
    "2026-08-09",
    "2026-08-27",
    "2026-09-11",
    "2026-09-30",
  ).map(Date),
  icon: box({
    let c = teal.lighten(50%)
    circle(radius: 4pt, fill: c)
    place(bottom, dy: -50%, rect(width: 8pt, height: 5pt, fill: c))
  }),
  description: [
    Social morning run finishing with free café refreshments, departing from Great Gate at 8:00am -- each event is a different destination
  ]
),

(
  label: [Coffee & Cake],
  dates: Date("2026-09-06"),
  description: [
    Refreshments of the bitter & sweet kind in the BA Room, 2pm
  ],
  shape: "tri",
  color: fuchsia
)


)