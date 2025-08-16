# 🧠 Neovim Cheatsheet Personal

### Leader: `<Space>`
- `<leader>.` → Ir al dashboard

---

## 📁 Navegación Básica

| Comando | Acción |
|--------|--------|
| gg / G | Inicio / Fin del archivo |
| 0 / $ / ^ | Inicio / Fin / Primer no-blanco de línea |
| w/W | Palabra siguiente |
| b/B | Palabra anterior |
| e/E | Final de palabra |
| f{char} / F{char} | Buscar carácter adelante/atrás |
| t{char} / T{char} | Hasta carácter adelante/atrás |
| ; / , | Repetir última búsqueda f/F/t/T |

---

## 🧭 Movimiento Avanzado

| Comando | Acción |
|--------|--------|
| J/K (Visual) | Mover línea hacia abajo/arriba |
| J (Normal) | Unir líneas |
| Ctrl+d / u | Media página abajo/arriba |
| Ctrl+o / i | Saltos en jumplist |
| n / N | Buscar siguiente/anterior (centrado) |

---

## ✍️ Edición

| Comando | Acción |
|--------|--------|
| o / O | Nueva línea abajo/arriba en insert |
| A / I | Append / Insert en línea |
| s / S | Sustituir carácter / línea |
| C / D | Cambiar / Borrar hasta fin de línea |
| r{char} / R | Reemplazar carácter / Modo reemplazo |
| . | Repetir último comando |

---

## 🎯 Objetos de Texto

| Comando | Acción |
|--------|--------|
| daw / diw | Borrar palabra completa / actual |
| ciw / cw | Cambiar palabra actual / desde cursor |
| ci" / ca( | Cambiar dentro / alrededor de delimitador |
| vip / vis | Seleccionar párrafo / oración |
| vi{ / va{ | Dentro / Alrededor de llaves |

---

## 🔍 Búsqueda y Reemplazo

| Comando | Acción |
|--------|--------|
| / / ? | Buscar adelante / atrás |
| * / # | Buscar palabra bajo cursor |
| :%s/old/new/g | Reemplazar en todo el archivo |

---

## 🔠 Registros y Macros

| Comando | Acción |
|--------|--------|
| q{a-z} / q | Grabar macro / Detener |
| @{a-z} / @@ | Ejecutar macro / último macro |
| "+y / "+p | Copiar / pegar del sistema |
| "{a-z}y / "{a-z}p | Usar registros específicos |

---

## 💾 Comandos Modo Normal

| Comando | Acción |
|--------|--------|
| :w / :q / :wq / :q! | Guardar / Salir |
| :e filename | Abrir archivo |
| :bd | Cerrar buffer |

---

## 🧠 LSP (Language Server Protocol)

### Navegación

- `gd`, `gD`, `gi`, `gt`, `gR` → Definición, Declaración, Implementaciones, Tipo, Referencias
- `K` → Documentación
- `Ctrl+h` (Insert) → Signature Help

### Acciones y Diagnóstico

- `<leader>vca` → Acciones de código
- `<leader>rn` → Renombrar
- `<leader>D`, `<leader>,`, `<leader>lx` → Diagnósticos
- `<leader>rs` → Reiniciar LSP

---

## 🌈 Telescope

| Comando | Acción |
|--------|--------|
| `<leader>ff` | Archivos recientes |
| `<leader>ps` / `pWs` | Buscar texto / palabra bajo cursor |
| `<leader>pk` | Buscar keymaps |
| `<leader>pt` / `pT` | TODOs |
| `<leader>vh` | Ayuda de Vim |

---

## 🪟 Splits y Tabs

| Comando | Acción |
|--------|--------|
| `<leader>sv` / `sh` | Split vertical / horizontal |
| `<leader>se` / `sx` | Igualar / cerrar split |
| `<leader>to` / `tx` | Nueva / cerrar tab |
| `<leader>tn` / `tp` | Siguiente / anterior tab |

---

## 🛠️ Mini.nvim Plugins

### Mini.Files (explorador)

- `<leader>ee`, `<leader>ef` → Toggle / Abrir en archivo
- `-`, `H`, `L` → Navegar directorios

### Mini.Surround

- `sa`, `ds`, `sr` → Agregar / Borrar / Reemplazar

### Mini.Splitjoin

- `sj`, `sk` → Unir / Separar elementos

### Mini.Trailspace

- `<leader>cw` → Eliminar espacios blancos

---

## 🔃 Auto-Session

- `<leader>ss`, `sl`, `sr` → Guardar / Abrir / Restaurar sesión
- `<leader>sa`, `sD`, `sp` → Toggle / Desactivar / Purgar sesiones

---

## 🛑 Trouble

- `<leader>xw`, `xd`, `xq`, `xl`, `xt` → Diagnósticos, Quickfix, TODOs

---

## 💡 Git - Fugitive y Gitsigns

### Fugitive

- `<leader>gg`, `P`, `p`, `t` → Git status / push / pull / push -u

### Gitsigns

- `[h`, `]h` → Hunks anterior / siguiente
- `<leader>gs`, `gr`, `gS`, `gR`, `gp`, `gu`, `gbl`, `gB` → Stage, reset, blame, diff

### Snacks Git

- `<leader>lg`, `gl`, `gbr` → Lazygit, logs, cambiar branch

---

## 🔭 Harpoon

- `<leader>a` → Agregar archivo
- `Ctrl+e`, `y`, `i`, `n`, `s` → Toggle y saltos
- `Ctrl+Shift+P / N` → Navegación rápida

---

## 🌐 Tmux + Navegación de Wezterm

### Navegación

- `Ctrl+h/j/k/l` → Entre splits (tmux/vim)
- `Opt+Shift+H/J/K/L` → Entre paneles de wezterm
- `Opt+Shift+W` → Cerrar panel actual

---

## ⚙️ Utilidades

- `<leader>f` → Formatear con LSP
- `<leader>s` → Buscar y reemplazar globalmente
- `<leader>x` → Hacer archivo ejecutable
- `<leader>u` → Undotree
- `<leader>rN` → Renombrar archivo rápido
- `<leader>dB` → Borrar buffer con confirmación
- `<leader>th` → Selector de color schemes
- `<leader>fp` → Copiar path al clipboard

---

## 🌍 LSP Soportados

- **Lua**: `lua_ls`
- **Rust**: `rust_analyzer`
- **Python**: `pyright`
- **Solidity**: `solidity`
- **Java**: `jdtls`
- **HTML/CSS/Tailwind**: `html`, `cssls`, `tailwindcss`
- **TS/JS**: `tsserver`, `denols`
- **Markdown**: `marksman`

---

## Bonus

- Highlight al hacer yank automático
- Oil como file manager por defecto
- Cursorline visible en Oil

---

🎉 **Tip**: Usa `:e ~/.config/nvim/CHEATSHEET.md` para tenerla siempre a la mano.
