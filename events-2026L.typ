#let Date(text) = toml(bytes("date = " + text)).date

#let term-name = [Lent 2026]
#let start-date = Date("2026-01-19")
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
  ("2026-01-23", [Burn's Night]),
  ("2026-01-30", [BA Formal]),
  ("2026-02-06", [BA Formal]),
  ("2026-02-13", [Valentine's Formal]),
  ("2026-02-20", [Chinese New Year Formal]),
  ("2026-02-27", [LGBTQ+ Formal]),
  ("2026-03-06", [BA Formal]),
  ("2026-03-13", [St Patrick's Formal]),
  ("2026-03-25", [BA Feast]),
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


// BAR NIGHTS

..(
  ("2026-01-21", [BAr Night]),
  ("2026-01-28", [BAr Night]),
  ("2026-02-04", [Karaoke BAr Night]),
  ("2026-02-11", [BAr Night]),
  ("2026-02-18", [BAr Night]),
  ("2026-02-25", [BAr Night]),
  ("2026-03-04", [BAr Night]),
  ("2026-03-11", [BAr Night]),
  ("2026-03-18", [BAr Night]),
  // ("2026-03-25", [BAr Night]),
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
(
  label: [BA Hustings],
  description: [
    Hustings for our first BA Academic Officer, BA Room, 7pm \
    Come hear from the candidates!
  ],
  dates: Date("2026-01-21"),
),
(
  label: [BA Elections],
  description: [
    Election for BA Academic Officer
  ],
  dates: Date("2026-01-23"),
),

// Lunchtime seminars
(
  label: [Luchtime Seminar],
  dates: Date("2026-02-18"),
  icon: talk-icon,
  color: teal,
  description: [
    Join us for two talks from BA students about their research over a free catered lunch! The Old Kitchens, 12pm--2pm
  ]
),
(
  label: [Evening Seminar],
  dates: Date("2026-03-17"),
  icon: talk-icon,
  color: teal,
  description: [
    Hear from our Students and Research Fellows about their research with drinks and dinner!
    Allhusen Room, 6pm--8pm
  ]
),

// James
(
  label: [Queer Art & Writing Talk],
  dates: Date("2026-01-22"),
  shape: circle,
  color: fuchsia,
  description: [
    A panel discussion on _Queer Histories, Legacies and Imaginings_ at Murray Edwards College, 6:30pm–7:30pm
  ]
),
(
  label: [Comedy Night],
  title: [Degenerates Comedy Night],
  dates: Date("2026-02-20"),
  shape: circle,
  color: fuchsia,
  description: [
    Alternative comedy at the Blue Moon Pub, doors opening 7pm
  ]
),

// Idoia
(
  label: [Language Café],
  dates: Date("2026-02-07"),
  shape: circle,
  color: fuchsia,
  description: [
    Come and speak bilingually at Trin Bar, from 3pm
  ]
),

// Amy
(
  label: [Pastry~Making],
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
    An evening to celebrate the Lunar New Year, BA Room, 6pm
  ]
),
(
  label: [Wuthering Heights],
  dates: Date("2026-02-22"),
  shape: rect,
  color: olive,
  description: [
    Cinema trip to _Wuthering Heights_, time and place T.B.D.
  ]
),


// Hannes
(
  label: [Uncomfy Tour],
  dates: Date("2026-03-01"),
  shape: "tri-right",
  color: red,
  description: [
    The "Uncomfortable" Cambridge Tour, starting in front of King's College, 2:30--4pm
  ]
),


// Keilin
// (
//   label: [Women's Swim],
//   dates: Date("2026-02-01"),
//   shape: rect,
//   color: teal,
//   description: [
//     (DATE TBD)
//     Winter swimming at Jesus Green Lido at TBD
//   ]
// ),
(
  label: [Women's Brunch],
  dates: Date("2026-03-08"),
  shape: rect,
  color: red,
  description: [
    International women's day brunch at 10am, BA Room
  ]
),

// Hugo
(
  label: [Rock~Climbing],
  title: [Climbing at Rainbow Rocket],
  dates: Date("2026-02-15"),
  shape: "tri-right",
  color: blue,
  description: [
    Rainbow Rocket Climbing Centre, 1pm--3pm
  ]
),
(
  label: [Switzerland vs UK Curling],
  dates: Date("2026-02-08"),
  shape: "tri",
  color: eastern,
  description: [
    Watch the Winter Olympics Curling match, bar T.B.D., 1:30pm

  ]
),
(
  label: [Half~Marathon],
  title: [Cambridge Half Marathon],
  dates: Date("2026-03-08"),
  icon: box({
    let c = teal.lighten(50%)
    circle(radius: 4pt, fill: c)
    place(bottom, dy: -50%, rect(width: 8pt, height: 5pt, fill: c))
  }),
  description: [
    Support your peers at the T100 Cambridge Half Marathon!
  ]
),
(
  label: [Run & Coffee],
  dates: Date("2026-02-19"),
  icon: box({
    let c = teal.lighten(50%)
    circle(radius: 4pt, fill: c)
    place(bottom, dy: -50%, rect(width: 8pt, height: 5pt, fill: c))
  }),
  description: [
    A social 5km run finishing with free café refreshments, departing from Great Gate at 8am
  ]
),

// Shih-Huan
(
  label: [Peak District],
  title: [Peak District Trip],
  color: green,
  shape: "tri",
  dates: (
    Date("2026-03-27"),
    Date("2026-03-28"),
    Date("2026-03-29"),
  ),
  description: [
    A 2½ day excursion to the famous Peak District.
    Leaving Friday afternoon for a relaxed and social outdoor adventure!
  ],
),


(
  label: [Clock Tower Winding],
  color: orange,
  shape: circle,
  dates: Date("2026-01-31"),
  description: [
    A tour inside the Trinity Clock from our resident Clockkeeper, Prof.~Hugh~Hunt, entering at 10:45am
  ],
),

// Isuri

(
  label: [Hamilton],
  color: orange,
  shape: "tri",
  dates: Date("2026-01-29"),
  description: [
    London West End musical, Victoria Palace Theatre, 2:30pm
  ],
),



)