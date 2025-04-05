pub fn annotate(minefield: &[&str]) -> Vec<String> {
    if minefield.is_empty() {
        return Vec::new();
    }

    let height = minefield.len();
    let width = minefield[0].len();

    let mut result = Vec::with_capacity(height);

    for row in 0..height {
        let mut annotated_row = String::with_capacity(width);

        for col in 0..width {
            // Check if current cell is a mine
            if is_mine(minefield, row, col) {
                annotated_row.push('*');
                continue;
            }

            // Count surrounding mines
            let count = count_surrounding_mines(minefield, row, col);

            // If no mines, leave empty, otherwise show the count
            if count == 0 {
                annotated_row.push(' ');
            } else {
                annotated_row.push(char::from_digit(count, 10).unwrap());
            }
        }

        result.push(annotated_row);
    }

    result
}

fn is_mine(minefield: &[&str], row: usize, col: usize) -> bool {
    if let Some(row_str) = minefield.get(row) {
        if let Some(ch) = row_str.chars().nth(col) {
            return ch == '*';
        }
    }
    false
}

fn count_surrounding_mines(minefield: &[&str], row: usize, col: usize) -> u32 {
    let mut count = 0;

    // Check all 8 surrounding positions
    for i in 0..3 {
        for j in 0..3 {
            // Skip the center position (current cell)
            if i == 1 && j == 1 {
                continue;
            }

            // Calculate the position to check
            let new_row = row as isize + i as isize - 1;
            let new_col = col as isize + j as isize - 1;

            // Skip if out of bounds
            if new_row < 0 || new_col < 0 {
                continue;
            }

            // Check if this position has a mine
            if is_mine(minefield, new_row as usize, new_col as usize) {
                count += 1;
            }
        }
    }

    count
}
