import sys
import clingo

class SudokuApp(clingo.clingo_main.ClingoApp):
    def __init__(self):
        super().__init__()
        self.program_name = "sudoku"

    def main(self, ctl, files):
        # Load sudoku encoding + input file
        ctl.load("sudoku.lp")
        for f in files:
            ctl.load(f)

        ctl.ground([("base", [])])

        print("Solving...")
        with ctl.solve(yield_=True) as handle:
            for model in handle:
                print("Answer: 1")
                print(" ".join(str(atom) for atom in model.symbols(shown=True)))
                break


if __name__ == "__main__":
    sys.exit(clingo.clingo_main(SudokuApp(), sys.argv[1:]))