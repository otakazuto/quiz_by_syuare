# README

* tailwindcssのbuild方法... docker-compose exec web rails tailwindcss:build

* アセットコンパイルのコマンド... docker-compose exec web bundle exec rails assets:precompile

* tailwwindcssの変更を反映させる手順(feature/add_qustion_submissionブランチ時点)
    
    tailwindcssの変更を保存
            ↓
    docker-compose exec web bundle exec rails assets:precompile
            ↓
    dockerコンテナの再起動

# quiz_by_syuare
