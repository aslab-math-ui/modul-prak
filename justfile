
default:
    @echo "Availbale tasks: see, unsee, render, upload"

init:
    git submodule update --init --recursive
    cd modul/2025 && git switch main

see modul tahun:
    git submodule update --init --recursive modul/{{tahun}}

unsee modul tahun:
    git submodule deinit modul/{{tahun}}

seeAssets:
    git submodule update --init --recursive assets

unseeAssets:
    git submodule deinit assets

render path:
    quarto render {{path}}

uploadAssets:
    git submodule update --init --recursive assets
    cd assets && git switch main && git pull && git add . && git commit -m "Added new assets" && git push


upload modul path file ext:
    @echo "==========================="
    @echo "===== RENDERING FILES ====="
    @echo "==========================="
    quarto render {{path}}.{{ext}}
    cp docs/{{path}}.html ..

    @echo "========================================="
    @echo "===== UPLOADING FILES TO MODUL REPO ====="
    @echo "========================================="
    cd modul/{{modul}} && git switch main && git pull && git add . && git commit -m "Upload modul baru" && git push

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
    cd modul/2025 && git switch main
