#import "events-2026L.typ": *

#set page(margin: 10mm)
#set text(font: "EB Garamond")

#align(center)[

#text(20pt, weight: 600, term-name)
#v(-5pt)
#text(15pt, weight: 800, [Trinity College #sym.ast BA Society #sym.ast Term Card])

// #v(1em)

// Space for a small blurb about what this term card is and how cool we are


]

#show "TBD": highlight


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
    } else if s == "tri" {
      box(polygon.regular(vertices: 3, size: .8em, fill: e.color.lighten(50%)))
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
#show emph: set text(font: "Baskerville")

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
  ..monthrow[January],
  ..events-in-month(1),
  ..monthrow[February],
  ..events-in-month(2),
  ..monthrow[March],
  ..events-in-month(3),   
)

#v(1fr)
