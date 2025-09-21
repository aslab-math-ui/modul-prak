
default:
    @echo "Availbale tasks: render, test, clean"

upload modul path file:
    @echo "=========================================="
    @echo "===== UPLOADING FILES TO MAIN BRANCH ====="
    @echo "=========================================="
    git pull
    git add .
    git commit -m "Upload modul baru"
    git push

    @echo "==========================="
    @echo "===== RENDERING FILES ====="
    @echo "==========================="
    quarto render {{path}}.qmd
    cp docs/{{path}}.html ..

    @echo "======================================="
    @echo "===== SWITCHING TO BRANCH WEBSITE ====="
    @echo "======================================="
    git submodule deinit -f --all
    git switch website
    cp ../{{file}}.html docs/{{path}}.html
    
    @echo "========================================"
    @echo "===== UPLOADING CHANGES TO WEBSITE ====="
    @echo "========================================"
    git pull
    git add .
    git commit -m "Upload modul baru"
    git push

    @echo "========================================="
    @echo "===== SWITCHING BACK TO MAIN BRANCH ====="
    @echo "========================================="
    git switch main
    git submodule update --init --recursive