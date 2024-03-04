#import "moderncv.typ": *

#show: project.with(
  title: "Curriculum Vitae",
  firstname: "Christian",
  familyname: "Döring",
  github: "doeringchristian",
  phone: "",
  email: "christian.doering@tum.de"
)

= Education

#cventry(
  start: (month: "September", year: 2011),
  end: (month: "June", year: 2019),
  role: "Abitur (A-Levels)",
  place: "Gymnasium Bruckmühl",
)[
]

#cventry(
  start: (month: "October", year: 2019),
  end: (month: "March", year: 2023),
  role: "B.Sc. Electrical and Computer Engineering",
  place: "Technical University of Munich",
)[
  #v(1em)
  Thesis Title: Evaluation of Differentiable Inverse Rendering using Multi-View RGB Data
]

#cventry(
  start: (month: "April", year: 2023),
  end: (month: "", year: "Present"),
  role: "M.Sc. Electrical and Computer Engineering",
  place: "Technical University of Munich",
)[
]

= Publications


#cvgrid(
  align(center, datebox(month: "", year: "2024")),
  [
    #cite(
      <coomans2024realtime>, 
      form: "full",
    )
  ]
)
#v(-1.5em)

#hide(
bibliography(
  "bibliography.bib", 
  title: none, 
  full: true,
  style: "chicago-author-date",
)
)

= Work Experience

#cventry(
  start: (month: "July", year: 2017),
  end: (month: "July", year: 2017),
  role: "Support",
  place: "Electronic Theater Controls (ETC), Holzkirchen",
)[
]

#cventry(
  start: (month: "July", year: 2017),
  end: (month: "July", year: 2017),
  role: "Embeded systems development",
  place: "Lauterbach GmbH",
)[
]

#cventry(
  start: (month: "July", year: 2021),
  end: (month: "August", year: 2021),
  role: "Embeded Systems Developer",
  place: "Aurum GmbH",
)[
]

#cventry(
  start: (month: "August", year: 2023),
  end: (month: "February", year: 2024),
  role: "Neural Rendering Researcher",
  place: "Huawei Technologies",
)[
]

= Technical Experience

#cvcol[
  ===  Programming Languages and Frameworks

  #grid(
    columns: (1fr, 1fr),
    row-gutter: 0.5em,
    [- Rust],
    [- Python],
    [- GLSL],
    [- CUDA],
    [- Vulkan],
    [- C],
    [- C++],
  )
]

#cvcol[
  #box[
  === Projects
  
  - #textit("Hephaestus-jit") Just In Time Compiler (JIT) for Vulkan, inspired by Dr.Jit. 
    Implemented with own render graph solution.
    Includes cooperative matrix multiplication (KHR) and a port of tiny-cuda-nn in GLSL.
  - #textit("Vulkan-rt") Path tracer written in Rust using the screen-13 library. It supports the Disney BSDF with Next Event Estimation.
  - #textit("Large Steps in Mitsuba3")  Implementation of the Large Steps in Inverse Rendering paper in Mitsuba3 using PyTorch Integration.
  ]
]

= Languages

#cvlanguage(
  language: "German",
  certificate: "Mother tongue"
)

#cvlanguage(
  language: "English",
  certificate: "B2+/C1 Abitur"
)
