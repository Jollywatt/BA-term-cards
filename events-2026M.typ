#let Date(text) = toml(bytes("date = " + text)).date

#let term-name = [Michaelmas 2026]
#let start-date = Date("2026-10-05")
#let end-date = start-date + duration(weeks: 10)

// a bunch of random mnemonic icons to label events
#let formal-icon = box(rotate(45deg, polygon.regular(vertices: 4, size: .7em, fill: yellow.lighten(20%))))
#let bop-icon = box(circle(stroke: 3pt + fuchsia.lighten(50%), radius: 0.25em))
#let bar-icon = box(polygon.regular(vertices: 3, size: .8em, fill: blue.lighten(50%)))
#let superbar-icon = box(polygon.regular(vertices: 3, size: .7em, stroke: 2pt + blue.lighten(50%)))
#let other-icon = box(move(text(1.2em, sym.star), dy: -0.1em))
#let talk-icon = box(rotate(45deg, polygon.regular(vertices: 4, size: .8em, fill: orange.lighten(50%))))
#let foody-icon(c) = box(rotate(45deg, polygon.regular(vertices: 4, size: .7em, fill: c.lighten(50%))))


#let events = (


// BA FORMALS, THEMED DINNERS AND SWAPS
..(
  ("2026-10-08", [BA Freshers' Formal]),
  ("2026-10-16", [Formal Swap at Pembroke ]),
  ("2026-10-23", [BA Formal]),
  ("2026-10-30", [Halloween Formal with Pembroke]),
  ("2026-11-06", [BA Formal]),
  ("2026-11-13", [BA Formal]),
  ("2026-11-14", [Formal Swap at Jesus]),
  ("2026-11-20", [BA Formal with Jesus]),
  ("2026-11-27", [BA Formal]),
  ("2026-12-02", [BA Christmas Formal]),
  ("2026-12-09", [BA Feast]),
).map(((date, label)) => (
  label: label,
  dates: Date(date),
  icon: if label == [BA Formal] {formal-icon} else {
    box(rotate(45deg, polygon.regular(vertices: 4, size: .65em, stroke: 2.5pt+yellow.lighten(20%))), inset: (x: 2pt))
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

// Freshers stuff

(
  label: [Freshers' Bop],
  title: [Freshers' Bop],
  description: [Welcome party at Jesus College after the Freshers' Formal],
  color: fuchsia,
  icon: bop-icon,
  dates: Date("2026-10-08"),
),


// Society stuff

(
  label: [BA Hustings],
  description: [
    BA Committee candidate speeches in BA Room, 7pm\
    Manifestos due the day before
  ],
  dates: Date("2026-11-04"),
),
(
  label: [BA Elections],
  description: [BA Committee elections and referendum],
  dates: Date("2026-11-06"),
),



// BAR NIGHTS

..(
  ("2026-10-07", [BAr Night]),
  ("2026-10-14", [BAr Night]),
  ("2026-10-21", [BAr Night]),
  ("2026-10-28", [BAr Night]),
  ("2026-11-04", [BAr Night]),
  ("2026-11-11", [Karaoke BAr Night]),
  ("2026-11-18", [BAr Night]),
  ("2026-11-25", [BAr Night]),
  ("2026-12-02", [BAr Night]),
  ("2026-12-11", [BAr Night]),
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


// Evening seminars
(
  label: box(scale(x: 94%, origin: left, [Evening Seminar])),
  title: [Evening Seminars],
  dates: (
    "2026-10-28",
    "2026-11-18",
    // "2025-11-12",
  ).map(Date),
  icon: box(clip: true, width: 0.7em,align(center, circle(radius: 0.4em, fill: orange.mix(purple).desaturate(50%)))),
  description: [
    Hear from our Students and Research Fellows about their research with drinks and dinner!
    Allhusen Room, 6pm--8pm
  ]
),


// run & coffee
(
  label: [Run & Coffee],
  dates: (
    "2026-10-16",
    "2026-11-05",
    "2026-11-18",
    "2026-12-11",
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

// misc

(
  label: [Ice Skating],
  dates: Date("2026-11-23"),
  description: [
    Christmas ice skating at Parkers Piece, meeting at Great Gate at 5:30pm
  ],
  color: teal,
  contact: "Petra and Ilinca"
),


(
  label: [Cookies & Mulled Wine],
  dates: Date("2026-11-28"),
  icon: foody-icon(red),
  description: [
    Stave off winter by baking cookies and drinking mulled wine together in the BA room, from afternoon
  ],
  contact: "Leon"
),

(
  label: [Women's Brunch],
  dates: Date("2026-12-13"),
  shape: circle,
  description: [
    A friendly brunch in the BA Room to mark the end of term
  ],
  color: olive,
),

(
  label: [Halloween Drag],
  description: [
    Group outing to Cambridge's _#smallcaps[now]! That's what I call... #smallcaps[drag]!_ \
    The Blue Moon pub, meeting at Great Gate, from 6pm
  ],
  color: fuchsia.mix(blue),
  shape: circle,
  dates: Date("2026-10-24"),
),

(
  label: [Walk to Granchester],
  dates: Date("2026-10-18"),
  shape: circle,
  color: green,
  description: [
    A walk through the countyside to The Orchard Tea Garden in Granchester, leaving from Great Gate at TBD
  ]
),

(
  label: [Board Games],
  dates: Date("2026-10-31"),
  shape: circle,
  color: red,
  description: [
    A spooky board game nightwith candied cookies and ice cream in the BA Room, from 7pm
  ]
),

(
  label: [Pumpkin Carving],
  dates: Date("2026-10-27"),
  icon: box({
    (scale(x: 113%, y: 97%, circle(radius: 0.3em, fill: orange.lighten(30%))))
    for s in (-1, +1) {
      place(horizon + center, dx: s*0.12em, dy: -0.08em, circle(radius: 0.03em, fill: white))
    }
      place(horizon + center, dy: 0.09em, circle(radius: 0.06em, fill: white))

  }),
  color: orange,
  description: [
    An evening of carved pumpkins and fall-themed refreshments in the BA Room, from 7pm
  ]
),

(
  label: [Sunset Walk],
  icon: box(circle(fill: gradient.linear(yellow.lighten(70%), yellow.mix((orange, 40%)), dir: ttb), radius: 0.34em)),
  dates: Date("2026-10-25"),
  description: [
    A cosy walk through Cambridge parks with coffee and hot chocolate
    leaving Great Gate at 4pm
  ]
)

)