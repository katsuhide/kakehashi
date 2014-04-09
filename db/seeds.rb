# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Keyword.first_or_create([
# 	{ tag_type: 'sake', tag: 'dassai', search_word: '獺祭', name: '獺祭', land_of_origin: '山口' },
# 	{ tag_type: 'sake', tag: 'koshinokanbai', search_word: '越乃寒梅', name: '越乃寒梅', land_of_origin: '新潟' },
# 	{ tag_type: 'sake', tag: 'goninnmusume', search_word: '五人娘', name: '五人娘', land_of_origin: '千葉' },
# 	{ tag_type: 'sake', tag: 'kenbishi', search_word: '剣菱', name: '剣菱', land_of_origin: '兵庫' },
# ])

def setup_keyword(keyword)
	if Keyword.where(tag:keyword[:tag]).size == 0 then
		Keyword.create(keyword)
	end
end

keywords = [
	## 北海道地方
	{ tag_type: 'sake', tag: 'kunimare', search_word: '国稀', name: '国稀', land_of_origin: '北海道' },

	## 東北地方
	{ tag_type: 'sake', tag: 'densyu', search_word: '田酒', name: '田酒', land_of_origin: '青森県' },
	{ tag_type: 'sake', tag: 'nanbubijin', search_word: '南部美人', name: '南部美人', land_of_origin: '岩手県' },
	{ tag_type: 'sake', tag: 'urakasumi', search_word: '浦霞', name: '浦霞', land_of_origin: '宮城県' },
	{ tag_type: 'sake', tag: 'shirataki', search_word: '白瀑', name: '白瀑', land_of_origin: '秋田県' },
	{ tag_type: 'sake', tag: 'juyondai', search_word: '十四代', name: '十四代', land_of_origin: '山形県' },
	{ tag_type: 'sake', tag: 'hiroki', search_word: '飛露喜', name: '飛露喜', land_of_origin: '福島県' },

	## 関東地方
	{ tag_type: 'sake', tag: 'satonohomare', search_word: '郷乃誉', name: '郷乃誉', land_of_origin: '茨城県' },
	{ tag_type: 'sake', tag: 'hououbiden', search_word: '鳳凰美田', name: '鳳凰美田', land_of_origin: '栃木県' },
	{ tag_type: 'sake', tag: 'ozenoyukidoke', search_word: '尾瀬の雪どけ', name: '尾瀬の雪どけ', land_of_origin: '群馬県' },
	{ tag_type: 'sake', tag: 'shinkame', search_word: '神亀', name: '神亀', land_of_origin: '埼玉県' },
	{ tag_type: 'sake', tag: 'goninnmusume', search_word: '五人娘', name: '五人娘', land_of_origin: '千葉県' },
	{ tag_type: 'sake', tag: 'sawanoi', search_word: '澤乃井', name: '澤乃井', land_of_origin: '東京都' },
	{ tag_type: 'sake', tag: 'izumibashi', search_word: 'いづみ橋', name: 'いづみ橋', land_of_origin: '神奈川県' },

	## 中部地方
	{ tag_type: 'sake', tag: 'kubota', search_word: '久保田', name: '久保田', land_of_origin: '新潟県' },
	{ tag_type: 'sake', tag: 'masuizumi', search_word: '満寿泉', name: '満寿泉', land_of_origin: '富山県' },
	{ tag_type: 'sake', tag: 'tengumai', search_word: '天狗舞', name: '天狗舞', land_of_origin: '石川県' },
	{ tag_type: 'sake', tag: 'kokuryu', search_word: '黒龍', name: '黒龍', land_of_origin: '福井県' },
	{ tag_type: 'sake', tag: 'shunnoten', search_word: '春鶯囀', name: '春鶯囀', land_of_origin: '山梨県' },
	{ tag_type: 'sake', tag: 'masumi', search_word: '真澄', name: '真澄', land_of_origin: '長野県' },
	{ tag_type: 'sake', tag: 'michisakari', search_word: '三千盛', name: '三千盛', land_of_origin: '岐阜県' },
	{ tag_type: 'sake', tag: 'garyubai', search_word: '臥龍梅', name: '臥龍梅', land_of_origin: '静岡県' },
	{ tag_type: 'sake', tag: 'kuheiji', search_word: '醸し人九平次', name: '醸し人九平次', land_of_origin: '愛知県' },

	## 近畿地方
	{ tag_type: 'sake', tag: 'mienishiki', search_word: '三重錦', name: '三重錦', land_of_origin: '三重県' },
	{ tag_type: 'sake', tag: 'daijiro', search_word: '大治郎', name: '大治郎', land_of_origin: '滋賀県' },
	{ tag_type: 'sake', tag: 'tamanohikari', search_word: '玉乃光', name: '玉乃光', land_of_origin: '京都府' },
	{ tag_type: 'sake', tag: 'akishika', search_word: '秋鹿', name: '秋鹿', land_of_origin: '大阪府' },
	{ tag_type: 'sake', tag: 'kenbishi', search_word: '剣菱', name: '剣菱', land_of_origin: '兵庫県' },
	{ tag_type: 'sake', tag: 'kazenomori', search_word: '風の森', name: '風の森', land_of_origin: '奈良県' },
	{ tag_type: 'sake', tag: 'kuroushi', search_word: '黒牛', name: '黒牛', land_of_origin: '和歌山県' },

	## 中国地方
	{ tag_type: 'sake', tag: 'takaisami', search_word: '鷹勇', name: '鷹勇', land_of_origin: '鳥取県' },
	{ tag_type: 'sake', tag: 'rihaku', search_word: '李白', name: '李白', land_of_origin: '島根県' },
	{ tag_type: 'sake', tag: 'sakehitosuji', search_word: '酒一筋', name: '酒一筋', land_of_origin: '岡山県' },
	{ tag_type: 'sake', tag: 'taketsuru', search_word: '竹鶴', name: '竹鶴', land_of_origin: '広島県' },
	{ tag_type: 'sake', tag: 'dassai', search_word: '獺祭', name: '獺祭', land_of_origin: '山口県' },

	## 四国地方
	{ tag_type: 'sake', tag: 'miyoshikiku', search_word: '三芳菊', name: '三芳菊', land_of_origin: '徳島県' },
	{ tag_type: 'sake', tag: 'yorokobigaijin', search_word: '悦凱陣', name: '悦凱陣', land_of_origin: '香川県' },
	{ tag_type: 'sake', tag: 'ishizuchi', search_word: '石鎚', name: '石鎚', land_of_origin: '愛媛県' },
	{ tag_type: 'sake', tag: 'minami', search_word: '南', name: '南', land_of_origin: '高知県' },

	## 九州地方
	{ tag_type: 'sake', tag: 'niwanouguisu', search_word: '庭のうぐいす', name: '庭のうぐいす', land_of_origin: '福岡県' },
	{ tag_type: 'sake', tag: 'azumaichi', search_word: '東一', name: '東一', land_of_origin: '佐賀県' },
	{ tag_type: 'sake', tag: '64sake', search_word: '六十餘洲', name: '六十餘洲', land_of_origin: '長崎県' },
	{ tag_type: 'sake', tag: 'reizan', search_word: 'れいざん', name: 'れいざん', land_of_origin: '熊本県' },
	{ tag_type: 'sake', tag: 'takakiya', search_word: '鷹来屋', name: '鷹来屋', land_of_origin: '大分県' },
	{ tag_type: 'sake', tag: 'yumenonakamade', search_word: '夢の中まで', name: '夢の中まで', land_of_origin: '宮崎県' },
	{ tag_type: 'sake', tag: 'kojyu', search_word: '幸寿', name: '幸寿', land_of_origin: '鹿児島県' },
	{ tag_type: 'sake', tag: 'reimei', search_word: '黎明', name: '黎明', land_of_origin: '沖縄県' },
]

keywords.each do |keyword| setup_keyword(keyword) end

# create day_trends
rank = 1
Keyword.all.each do | keyword|
	row = DayTrend.new()
	row['keyword_id'] = keyword['id']
	row['total_count'] = 0
	row['base_date'] = Date.today()
	row['rank'] = rank
	rank += 1
	if DayTrend.where(base_date: row['base_date'], keyword_id: row['keyword_id']).count == 0 then
		row.save
	end
end
