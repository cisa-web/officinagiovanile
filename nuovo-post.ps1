Write-Host ""
Write-Host "===============================" -ForegroundColor DarkGreen
Write-Host "  OFFICINA GIOVANILE - Nuovo Post" -ForegroundColor Green
Write-Host "===============================" -ForegroundColor DarkGreen
Write-Host ""

$titolo = Read-Host "Titolo del post (scrivi normalmente)"

if (-not $titolo) {
    Write-Host "Titolo vuoto. Operazione annullata." -ForegroundColor Red
    exit
}

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

$conferma = Read-Host "Confermi? (Invio = si / scrivi uno slug diverso)"
if ($conferma -ne "") {
    $slug = $conferma
}

$percorso = "news/$slug/index.md"
Write-Host ""
Write-Host "Creo il post..." -ForegroundColor Yellow
hugo new $percorso

Write-Host "Apro VSCode..." -ForegroundColor Yellow
code "content/$percorso"

Write-Host ""
Write-Host "Post creato!" -ForegroundColor Green
Write-Host "Percorso:" -ForegroundColor Gray
Write-Host "content/$percorso" -ForegroundColor Gray
Write-Host ""