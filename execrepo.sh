gh repo create inf-017  -d "repositorio dos scripts de redes 2"  --private
git init
echo "Repositorio criado automaticamente" >> README.md
git add *
git commit -m "primeiro commit do README.md"
git remote add origin git@github.com:ediltonx/inf-017
git push origin master
