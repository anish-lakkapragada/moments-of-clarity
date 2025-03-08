# fall 2024 term 
rsync -av --delete ~/Documents/classes/old-classes/math-226/psets notes/math-226
rsync -av --delete ~/Documents/classes/old-classes/math-226/sols notes/math-226

sh rename-files.sh notes/math-226/psets
sh rename-files.sh notes/math-226/sols

rsync -av --delete ~/Documents/classes/old-classes/stats-241/psets notes/stats-241
rsync -av --delete ~/Documents/classes/old-classes/stats-241/sols notes/stats-241

sh rename-files.sh notes/stats-241/psets
sh rename-files.sh notes/stats-241/sols

# spring 2025 term 
rsync -av --delete ~/Documents/math-255/psets notes/math-255
rsync -av --delete ~/Documents/math-255/sols notes/math-255

sh rename-files.sh notes/math-255/psets
sh rename-files.sh notes/math-255/sols

rsync -av --delete ~/Documents/math-244/psets notes/math-244
rsync -av --delete ~/Documents/math-244/sols notes/math-244

sh rename-files.sh notes/math-244/psets
sh rename-files.sh notes/math-244/sols

rsync -av --delete ~/Documents/stats-242/psets notes/stats-242
rsync -av --delete ~/Documents/stats-242/sols notes/stats-242

sh rename-files.sh notes/stats-242/psets
sh rename-files.sh notes/stats-242/sols

sh build.sh

git add . 
git commit -m "nightly build" 
git push