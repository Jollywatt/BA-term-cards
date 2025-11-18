#let Date(text) = toml(bytes("date = " + text)).date

#let start-date = Date("2025-10-06")
#let end-date = start-date + duration(weeks: 10)

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
).map(((date, label)) => {
  (
    label: label,
    dates: Date(date),
    color: blue,
    icon: if label == [BAr Night] { bar-icon } else { superbar-icon },
  )
}),

(
  title: [BAr Nights],
  icon: bar-icon,
  description: [Usually from 7pm or 8pm at the College Bar],
  order: 2,
),




)



#set page(margin: 10mm)
#set text(font: "EB Garamond")

#align(center)[

#text(20pt, weight: 600, [Michaelmas 2025])
#v(-5pt)
#text(15pt, weight: 800, [Trinity College #sym.ast BA Society #sym.ast Term Card])

// #v(1em)

// Space for a small blurb about what this term card is and how cool we are


#v(1em)

]


#let events-at-date(target-date) = {
  events.filter(e => "dates" in e and target-date in (e.dates,).flatten())
}

#let get-icon(e) = {
  if "icon" in e { e.icon }
  else if "color" in e {
    let s = e.at("shape", default: rect)
    if s == rect {
      box(square(size: .6em, fill: e.color.lighten(50%)))
    } else if s == circle {
      box(circle(radius: .3em, fill: e.color.lighten(50%)))
    } else if s == "tri-right" {
      box(rotate(90deg, polygon.regular(vertices: 3, size: .8em, fill: e.color.lighten(50%))))
    } else {
      other-icon
    }
  } else {
    other-icon
  }
}

#let n-days = int((end-date - start-date).days())

#show link: underline

#v(1fr)
#[
#set text(12pt)
#show emph: set text(font: "Baskervville")

// #set par(leading: 5pt)
#pad(x: -6mm, table(
  columns: (3mm, ..7*(1fr,), 3mm),
  rows: (auto, 23mm),
  gutter: 4pt,
  inset: 4pt,
  stroke: none,

  ..range(7).map(i => {
    let date = start-date + duration(days: i)
    let body = strong(date.display("[weekday]"))
    table.cell(x: i + 1, align: center, body)
  }),

  // ..range(0, 8).map(week => {
  //   table.cell(x: 0, y: week + 1, align: horizon, {
  //     let it = rotate(-90deg, reflow: true)[Week #(week+1)]
  //     move(it, dx: 3cm)
  //   })
  // }),

  ..range(n-days).map(i => {
    let date = start-date + duration(days: i)
    let x = calc.rem(i, 7) + 1
    let y = calc.div-euclid(i, 7) + 1

    let events = events-at-date(date)

    let fill = if date.weekday() in (6, 7) { oklab(98.9%, 0.001, 0.011) }

    table.cell(x: x, y: y, stroke: 0.7pt + oklab(83.01%, 0.001, 0.006), fill: fill)[

      #date.display("[day]")
      #h(1fr)
      #let week1 = Date("2025-10-09")
      #let weeks-since = (date - week1).weeks()
      #if calc.fract(weeks-since) == 0 and weeks-since < 8 {
        [Week #(weeks-since + 1)]
      } else {
        date.display("[month repr:short]")
      }

      #v(-6pt)

      // #set align(center)
      #set text(11.3pt)

      #for e in events {
        let icon = get-icon(e)
        // let it = text(0.95em, emph(e.label))
        let it = emph(e.label)
        if "color" in e {
          // it = highlight(it, fill: e.color.lighten(80%))
          it = text(e.color.darken(70%), it)
        }
        [#icon~#it]
        linebreak()
      }

    ]
  })
))
]



#set page(margin: 18mm)
#set text(13pt)


#let events-to-rows(events) = {
  events
    .filter(e => "description" in e)
    .sorted(key: e => {
      if "order" in e { return e.order }
      if "dates" in e {
        let first-date = calc.min(..(e.dates,).flatten())
        return first-date.month() + first-date.day()/100
      }
      panic("event must have `dates` or `order` entry")
    })
    .map(event => {
      let icon = get-icon(event)
      let title = event.at("title", default: event.at("label", default: [????]))
      (emph(title), [#hide[.]#icon#hide[.]], event.at("description", default: none))
    })
    .filter(a => a != none).flatten()
}

#let events-in-month(m) = {
  let e = events.filter(e => {
    "dates" in e and calc.min(..(e.dates,).flatten()).month() == m
  })
  events-to-rows(e)
}

#v(1fr)

#let monthrow(it) = {
  // (grid.cell(colspan: 3, align: left, [#text(weight: 600, (it))~#box(line(length: 100%, stroke: 0.25pt + luma(80%)))]),)
  return (grid.cell(align: center, text(weight: 600, it), colspan: 3, inset: .5em),)
  // return (none, none, text(weight: 600, , it))
}

#grid(
  columns: (1fr, auto, 2fr),
  align: (right, center, left),
  row-gutter: 1.0em,
  column-gutter: 5pt,
  ..monthrow[Recurring],
  ..events-to-rows(events.filter(e => "order" in e)),
  ..monthrow[October],
  ..events-in-month(10),
  ..monthrow[November],
  ..events-in-month(11),
  ..monthrow[December],
  ..events-in-month(12),   
)

#v(1fr)
