#import "events-2026M.typ": *
#import "@preview/tiaoma:0.3.0"

#set page(margin: (top: 10mm, rest: 6mm))
#set text(font: "EB Garamond")

#align(center)[

#text(24pt, weight: 600, term-name)
#v(-10pt)
#text(18pt, weight: 800, [Term Card #sym.ast BA Society #sym.ast Trinity College])

#v(1fr)


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

#[
#set text(12pt)
#show emph: set text(font: "Baskerville")

// #set par(leading: 5pt)
#v(1fr)
#table(
  columns: 7*(1fr,),
  rows: (auto, 23mm),
  gutter: 4pt,
  inset: 4pt,
  stroke: none,

  ..range(7).map(i => {
    let date = start-date + duration(days: i)
    let body = strong(date.display("[weekday]"))
    table.cell(x: i, align: center, body)
  }),


  ..range(n-days).map(i => {
    let date = start-date + duration(days: i)
    let x = calc.rem(i, 7)
    let y = calc.div-euclid(i, 7) + 1

    let events = events-at-date(date)

    let fill = if date.weekday() in (6, 7) { oklab(98.9%, 0.001, 0.011) }

    table.cell(x: x, y: y, stroke: 0.7pt + oklab(83.01%, 0.001, 0.006), fill: fill)[

      #if date.month() == 2 and date.day() == 14 [♡] else {
        date.display("[day]")
      }
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
)
]



#set page(margin: (x: 15mm, y: 0mm))
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
    "dates" in e and (e.dates,).flatten().len() > 0 and calc.min(..(e.dates,).flatten()).month() == m
  })
  events-to-rows(e)
}


#v(1fr)

#align(center, emph(text(12pt)[
  Further details are shared via email or WhatsApp closer to their happening.
  Enjoy the first term of the year!
]))
#v(5mm)




#let monthrow(it) = {
  // (grid.cell(colspan: 3, align: left, [#text(weight: 600, (it))~#box(line(length: 100%, stroke: 0.25pt + luma(80%)))]),)
  return (grid.cell(align: center, text(weight: 600, it), colspan: 3, inset: .5em),)
  // return (none, none, text(weight: 600, , it))
}

#grid(
  columns: (1fr, auto, 2.5fr),
  align: (right, center, left),
  row-gutter: 1em,
  column-gutter: 5pt,
  ..monthrow[Recurring],
  ..events-to-rows(events.filter(e => "order" in e)),
  ..(
    [January],
    [February],
    [March],
    [April],
    [May],
    [June],
    [July],
    [August],
    [September],
    [October],
    [November],
    [December],
  ).enumerate().map(((i, month)) => {
    let events = events-in-month(i + 1)
    if events.len() == 0 { return () }
    (monthrow(month), ..events)
  }).flatten()
)

#v(1fr)

#let s = 10mm
#place(bottom + right, dx: 15mm - s, dy: -s)[
  #show: emph
  #grid(
    columns: 2,
    align: horizon + right,
    gutter: 1em
  )[
    Any changes to event details\ will be reflected in the digital term card\ available at _basociety.net/ba-events_
  ][
    #tiaoma.qrcode("https://basociety.net/ba-events/", width: 16mm)
  ]
]

