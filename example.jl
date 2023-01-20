using CairoMakie, PyCall

svg2tikz = pyimport("svg2tikz")

fig = scatter(rand(20))
save("fig.svg",fig)
# manually delete " encoding="UTF-8" from 1st line of svg or next command wont work

#convert to tikz
tikz =svg2tikz.convert_svg("fig.svg")
io = open("tikz.tex", "w")
write(io,tikz)
close(io)
# next compile the tex code giving "tikz.pdf"

#save makie version for comparison
save("makie.pdf",fig)