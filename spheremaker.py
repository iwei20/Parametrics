
with open("spherescript", "w") as fout:
    fout.write("circle 400 400 0 200\n")
    i = 125
    mult = 1
    while i <= 675:
        fout.write("bezier 200 400 225 {0} 575 {0} 600 400\n".format(i))
        fout.write("bezier 400 200 {0} 225 {0} 575 400 600\n".format(i))
        i += mult ** 2 
        mult += 0.15
    fout.write("display\n")
    fout.write("save face.ppm")