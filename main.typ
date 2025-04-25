#import "moderncv.typ": *

#show: project.with(
  title: "Curriculum Vitae", firstname: "Christian", familyname: "Döring", github: "doeringchristian", phone: "", email: "christian.doering@tum.de",
)

= Education

#cventry(
  start: (month: "April", year: 2023), end: (month: "", year: "present"), role: "M.Sc. Electrical and Computer Engineering", place: "Technical University of Munich",
)[
]

#cventry(
  start: (month: "October", year: 2019), end: (month: "March", year: 2023), role: "B.Sc. Electrical and Computer Engineering", place: "Technical University of Munich",
)[
  #v(1em)
  Thesis Title: Evaluation of Differentiable Inverse Rendering using Multi-View
  RGB Data
]

#cventry(
  start: (month: "September", year: 2011), end: (month: "June", year: 2019), role: "Abitur (A-Levels)", place: "Gymnasium Bruckmühl",
)[
]

= Publications
#cvpub(
  title: "Real-time Neural Rendering of Dynamic Light Fields", authors: [Arno Coomans , Edoardo A. Dominici, Christian Döring, Joerg H. Mueller, Jozef
    Hladky, Markus Steinberger ], venue: "Computer Graphics Formum (EG), 2024", project: "https://arnocoomans.be/eg2024/", paper: "https://doi.org/10.1111/cgf.15014",
)

= Work Experience

#cventry(
  start: (month: "April", year: 2025), end: (month: "", year: "present"), role: "Research Intern", place: "NVIDIA Switzerland",
)[
  - Differentiable Rendering
  - Development on Dr.Jit/Mitsuba3
]

#cventry(
  start: (month: "April", year: 2024), end: (month: "April", year: 2025), role: "Research Working Student", place: "Huawei Technologies",
)[
  - Development on Dr.Jit/Mitsuba3
]

#cventry(
  start: (month: "August", year: 2023), end: (month: "February", year: 2024), role: "Research Intern", place: "Huawei Technologies",
)[
  - Researched Real-time Neural Rendering algorithms
  - Gained experience with Mitsuba3
]

#cventry(
  start: (month: "July", year: 2021), end: (month: "August", year: 2021), role: "Embeded Systems Intern", place: "Aurum GmbH",
)[
  - Developed NFC library for STM32 in C
]

#cventry(
  start: (month: "July", year: 2017), end: (month: "July", year: 2017), role: "Intern", place: "Lauterbach GmbH",
)[
]

#cventry(
  start: (month: "July", year: 2017), end: (month: "July", year: 2017), role: "Intern", place: "Electronic Theater Controls (ETC), Holzkirchen",
)[
]

= Side Projects

#cvproject(
  title: "Hephaestus-jit", git: "https://github.com/doeringchristian/hephaestus-jit", [
    Just In Time Compiler (JIT) for Vulkan, inspired by Dr.Jit. Implemented with own
    render graph solution. Includes cooperative matrix multiplication (KHR) and a
    port of tiny-cuda-nn in GLSL.
  ],
)
#cvproject(
  title: "Vulkan-rt", git: "https://github.com/DoeringChristian/vulkan-rt", [
    Path tracer written in Rust using the screen-13 library. It supports the Disney
    BSDF with Next Event Estimation.
  ],
)
#cvproject(
  title: "Mitsuba3 Experiments", [
    Implementation of forward and differentiable path tracing algorithms in
    Mitsuba3, such as
    #link("https://github.com/DoeringChristian/restirgi")[#textit("ReSTIR GI")]
    and
    #link(
      "https://github.com/mitsuba-renderer/mitsuba3/discussions/600",
    )[#textit("Large Steps in Inverse Rendering")].
  ],
)

= Skills

#grid(
  columns: (left_column_size, 1fr, 0.5fr, 1fr), column-gutter: grid_column_gutter, row-gutter: 1em, align(right, [Programming]), [
    - *Rust*, C/C++
    - *Vulkan*, CUDA
    - *Python*, Lua
    - LaTeX, Typst
  ], align(right, [Languages]), [
    - German (native)
    - *English* (fluent B2+/C1)
  ],
)
