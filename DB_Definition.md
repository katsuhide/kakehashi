# DB Definition
## Keyword
### Purpose
検索キーワード及びその情報を保存する

### Definition
column | comment
--- | ---
tag_type | キーワードのカテゴリー
tag | キーワードとして保存される情報
keyword | 実際に検索されるキーワード
name | 名称
land_of_origin | 原産地（酒限定のため、このへんは後で再定義する）

## Trend
### Purpose
検索されたデータ量を保存するテーブル

### Definition
column | comment
--- | ---
keyword_id | 外部キー
count | 検索結果の量
search_datetime | 検索された時間

## Day
### Purpose
日単位のトレンドデータ

### Definition
column | comment
--- | ---
keyword_id | 外部キー
total_count | 検索結果の量
base_date | 基準日
rank | カテゴリー内のランキング

