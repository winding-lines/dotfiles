

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier','eslint'],
\   'python': ['flake8', 'black'],
\}
let g:ale_python_flake8_executable = 'python3'
