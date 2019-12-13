using Mux, Interact, Plots

titleElem = textbox("Title of Graph")
numElem = slider(1:10, label="Number of Values")
linesElem = slider(1:10, label="Number of Lines")
btnElem = button("Generate Random Graph")

plt = plot(0, 0)

layout = vbox(titleElem, numElem, linesElem, btnElem, plt)

resultPlt = plot(1:5, rand(5, 5), title="")
result = vbox(
  titleElem,
  numElem,
  linesElem,
  btnElem,
  resultPlt,
)

on(
  function (n)

    global resultPlt = plot(1:numElem[], rand(numElem[], linesElem[]), title=titleElem[])

    global result = vbox(
      titleElem,
      numElem,
      linesElem,
      btnElem,
      resultPlt,
    )
    # display(result)
  end,

  btnElem,
)

# display(layout)

@app app = (
  Mux.defaults,
  page("/", req->layout),
  page("/result/", req->result),
  Mux.notfound()
)

serve(app, 8080)
