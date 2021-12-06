using Base.Iterators

function day4()
  filter(pred, filter) = Iterators.filter(pred, filter)

  input = readlines("src/day4.input")

  nums = map(x -> parse(Int, x), split(first(input), ","))

  parseline(line) = [parse(Int, s) for s in split(line)]
  parseboard(lines) = foldl(hcat, map(parseline, lines))

  boards = filter(!isempty, drop(input, 1)) |>
    collect |>
    lines -> partition(lines, 5) |>
    p -> map(parseboard, p) |>
    boards -> zip(boards, map(zero, boards)) |>
    collect

  function win(marks)
    any(row -> sum(row) == 5, eachrow(marks)) ||
        any(col -> sum(col) == 5, eachcol(marks))
  end

  for n in nums
    for (board, marks) in boards
      marks[board .== n] .= 1

      if win(marks)
        println(sum(board[marks .== 0]) * n)
        return
      end
    end
  end
end
