# 1. ベースとなるDockerイメージを指定
# データサイエンス向けのライブラリが豊富な scipy-notebook を使用
FROM jupyter/scipy-notebook:latest

# 2. 権限をrootユーザーに変更してパッケージをインストール
# (Jupyter公式イメージは一般ユーザー`jovyan`で実行されるため)
USER root

# 3. requirements.txtをコンテナ内にコピー
COPY requirements.txt .

# 4. pipでrequirements.txtに記載のライブラリをインストール
# --no-cache-dir オプションでキャッシュを残さず、イメージサイズを削減
RUN pip install --no-cache-dir -r requirements.txt

# 5. 権限を元の一般ユーザー`jovyan`に戻す (セキュリティ上推奨)
USER ${NB_USER}
