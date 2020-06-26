json.comment  @comment.comment
json.user_name  @comment.user.name

# jbuilderは、入力データをJSON形式で出力するテンプレートエンジン
# jbuilderは、viewと同じように該当するアクションと同じ名前にする必要がある
# commentのcreateアクションに対応するjbuilderのファイルになるので、作成するのはviews/comments/create.json.jbuilderになる
