# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# get keyword_id
def get_keyword_id(tag)
	return Keyword.where(tag:tag).take(1).pop['id']
end

#########################################################
# setup the keyword data
#########################################################
def setup_keyword(keyword)
	if Keyword.where(tag:keyword[:tag]).size == 0 then
		Keyword.create(keyword)
	end
end

keywords = [
	## Sake
	{ tag_type: 'sake', tag: 'kunimare', name: '国稀', image_url: 'kunimare.jpg' },
	{ tag_type: 'sake', tag: 'densyu', name: '田酒', image_url: 'densyu.jpg' },
	{ tag_type: 'sake', tag: 'nanbubijin', name: '南部美人', image_url: 'nanbubijin.jpg' },
	{ tag_type: 'sake', tag: 'urakasumi', name: '浦霞', image_url: 'urakasumi.jpg' },
	{ tag_type: 'sake', tag: 'shirataki', name: '白瀑', image_url: 'shirataki.jpg' },
	{ tag_type: 'sake', tag: 'juyondai', name: '十四代', image_url: 'juyondai.jpg' },
	{ tag_type: 'sake', tag: 'hiroki', name: '飛露喜', image_url: 'hiroki.jpg' },
	{ tag_type: 'sake', tag: 'satonohomare', name: '郷乃誉', image_url: 'satonohomare.jpg' },
	{ tag_type: 'sake', tag: 'hououbiden', name: '鳳凰美田', image_url: 'hououbiden.jpg' },
	{ tag_type: 'sake', tag: 'ozenoyukidoke', name: '尾瀬の雪どけ', image_url: 'ozenoyukidoke.jpg' },
	{ tag_type: 'sake', tag: 'shinkame', name: '神亀', image_url: 'shinkame.jpg' },
	{ tag_type: 'sake', tag: 'goninnmusume', name: '五人娘', image_url: 'goninnmusume.jpg' },
	{ tag_type: 'sake', tag: 'sawanoi', name: '澤乃井', image_url: 'sawanoi.jpg' },
	{ tag_type: 'sake', tag: 'izumibashi', name: 'いづみ橋', image_url: 'izumibashi.jpg' },
	{ tag_type: 'sake', tag: 'kubota', name: '久保田', image_url: 'kubota.jpg' },
	{ tag_type: 'sake', tag: 'masuizumi', name: '満寿泉', image_url: 'masuizumi.jpg' },
	{ tag_type: 'sake', tag: 'tengumai', name: '天狗舞', image_url: 'tengumai.jpg' },
	{ tag_type: 'sake', tag: 'kokuryu', name: '黒龍', image_url: 'kokuryu.jpg' },
	{ tag_type: 'sake', tag: 'shunnoten', name: '春鶯囀', image_url: 'shunnoten.jpg' },
	{ tag_type: 'sake', tag: 'masumi', name: '真澄', image_url: 'masumi.jpg' },
	{ tag_type: 'sake', tag: 'michisakari', name: '三千盛', image_url: 'michisakari.jpg' },
	{ tag_type: 'sake', tag: 'garyubai', name: '臥龍梅', image_url: 'garyubai.jpg' },
	{ tag_type: 'sake', tag: 'kuheiji', name: '醸し人九平次', image_url: 'kuheiji.jpg' },
	{ tag_type: 'sake', tag: 'mienishiki', name: '三重錦', image_url: 'mienishiki.jpg' },
	{ tag_type: 'sake', tag: 'daijiro', name: '大治郎', image_url: 'daijiro.jpg' },
	{ tag_type: 'sake', tag: 'tamanohikari', name: '玉乃光', image_url: 'tamanohikari.jpg' },
	{ tag_type: 'sake', tag: 'akishika', name: '秋鹿', image_url: 'akishika.jpg' },
	{ tag_type: 'sake', tag: 'kenbishi', name: '剣菱', image_url: 'kenbishi.jpg' },
	{ tag_type: 'sake', tag: 'kazenomori', name: '風の森', image_url: 'kazenomori.jpg' },
	{ tag_type: 'sake', tag: 'kuroushi', name: '黒牛', image_url: 'kuroushi.jpg' },
	{ tag_type: 'sake', tag: 'takaisami', name: '鷹勇', image_url: 'takaisami.jpg' },
	{ tag_type: 'sake', tag: 'rihaku', name: '李白', image_url: 'rihaku.jpg' },
	{ tag_type: 'sake', tag: 'sakehitosuji', name: '酒一筋', image_url: 'sakehitosuji.jpg' },
	{ tag_type: 'sake', tag: 'taketsuru', name: '竹鶴', image_url: 'taketsuru.jpg' },
	{ tag_type: 'sake', tag: 'dassai', name: '獺祭', image_url: 'dassai.jpg' },
	{ tag_type: 'sake', tag: 'miyoshikiku', name: '三芳菊', image_url: 'miyoshikiku.jpg' },
	{ tag_type: 'sake', tag: 'yorokobigaijin', name: '悦凱陣', image_url: 'yorokobigaijin.jpg' },
	{ tag_type: 'sake', tag: 'ishizuchi', name: '石鎚', image_url: 'ishizuchi.jpg' },
	{ tag_type: 'sake', tag: 'minami', name: '南', image_url: 'minami.jpg' },
	{ tag_type: 'sake', tag: 'niwanouguisu', name: '庭のうぐいす', image_url: 'niwanouguisu.jpg' },
	{ tag_type: 'sake', tag: 'azumaichi', name: '東一', image_url: 'azumaichi.jpg' },
	{ tag_type: 'sake', tag: '64sake', name: '六十餘洲', image_url: '64sake.jpg' },
	{ tag_type: 'sake', tag: 'reizan', name: 'れいざん', image_url: 'reizan.jpg' },
	{ tag_type: 'sake', tag: 'takakiya', name: '鷹来屋', image_url: 'takakiya.jpg' },
	{ tag_type: 'sake', tag: 'yumenonakamade', name: '夢の中まで', image_url: 'yumenonakamade.jpg' },
	{ tag_type: 'sake', tag: 'kojyu', name: '幸寿', image_url: 'kojyu.jpg' },
	{ tag_type: 'sake', tag: 'reimei', name: '黎明', image_url: 'reimei.jpg' },

	## Traditional
	{ tag_type: 'traditional', tag: 'aiduhongo', name: '会津本郷焼', image_url: 'aiduhongo.jpg' },
	{ tag_type: 'traditional', tag: 'oborisoma', name: '大堀相馬焼', image_url: 'oborisoma.jpg' },
	{ tag_type: 'traditional', tag: 'akadu', name: '赤津焼', image_url: 'akadu.jpg' },
	{ tag_type: 'traditional', tag: 'kasama', name: '笠間焼', image_url: 'kasama.jpg' },
	{ tag_type: 'traditional', tag: 'masiko', name: '益子焼', image_url: 'masiko.jpg' },
	{ tag_type: 'traditional', tag: 'echizen', name: '越前焼', image_url: 'echizen.jpg' },
	{ tag_type: 'traditional', tag: 'kutani', name: '九谷焼', image_url: 'kutani.jpg' },
	{ tag_type: 'traditional', tag: 'iga', name: '伊賀焼', image_url: 'iga.jpg' },
	{ tag_type: 'traditional', tag: 'setosometuke', name: '瀬戸染付焼', image_url: 'setosometuke.jpg' },
	{ tag_type: 'traditional', tag: 'tokoname', name: '常滑焼', image_url: 'tokoname.jpg' },
	{ tag_type: 'traditional', tag: 'mino', name: '美濃焼', image_url: 'mino.jpg' },
	{ tag_type: 'traditional', tag: 'yokkaichibanko', name: '四日市萬古焼', image_url: 'yokkaichibanko.jpg' },
	{ tag_type: 'traditional', tag: 'izushi', name: '出石焼', image_url: 'izushi.jpg' },
	{ tag_type: 'traditional', tag: 'kyo', name: '京焼', image_url: 'kyo.jpg' },
	{ tag_type: 'traditional', tag: 'kiyomizu', name: '清水焼', image_url: 'kiyomizu.jpg' },
	{ tag_type: 'traditional', tag: 'shigara', name: '信楽焼', image_url: 'shigara.jpg' },
	{ tag_type: 'traditional', tag: 'tanbatachikui', name: '丹波立杭焼', image_url: 'tanbatachikui.jpg' },
	{ tag_type: 'traditional', tag: 'iwami', name: '石見焼', image_url: 'iwami.jpg' },
	{ tag_type: 'traditional', tag: 'bizen', name: '備前焼', image_url: 'bizen.jpg' },
	{ tag_type: 'traditional', tag: 'tobe', name: '砥部焼', image_url: 'tobe.jpg' },
	{ tag_type: 'traditional', tag: 'agano', name: '上野焼', image_url: 'agano.jpg' },
	{ tag_type: 'traditional', tag: 'arita', name: '有田焼', image_url: 'arita.jpg' },
	{ tag_type: 'traditional', tag: 'imari', name: '伊万里焼', image_url: 'imari.jpg' },
	{ tag_type: 'traditional', tag: 'karatuyaki', name: '唐津焼', image_url: 'karatuyaki.jpg' },
	{ tag_type: 'traditional', tag: 'koishiwara', name: '小石原焼', image_url: 'koishiwara.jpg' },
	{ tag_type: 'traditional', tag: 'tuboya', name: '壺屋焼', image_url: 'tuboya.jpg' },
	{ tag_type: 'traditional', tag: 'hasami', name: '波佐見焼', image_url: 'hasami.jpg' },
	{ tag_type: 'traditional', tag: 'mikawachi', name: '三川内焼', image_url: 'mikawachi.jpg' },

]

keywords.each do |keyword| setup_keyword(keyword) end

#########################################################
# setup the search_condition data
#########################################################
def setup_search_condition(row)
	keyword_id = get_keyword_id(row[:tag])
	if SearchCondition.where(keyword_id: keyword_id).size == 0 then
		data = {}
		data[:keyword_id] = keyword_id
		data[:search_word] = row[:search_word]
		SearchCondition.create(data)
	end
end

search_conditions = [
	{ search_word: '国稀 酒', tag: 'kunimare' },
	{ search_word: '田酒 酒', tag: 'densyu' },
	{ search_word: '南部美人 酒', tag: 'nanbubijin' },
	{ search_word: '浦霞 酒', tag: 'urakasumi' },
	{ search_word: '白瀑 酒', tag: 'shirataki' },
	{ search_word: '十四代 酒', tag: 'juyondai' },
	{ search_word: '飛露喜 酒', tag: 'hiroki' },
	{ search_word: '郷乃誉 酒', tag: 'satonohomare' },
	{ search_word: '鳳凰美田 酒', tag: 'hououbiden' },
	{ search_word: '尾瀬の雪どけ 酒', tag: 'ozenoyukidoke' },
	{ search_word: '神亀 酒', tag: 'shinkame' },
	{ search_word: '五人娘 酒', tag: 'goninnmusume' },
	{ search_word: '澤乃井 酒', tag: 'sawanoi' },
	{ search_word: 'いづみ橋 酒', tag: 'izumibashi' },
	{ search_word: '久保田 酒', tag: 'kubota' },
	{ search_word: '満寿泉 酒', tag: 'masuizumi' },
	{ search_word: '天狗舞 酒', tag: 'tengumai' },
	{ search_word: '黒龍 酒', tag: 'kokuryu' },
	{ search_word: '春鶯囀 酒', tag: 'shunnoten' },
	{ search_word: '真澄 酒', tag: 'masumi' },
	{ search_word: '三千盛 酒', tag: 'michisakari' },
	{ search_word: '臥龍梅 酒', tag: 'garyubai' },
	{ search_word: '醸し人九平次 酒', tag: 'kuheiji' },
	{ search_word: '三重錦 酒', tag: 'mienishiki' },
	{ search_word: '大治郎 酒', tag: 'daijiro' },
	{ search_word: '玉乃光 酒', tag: 'tamanohikari' },
	{ search_word: '秋鹿 酒', tag: 'akishika' },
	{ search_word: '剣菱 酒', tag: 'kenbishi' },
	{ search_word: '風の森 酒', tag: 'kazenomori' },
	{ search_word: '黒牛 酒', tag: 'kuroushi' },
	{ search_word: '鷹勇 酒', tag: 'takaisami' },
	{ search_word: '李白 酒', tag: 'rihaku' },
	{ search_word: '酒一筋 酒', tag: 'sakehitosuji' },
	{ search_word: '竹鶴 酒', tag: 'taketsuru' },
	{ search_word: '獺祭 酒', tag: 'dassai' },
	{ search_word: '三芳菊 酒', tag: 'miyoshikiku' },
	{ search_word: '悦凱陣 酒', tag: 'yorokobigaijin' },
	{ search_word: '石鎚 酒', tag: 'ishizuchi' },
	{ search_word: '南 酒', tag: 'minami' },
	{ search_word: '庭のうぐいす 酒', tag: 'niwanouguisu' },
	{ search_word: '東一 酒', tag: 'azumaichi' },
	{ search_word: '六十餘洲 酒', tag: '64sake' },
	{ search_word: 'れいざん 酒', tag: 'reizan' },
	{ search_word: '鷹来屋 酒', tag: 'takakiya' },
	{ search_word: '夢の中まで 酒', tag: 'yumenonakamade' },
	{ search_word: '幸寿 酒', tag: 'kojyu' },
	{ search_word: '黎明 酒', tag: 'reimei' },

	## Traditional
	{ search_word: '会津本郷焼', tag: 'aiduhongo' },
	{ search_word: '大堀相馬焼', tag: 'oborisoma' },
	{ search_word: '赤津焼', tag: 'akadu' },
	{ search_word: '笠間焼', tag: 'kasama' },
	{ search_word: '益子焼', tag: 'masiko' },
	{ search_word: '越前焼', tag: 'echizen' },
	{ search_word: '九谷焼', tag: 'kutani' },
	{ search_word: '伊賀焼', tag: 'iga' },
	{ search_word: '瀬戸染付焼', tag: 'setosometuke' },
	{ search_word: '常滑焼', tag: 'tokoname' },
	{ search_word: '美濃焼', tag: 'mino' },
	{ search_word: '四日市萬古焼', tag: 'yokkaichibanko' },
	{ search_word: '出石焼', tag: 'izushi' },
	{ search_word: '京焼', tag: 'kyo' },
	{ search_word: '清水焼', tag: 'kiyomizu' },
	{ search_word: '信楽焼', tag: 'shigara' },
	{ search_word: '丹波立杭焼', tag: 'tanbatachikui' },
	{ search_word: '石見焼', tag: 'iwami' },
	{ search_word: '備前焼', tag: 'bizen' },
	{ search_word: '砥部焼', tag: 'tobe' },
	{ search_word: '上野焼', tag: 'agano' },
	{ search_word: '有田焼', tag: 'arita' },
	{ search_word: '伊万里焼', tag: 'imari' },
	{ search_word: '唐津焼', tag: 'karatuyaki' },
	{ search_word: '小石原焼', tag: 'koishiwara' },
	{ search_word: '壺屋焼', tag: 'tuboya' },
	{ search_word: '波佐見焼', tag: 'hasami' },
	{ search_word: '三川内焼', tag: 'mikawachi' },

]
search_conditions.each do |row| setup_search_condition(row) end

#########################################################
# setup the sake data
#########################################################
def setup_sake(row)
	keyword_id = get_keyword_id(row[:tag])
	if Sake.where(keyword_id: keyword_id).size == 0 then
		data = {}
		data[:keyword_id] = keyword_id
		data[:land_of_origin] = row[:land_of_origin]
		Sake.create(data)
	end
end

sakes = [
	{ land_of_origin: '北海道', tag: 'kunimare' },
	{ land_of_origin: '青森県', tag: 'densyu' },
	{ land_of_origin: '岩手県', tag: 'nanbubijin' },
	{ land_of_origin: '宮城県', tag: 'urakasumi' },
	{ land_of_origin: '秋田県', tag: 'shirataki' },
	{ land_of_origin: '山形県', tag: 'juyondai' },
	{ land_of_origin: '福島県', tag: 'hiroki' },
	{ land_of_origin: '茨城県', tag: 'satonohomare' },
	{ land_of_origin: '栃木県', tag: 'hououbiden' },
	{ land_of_origin: '群馬県', tag: 'ozenoyukidoke' },
	{ land_of_origin: '埼玉県', tag: 'shinkame' },
	{ land_of_origin: '千葉県', tag: 'goninnmusume' },
	{ land_of_origin: '東京都', tag: 'sawanoi' },
	{ land_of_origin: '神奈川県', tag: 'izumibashi' },
	{ land_of_origin: '新潟県', tag: 'kubota' },
	{ land_of_origin: '富山県', tag: 'masuizumi' },
	{ land_of_origin: '石川県', tag: 'tengumai' },
	{ land_of_origin: '福井県', tag: 'kokuryu' },
	{ land_of_origin: '山梨県', tag: 'shunnoten' },
	{ land_of_origin: '長野県', tag: 'masumi' },
	{ land_of_origin: '岐阜県', tag: 'michisakari' },
	{ land_of_origin: '静岡県', tag: 'garyubai' },
	{ land_of_origin: '愛知県', tag: 'kuheiji' },
	{ land_of_origin: '三重県', tag: 'mienishiki' },
	{ land_of_origin: '滋賀県', tag: 'daijiro' },
	{ land_of_origin: '京都府', tag: 'tamanohikari' },
	{ land_of_origin: '大阪府', tag: 'akishika' },
	{ land_of_origin: '兵庫県', tag: 'kenbishi' },
	{ land_of_origin: '奈良県', tag: 'kazenomori' },
	{ land_of_origin: '和歌山県', tag: 'kuroushi' },
	{ land_of_origin: '鳥取県', tag: 'takaisami' },
	{ land_of_origin: '島根県', tag: 'rihaku' },
	{ land_of_origin: '岡山県', tag: 'sakehitosuji' },
	{ land_of_origin: '広島県', tag: 'taketsuru' },
	{ land_of_origin: '山口県', tag: 'dassai' },
	{ land_of_origin: '徳島県', tag: 'miyoshikiku' },
	{ land_of_origin: '香川県', tag: 'yorokobigaijin' },
	{ land_of_origin: '愛媛県', tag: 'ishizuchi' },
	{ land_of_origin: '高知県', tag: 'minami' },
	{ land_of_origin: '福岡県', tag: 'niwanouguisu' },
	{ land_of_origin: '佐賀県', tag: 'azumaichi' },
	{ land_of_origin: '長崎県', tag: '64sake' },
	{ land_of_origin: '熊本県', tag: 'reizan' },
	{ land_of_origin: '大分県', tag: 'takakiya' },
	{ land_of_origin: '宮崎県', tag: 'yumenonakamade' },
	{ land_of_origin: '鹿児島県', tag: 'kojyu' },
	{ land_of_origin: '沖縄県', tag: 'reimei' },
]

sakes.each do |row| setup_sake(row) end

#########################################################
# setup the traditional data
#########################################################
def setup_traditional(row)
	keyword_id = get_keyword_id(row[:tag])
	if Traditional.where(keyword_id: keyword_id).size == 0 then
		data = {}
		data[:keyword_id] = keyword_id
		data[:land_of_origin] = row[:land_of_origin]
		Traditional.create(data)
	end
end

traditionals = [
	{ land_of_origin: '福島県', tag: 'aiduhongo' },
	{ land_of_origin: '福島県', tag: 'oborisoma' },
	{ land_of_origin: '愛知県', tag: 'akadu' },
	{ land_of_origin: '茨木県', tag: 'kasama' },
	{ land_of_origin: '栃木県', tag: 'masiko' },
	{ land_of_origin: '福井県', tag: 'echizen' },
	{ land_of_origin: '石川県', tag: 'kutani' },
	{ land_of_origin: '三重県', tag: 'iga' },
	{ land_of_origin: '愛知県', tag: 'setosometuke' },
	{ land_of_origin: '愛知県', tag: 'tokoname' },
	{ land_of_origin: '岐阜県', tag: 'mino' },
	{ land_of_origin: '三重県', tag: 'yokkaichibanko' },
	{ land_of_origin: '兵庫県', tag: 'izushi' },
	{ land_of_origin: '京都府', tag: 'kyo' },
	{ land_of_origin: '京都府', tag: 'kiyomizu' },
	{ land_of_origin: '滋賀県', tag: 'shigara' },
	{ land_of_origin: '兵庫県', tag: 'tanbatachikui' },
	{ land_of_origin: '島根県', tag: 'iwami' },
	{ land_of_origin: '岡山県', tag: 'bizen' },
	{ land_of_origin: '愛媛県', tag: 'tobe' },
	{ land_of_origin: '福岡県', tag: 'agano' },
	{ land_of_origin: '佐賀県', tag: 'arita' },
	{ land_of_origin: '佐賀県', tag: 'imari' },
	{ land_of_origin: '佐賀県', tag: 'karatuyaki' },
	{ land_of_origin: '福岡県', tag: 'koishiwara' },
	{ land_of_origin: '沖縄県', tag: 'tuboya' },
	{ land_of_origin: '長崎県', tag: 'hasami' },
	{ land_of_origin: '長崎県', tag: 'mikawachi' },

]

traditionals.each do |row| setup_traditional(row) end


#########################################################
# setup the day_trend data
#########################################################
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
