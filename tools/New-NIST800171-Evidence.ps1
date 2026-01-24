# Creates 110 evidence stub files for NIST SP 800-171 Rev.2 requirements
# Output: compliance/evidence/<family>/3_1_1.md etc.

$controls = @(
  '3.1.1','3.1.2','3.1.3','3.1.4','3.1.5','3.1.6','3.1.7','3.1.8','3.1.9','3.1.10','3.1.11','3.1.12','3.1.13','3.1.14','3.1.15','3.1.16','3.1.17','3.1.18','3.1.19','3.1.20','3.1.21','3.1.22',
  '3.2.1','3.2.2','3.2.3',
  '3.3.1','3.3.2','3.3.3','3.3.4','3.3.5','3.3.6','3.3.7','3.3.8','3.3.9',
  '3.4.1','3.4.2','3.4.3','3.4.4','3.4.5','3.4.6','3.4.7','3.4.8','3.4.9',
  '3.5.1','3.5.2','3.5.3','3.5.4','3.5.5','3.5.6','3.5.7','3.5.8','3.5.9','3.5.10','3.5.11',
  '3.6.1','3.6.2','3.6.3',
  '3.7.1','3.7.2','3.7.3',
  '3.8.1','3.8.2','3.8.3','3.8.4','3.8.5','3.8.6',
  '3.9.1','3.9.2','3.9.3','3.9.4','3.9.5','3.9.6','3.9.7','3.9.8','3.9.9',
  '3.10.1','3.10.2',
  '3.11.1','3.11.2','3.11.3','3.11.4','3.11.5','3.11.6',
  '3.12.1','3.12.2','3.12.3','3.12.4',
  '3.13.1','3.13.2','3.13.3','3.13.4','3.13.5','3.13.6','3.13.7','3.13.8','3.13.9','3.13.10','3.13.11','3.13.12','3.13.13','3.13.14','3.13.15','3.13.16',
  '3.14.1','3.14.2','3.14.3','3.14.4','3.14.5','3.14.6','3.14.7'
)

$root = Join-Path $PSScriptRoot "..\compliance\evidence"
New-Item -ItemType Directory -Force -Path $root | Out-Null

foreach ($c in $controls) {
  $parts = $c.Split('.')
  $family = "3_$($parts[1])"              # e.g., 3_1, 3_2, ...
  $file   = $c.Replace('.','_') + ".md"   # e.g., 3_1_1.md

  $dirPath  = Join-Path $root $family
  $filePath = Join-Path $dirPath $file

  New-Item -ItemType Directory -Force -Path $dirPath | Out-Null

  if (-not (Test-Path $filePath)) {
@"
# NIST 800-171 Control $c

## Implementation summary
- What did we implement?

## Evidence
- Screenshot/log link:
- Pipeline run link:
- Config snippet link:

## Owner / Date
- Owner:
- Date:

## Status
- [ ] Not started
- [ ] In progress
- [ ] Implemented
- [ ] Verified
"@ | Out-File -FilePath $filePath -Encoding utf8
  }
}

Write-Host "Created/verified $($controls.Count) evidence files under: $root"
