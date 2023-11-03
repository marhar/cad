def generate_openscad_code(pattern, unit):
    lines = pattern.strip().split('\n')
    openscad_lines = ["module zblock() {"]

    for y, line in enumerate(reversed(lines)):  # Reverse to start from the bottom for translate
        for x, char in enumerate(line):
            if char == 'X':
                openscad_lines.append(f"  translate([{x * unit}, {y * unit}, 0]) X();")
            elif char == '.':
                openscad_lines.append(f"  translate([{x * unit}, {y * unit}, 0]) _();")

    openscad_lines.append("}")

    return '\n'.join(openscad_lines)

pattern = """\
XX.
.XX"""

print(generate_openscad_code(pattern, 'U'))
