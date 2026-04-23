#let Date(text) = toml(bytes("date = " + text)).date

#let term-name = [Easter 2026]
#let start-date = Date("2026-04-27")
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
  ("2026-05-08", [Sri Lankan Formal]),
  ("2026-05-15", [BA Formal]),
  ("2026-05-20", [BA Feast]),
  ("2026-05-29", [BA Formal]),
  ("2026-06-05", [BA Formal]),
  ("2026-06-12", [BA Formal]),
  ("2026-07-10", [BA Formal]),
  ("2026-07-17", [BA Formal]),
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

(
  label: [We~visit~Oxford],
  dates: Date("2026-05-01"),
  description: [
    A day trip swap to our sister college Christ Church in Oxford
  ]
),
(
  label: [Oxford~visits~us],
  dates: Date("2026-05-08"),
),


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
(
  label: [BA AGM],
  description: [
    The Annual General Meeting for the BA Society, from 7pm
  ],
  dates: Date("2026-05-13"),
),(
  label: [BA Hustings],
  description: [
    Hustings for the BA Committee, BA Room, 7pm \
    Come hear from the candidates speak!
  ],
  dates: Date("2026-05-27"),
),
(
  label: [BA Elections],
  description: [
    Election for BA Committee
  ],
  dates: Date("2026-05-29"),
),
(
  label: [BA Handover],
  dates: Date("2026-06-05"),
),
(
  label: [Garden Party],
  title: [BA Garden Party],
  shape: "tri",
  color: green,
  dates: Date("2026-06-06"),
  description: [
    Celebrate the end of the academic year with drinks and snacks, Fellows' Bowling Green from #highlight[mid afternoon]
  ]
),

// Seminars
(
  label: [Evening Seminar],
  dates: (
    Date("2026-05-27"),
    Date("2026-06-17"),
  ),
  icon: talk-icon,
  color: teal,
  description: [
    Hear from our Students and Research Fellows about their research with drinks and dinner!
    #highlight[OCR], 6pm--8pm
  ]
),
(
  label: [Career Talk],
  dates: Date("2026-05-12"),
  icon: talk-icon,
  color: teal,
  description: [
    Alumni careers talk in the #highlight[Old Kitchens/OCR], from 6pm
  ]
),

// James

// Idoia
(
  label: [Picnic~&~Sports],
  dates: Date("2026-05-30"),
  shape: circle,
  color: fuchsia,
  description: [
    Food and fun at Trinity College Backs, from 3pm
  ]
),
(
  label: [Just Dance],
  dates: Date("2026-06-02"),
  shape: circle,
  color: red,
  title: [Just Dance Night],
  description: [
    BA Room from 8pm
  ]
),
(
  label: [Kettle's Yard],
  dates: Date("2026-06-13"),
  shape: circle,
  color: yellow.mix(orange),
  title: [Kettle's Yard Trip],
  description: [
    A visit to the famous house and art gallery, 2:30-5pm
  ]
),

// Amy
// (
//   label: [Cookie Baking],
//   dates: Date("2026-05-11"),
//   shape: rect,
//   color: orange.mix(fuchsia),
//   description: [
//     A morning in the BA Room with cookie baking and brunch, 11am
//   ]
// ),

(
  label: [Board game night],
  dates: Date("2026-05-19"),
  shape: rect,
  color: olive,
  description: [
    A chance to stoke your competitive streak, BA Room, 7pm
  ]
),


// Hannes


// Keilin


// Hugo
(
  label: [Fathom],
  dates: Date("2026-04-29"),
  icon: box(stack(
    box(width: 0.6em, height: 0.3em, fill: green.lighten(80%)),
    box(width: 0.6em, height: 0.3em, fill: olive),
  )),
  description: [
    Staged reading of _Fathom_, written by our own Playwright in Residence, meet at Cambridge Junction, 7:20pm
  ]
),

(
  label: [Like Rabbits],
  dates: (
    Date("2026-05-21"),
    Date("2026-05-22"),
    Date("2026-05-23"),
  ),
  shape: rect,
  color: red,
  description: [
   Live performances of _Like Rabbits_, written by Imogen, directed by James, featuring Hugo and India, ADC Theatre, 7:45pm
  ]
),


// Shih-Huan


// Joseph
(
  label: [Run & Coffee],
  dates: (
    Date("2026-05-14"),
    Date("2026-05-28"),
    Date("2026-06-11"),
  ),
  icon: box({
    let c = teal.lighten(50%)
    circle(radius: 4pt, fill: c)
    place(bottom, dy: -50%, rect(width: 8pt, height: 5pt, fill: c))
  }),
  description: [
    Social morning run finishing with free café refreshments, departing from Great Gate at 8:00am sharp -- each time a different destination
  ]
),


// Mirko


// Isuri

// Anne the Chaplain
(
  label: [Secret Garden],
  title: [Trinity's Secret Garden],
  dates: (
    Date("2026-05-03"),
    Date("2026-05-04"),
  ),
  icon: box(fill: green.lighten(30%), width: .7em, height: .7em, radius: (top-right: 100%, bottom-left: 200%)),
  description: [
    Join Chaplain Anne in planting leafy greens, mangetout, baby cucumbers, carrots, tomatoes in Pearce D courtyard
  ]
)


)