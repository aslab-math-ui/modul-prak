
default:
    @echo "Availbale tasks: render, test, clean"

upload modul path file:
    @echo "Uploading files to main branch"
    git pull
    git add .
    git commit -m "Upload modul baru"
    git push

    @echo "Rendering files"
    quarto render {{path}}.qmd
    cp docs/{{path}}.html ..

    @echo "Switching to branch website"
    git submodule deinit -f --all
    git switch website
    cp ../{{file}}.html docs/{{path}}.html

    @echo "Uploading changes to website"
    git pull
    git add .
    git commit -m "Upload modul baru"
    git push

    @echo"Switching back to main branch"
    git switch main
    git submodule update --init --recursive