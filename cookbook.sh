DATE=`date +%Y-%m-%d`-1

# templateをcopy
cp -n template.lhs recipes/$DATE.lhs

# 今日のcookbookをエディタで開く
# subl --project haskell-cookbook.sublime-project recipes/$DATE-1.lhs
subl recipes/$DATE.lhs --project haskell-cookbook.sublime-project

# tempalteのbuildが終わるのを待って確認用のbrowserを開く
./preview.sh &

# livereloadとhakyll previewを実行
runghc ./site.hs preview
