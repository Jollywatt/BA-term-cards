#let Date(text) = toml(bytes("date = " + text)).date

#let term-name = [Lent 2026]
#let start-date = Date("2026-01-05")
#let end-date = start-date + duration(weeks: 10)

// a bunch of random mnemonic icons to label events
#let formal-icon = box(rotate(45deg, polygon.regular(vertices: 4, size: .7em, fill: yellow.lighten(20%))))
#let bop-icon = box(circle(stroke: 3pt + fuchsia.lighten(50%), radius: 0.25em))
#let bar-icon = box(polygon.regular(vertices: 3, size: .8em, fill: blue.lighten(50%)))
#let superbar-icon = box(polygon.regular(vertices: 3, size: .7em, stroke: 2pt + blue.lighten(50%)))
#let other-icon = box(move(text(1.2em, sym.star), dy: -0.1em))


#let events = (


// ba formals, themed dinners and swaps
..(
  ("2025-10-09", [Freshers'\ BA Formal]),
  ("2025-10-21", [Diwali Formal]),
).map(((date, label)) => (
  label: label,
  dates: Date(date),
  icon: if label == [BA Formal] {formal-icon} else {
    box(rotate(45deg, polygon.regular(vertices: 4, size: .65em, stroke: 2.5pt+yellow.lighten(20%))))
  },
  color: yellow,
)),

(
  title: [BA Formal Dinners],
  description: [
    Usually pre-drinks from 7pm, dinner at 8pm in Great Hall\
    Catering Officer will notify via email
  ],
  icon: formal-icon,
  order: 1,
),


// bar nights

..(
  ("2026-01-07", [Pub trip to The Maypole]),
  ("2026-01-14", [BAr Night]),
  ("2026-01-21", [BAr Night]),
  ("2026-01-28", [BAr Night]),
  ("2026-02-04", [BAr Night]),
  ("2026-02-11", [BAr Night]),
  ("2026-02-18", [BAr Night]),
  ("2026-02-25", [BAr Night]),
  ("2026-03-04", [BAr Night]),
  ("2026-03-11", [BAr Night]),
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

// other events
(
  label: [Language Café],
  dates: Date("2026-02-08"),
  shape: circle,
  color: fuchsia,
  description: [
    Come and speak bilingually at Trin Bar, 3--4pm
  ]
),
(
  label: [Pastry Making],
  dates: Date("2026-02-15"),
  shape: circle,
  color: orange,
  description: [
    Chinese Puff-Pastry making in the BA Room from 10am
  ]
),
(
  label: [Lunar New Year],
  dates: Date("2026-02-17"),
  shape: circle,
  color: yellow,
  description: [
    Celebrating the Lunar New Year, BA Room, 6pm
  ]
),
(
  label: [Wuthering Heights],
  dates: Date("2026-02-22"),
  shape: rect,
  color: olive,
  description: [
    Cinema trip to _Wuthering Heights_ at TBD from TBD
  ]
),
(
  label: [Cambridge Tour],
  dates: Date("2026-02-22"),
  shape: "tri-right",
  color: red,
  description: [
    The "Uncomfortable" Cambridge Tour, starting in front of King's College, 2:30--4pm (TBD)
  ]
),

(
  label: [Women's Swim],
  dates: Date("2026-02-01"),
  shape: rect,
  color: teal,
  description: [
    (DATE TBD)
    Winter swimming at Jesus Green Lido at TBD
  ]
),
(
  label: [Women's Brunch],
  dates: Date("2026-03-08"),
  shape: rect,
  color: red,
  description: [
    Come and celebrate IWD with brunch at TBD (loc TBD)
  ]
),


(
  label: [BA Hustings],
  description: [
    Hustings for the first BA Academic Officer, BA Room, 7pm \
    Come hear from the candidates!
  ],
  dates: Date("2026-01-21"),
),
(
  label: [BA Elections],
  description: [
    Election for BA Academic Officer, watch your emails
  ],
  dates: Date("2026-01-23"),
),




)