* tailwindcssのbuild方法... docker-compose exec web rails tailwindcss:build  
* アセットコンパイルのコマンド... docker-compose exec web bundle exec rails assets:precompile
* Rspecの実行コマンド... docker-compose exec web bundle exec rspec  

##### tailwwindcssの変更を反映させる手順(feature/add_qustion_submissionブランチ時点)
1. tailwindcssの変更を保存<br>
   ↓<br>
2. docker-compose exec web bundle exec rails assets:precompile<br>
   ↓<br>
3. dockerコンテナの再起動