# -----------------------------------------------
# OFFICINA GIOVANILE — Nuovo Post
# -----------------------------------------------

Write-Host ""
Write-Host "===============================" -ForegroundColor DarkGreen
Write-Host "  OFFICINA GIOVANILE — Nuovo Post" -ForegroundColor Green
Write-Host "===============================" -ForegroundColor DarkGreen
Write-Host ""

# Chiede il titolo
$titolo = Read-Host "Titolo del post (scrivi normalmente)"

if (-not $titolo) {
    Write-Host "Titolo vuoto. Operazione annullata." -ForegroundColor Red
    exit
}

# Converte in slug
$slug = $titolo.ToLower()
$slug = $slug -replace '[àáâãäå]', 'a'
$slug = $slug -replace '[èéêë]', 'e'
$slug = $slug -replace '[ìíîï]', 'i'
$slug = $slug -replace '[òóôõö]', 'o'
$slug = $slug -replace '[ùúûü]', 'u'
$slug = $slug -replace '[^a-z0-9\s-]', ''
$slug = $slug -replace '\s+', '-'
$slug = $slug.Trim('-')

Write-Host ""
Write-Host "Slug generato: " -NoNewline
Write-Host $slug -ForegroundColor Cyan
Write-Host ""

# Conferma
$conferma = Read-Host "Confermi? (Invio = sì / scrivi un slug diverso)"
if ($conferma -ne "") {
    $slug = $conferma
}

# Crea il post con Hugo
$percorso = "news/$slug/index.md"
Write-Host ""
Write-Host "Creo il post..." -ForegroundColor Yellow
hugo new $percorso

# Apre VSCode
Write-Host "Apro VSCode..." -ForegroundColor Yellow
code "content/$percorso"

Write-Host ""
Write-Host "Post creato!" -ForegroundColor Green
Write-Host "Percorso: content/$percorso" -ForegroundColor Gray
Write-Host ""