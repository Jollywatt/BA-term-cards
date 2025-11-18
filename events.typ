#let Date(text) = toml(bytes("date = " + text)).date

// a bunch of random mnemonic icons to label events
#let formal-icon = box(rotate(45deg, polygon.regular(vertices: 4, size: .7em, fill: yellow.lighten(20%))))
#let bop-icon = box(circle(stroke: 3pt + fuchsia.lighten(50%), radius: 0.25em))
#let bar-icon = box(polygon.regular(vertices: 3, size: .8em, fill: blue.lighten(50%)))
#let superbar-icon = box(polygon.regular(vertices: 3, size: .7em, stroke: 2pt + blue.lighten(50%)))
#let other-icon = box(pad(text(1.2em, sym.star), x: -1pt))


#let events = (

// freshers events
(
  label: [Sports Fair],
  dates: Date("2025-10-06"),
  description: [University Sports Centre, 12--5pm \ #link("sport.cam.ac.uk/sportsfair")],
),
(
  label: [Freshers' Fair],
  description: [
    Parker’s Piece, 10am--4pm\
    #link("cambridgesu.co.uk/freshers/freshersfair/")
  ],
  dates: (
    "2025-10-07",
    "2025-10-08",
  ).map(Date),
),


// ba formals, themed dinners and swaps
..(
  ("2025-10-09", [Freshers'\ BA Formal]),
  ("2025-10-21", [Diwali Formal]),
  ("2025-10-31", [Halloween\ BA Formal]),
  ("2025-11-07", [BA Formal]),
  ("2025-11-14", [Polish\ BA Formal]),
  ("2025-11-25", [Formal Swap with St Johns]),
  ("2025-11-21", [BA Formal]),
  ("2025-11-28", [BA Formal]),
  ("2025-12-04", [Christmas\ BA Formal]),
  ("2025-12-10", [BA Feast]),
  ("2025-12-13", [Formal Swap with Emmanuel]),
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

// (
//   label: [Matriculation],
//   dates: Date("2025-10-11"),
// ),

(
  label: [Freshers' Bop],
  title: [Freshers' Bop],
  description: [Welcome party at Jesus College Bar following dinner],
  color: fuchsia,
  icon: bop-icon,
  dates: Date("2025-10-11"),
),

(
  label: [BA Hustings],
  description: [
    BA Committee candidate speeches in BA Room, 7pm\
    Manifestos due the day before
  ],
  dates: Date("2025-10-27"),
),
(
  label: [BA Elections],
  description: [BA Committee elections and referendum],
  dates: Date("2025-10-29"),
),


// lunchtime seminars
(
  label: box[Lunch Seminar],
  title: [Lunchtime Seminars],
  dates: (
    "2025-10-29",
    // "2025-11-12",
  ).map(Date),
  color: teal,
  shape: circle,
  description: [
    Student talks with catered lunch, Old Kitchens, 12--2pm
  ]
),


// other events

(
  label: [A.R. Axe Throwing],
  dates: Date("2025-11-01"),
  description: [
    Augmented reality axe throwing, Boom Battle Bar, 3pm
  ],
  color: maroon,
),
(
  label: [Ice Skating],
  dates: Date("2025-11-22"),
  description: [
    Parker's Piece or Cambridge Ice Arena, to be determined
  ],
  color: teal,
),
(
  label: box[Coffee#h(2pt)&#h(2pt)Cake],
  title: [Coffee & Cake],
  description: [Group study session in the BA Room, 4pm--5pm],
  dates: Date("2025-11-19"),
  color: maroon,
  shape: circle,
),
(
  label: [Movie Night],
  description: [BA Room from 8pm],
  dates: Date("2025-10-17"),
  color: maroon,
  shape: circle,
),
(
  label: [Diwali Bop],
  description: [College Bar following formal dinner],
  dates: Date("2025-10-21"),
  color: fuchsia,
  icon: bop-icon,
),
(
  label: [Cambridge United vs Barnet],
  description: [Football match at Abbey Stadium, Cambridge, 3pm],
  dates: Date("2025-11-15"),
  color: orange,
),
(
  label: [Fight Night],
  title: [Wilder Fight Night],
  description: [Black tie student boxing (we'll be watching, not competing!)],
  dates: Date("2025-11-29"),
  color: eastern,
),
(
  label: [Fen Drayton],
  title: [Fen Drayton Walk],
  description: [Walk at Fen Drayton Lakes 10am--3pm\ Meet at the Great Gate],
  dates: Date("2025-11-22"),
  color: green,
),
(
  label: [Trip to Ely],
  description: [Train trip to our neighbouring cathedral city],
  dates: Date("2025-10-24"),
  color: green,
),
(
  label: [Karaoke night],
  description: [In the College Bar, after the Friday BA formal],
  dates: Date("2025-11-28"),
  color: yellow,
),
(
  label: [Christmas Craft Evening],
  color: purple,
  description: [BA Room at 7:30pm],
  dates: Date("2025-12-02"),
  shape: circle,
),
(
  label: [Christmas Cookie Making],
  color: red,
  description: [BA Room from 2pm],
  dates: Date("2025-12-06"),
  shape: circle,
),
(
  label: [Dot Cotton],
  title: [Dot Cotton Club Night],
  description: [LGBT club night at Union Cellars],
  dates: Date("2025-12-06"),
  shape: rect,
  color: purple,
),
(
  label: [Run Club],
  dates: Date("2025-11-05"),
  description: [Women's run/walk club at 6:30pm],
  color: red,
),


// ADC theatre shows
(
  title: [ADC Theatre Shows],
  label: [ADC: Dial M for Murder],
  dates: Date("2025-10-14"),
  shape: "tri-right",
  color: fuchsia,
  description: [Plays at the local ADC theatre on Park Street, from 7:45pm],
),
(
  label: [ADC: Adams Family Musical],
  dates: Date("2025-10-28"),
  shape: "tri-right",
  color: fuchsia
),
(
  label: [ADC: Streetcar Named Desire],
  dates: Date("2025-11-11"),
  shape: "tri-right",
  color: fuchsia
),
(
  label: [The Cabinet of Dr Caligari],
  description: [Classic film trip at Light Cinema from 3:30pm],
  dates: Date("2025-11-02"),
  shape: "tri-right",
  color: fuchsia.mix(yellow)
),



// bar nights

..(
  ("2025-10-08", [BAr Night]),
  ("2025-10-15", [BAr Night]),
  ("2025-10-22", [Diwali\ BAr Night]),
  ("2025-10-29", [BAr Night]),
  ("2025-11-05", [BAr Night]),
  ("2025-11-12", [BAr Night]),
  ("2025-11-19", [BAr Night]),
  ("2025-11-26", [BAr Night]),
  ("2025-12-03", [BAr Night]),
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


)