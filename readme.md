\# Football Pivot — Premier League 2024/25



End-to-end mini-pipeline: \*\*Power Query → Excel → SQL\*\*.  

Celem jest odtworzenie i wizualizacja zależności między  

\*Goal Difference\* a % zwycięstw u siebie (r ≈ 0,96) oraz szybkie wskazanie odstępstw \*(outliers)\*.



---



\## 📁 Struktura repo



| Folder / plik | Zawartość | Jak użyć |

|---------------|-----------|---------|

| `data/raw/` | oryginalny CSV | zostaw bez zmian |

| `data/clean/` | `e02024-2025clean.csv` (po PQ) | źródło do BULK INSERT |

| `etl/01\_clean\_E0\_2024.m` | kod Power Query | wklej w Excel/Power BI ➜ Puste zapytanie |

| `sql/\*.sql` | skrypty CREATE / BULK / KPI | uruchom w SSMS lub sqlcmd |

| `excel/e02024-2025pivot.xlsx` | pivot + formatowanie | UI demo |

| `screenshots/\*.png` | podglądy wyników | używane poniżej |



---



\## 🚀 Szybki start (SQL Server)



```sql

-- 1) struktura

:r sql/createtable.sql



-- 2) import danych

:r sql/bulk insert.sql



-- 3) KPI + outliers

:r sql/kpi and outliers.sql

