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
	{ tag_type: 'sake', tag: 'kunimare', name: '国稀', image_url: 'kunimare.png' },
	{ tag_type: 'sake', tag: 'densyu', name: '田酒', image_url: 'densyu.png' },
	{ tag_type: 'sake', tag: 'nanbubijin', name: '南部美人', image_url: 'nanbubijin.png' },
	{ tag_type: 'sake', tag: 'urakasumi', name: '浦霞', image_url: 'urakasumi.png' },
	{ tag_type: 'sake', tag: 'shirataki', name: '白瀑', image_url: 'shirataki.png' },
	{ tag_type: 'sake', tag: 'juyondai', name: '十四代', image_url: 'juyondai.png' },
	{ tag_type: 'sake', tag: 'hiroki', name: '飛露喜', image_url: 'hiroki.png' },
	{ tag_type: 'sake', tag: 'satonohomare', name: '郷乃誉', image_url: 'satonohomare.png' },
	{ tag_type: 'sake', tag: 'hououbiden', name: '鳳凰美田', image_url: 'hououbiden.png' },
	{ tag_type: 'sake', tag: 'ozenoyukidoke', name: '尾瀬の雪どけ', image_url: 'ozenoyukidoke.png' },
	{ tag_type: 'sake', tag: 'shinkame', name: '神亀', image_url: 'shinkame.png' },
	{ tag_type: 'sake', tag: 'goninnmusume', name: '五人娘', image_url: 'goninnmusume.png' },
	{ tag_type: 'sake', tag: 'sawanoi', name: '澤乃井', image_url: 'sawanoi.png' },
	{ tag_type: 'sake', tag: 'izumibashi', name: 'いづみ橋', image_url: 'izumibashi.png' },
	{ tag_type: 'sake', tag: 'kubota', name: '久保田', image_url: 'kubota.png' },
	{ tag_type: 'sake', tag: 'masuizumi', name: '満寿泉', image_url: 'masuizumi.png' },
	{ tag_type: 'sake', tag: 'tengumai', name: '天狗舞', image_url: 'tengumai.png' },
	{ tag_type: 'sake', tag: 'kokuryu', name: '黒龍', image_url: 'kokuryu.png' },
	{ tag_type: 'sake', tag: 'shunnoten', name: '春鶯囀', image_url: 'shunnoten.png' },
	{ tag_type: 'sake', tag: 'masumi', name: '真澄', image_url: 'masumi.png' },
	{ tag_type: 'sake', tag: 'michisakari', name: '三千盛', image_url: 'michisakari.png' },
	{ tag_type: 'sake', tag: 'garyubai', name: '臥龍梅', image_url: 'garyubai.png' },
	{ tag_type: 'sake', tag: 'kuheiji', name: '醸し人九平次', image_url: 'kuheiji.png' },
	{ tag_type: 'sake', tag: 'mienishiki', name: '三重錦', image_url: 'mienishiki.png' },
	{ tag_type: 'sake', tag: 'daijiro', name: '大治郎', image_url: 'daijiro.png' },
	{ tag_type: 'sake', tag: 'tamanohikari', name: '玉乃光', image_url: 'tamanohikari.png' },
	{ tag_type: 'sake', tag: 'akishika', name: '秋鹿', image_url: 'akishika.png' },
	{ tag_type: 'sake', tag: 'kenbishi', name: '剣菱', image_url: 'kenbishi.png' },
	{ tag_type: 'sake', tag: 'kazenomori', name: '風の森', image_url: 'kazenomori.png' },
	{ tag_type: 'sake', tag: 'kuroushi', name: '黒牛', image_url: 'kuroushi.png' },
	{ tag_type: 'sake', tag: 'takaisami', name: '鷹勇', image_url: 'takaisami.png' },
	{ tag_type: 'sake', tag: 'rihaku', name: '李白', image_url: 'rihaku.png' },
	{ tag_type: 'sake', tag: 'sakehitosuji', name: '酒一筋', image_url: 'sakehitosuji.png' },
	{ tag_type: 'sake', tag: 'taketsuru', name: '竹鶴', image_url: 'taketsuru.png' },
	{ tag_type: 'sake', tag: 'dassai', name: '獺祭', image_url: 'dassai.png' },
	{ tag_type: 'sake', tag: 'miyoshikiku', name: '三芳菊', image_url: 'miyoshikiku.png' },
	{ tag_type: 'sake', tag: 'yorokobigaijin', name: '悦凱陣', image_url: 'yorokobigaijin.png' },
	{ tag_type: 'sake', tag: 'ishizuchi', name: '石鎚', image_url: 'ishizuchi.png' },
	{ tag_type: 'sake', tag: 'minami', name: '南', image_url: 'minami.png' },
	{ tag_type: 'sake', tag: 'niwanouguisu', name: '庭のうぐいす', image_url: 'niwanouguisu.png' },
	{ tag_type: 'sake', tag: 'azumaichi', name: '東一', image_url: 'azumaichi.png' },
	{ tag_type: 'sake', tag: '64sake', name: '六十餘洲', image_url: '64sake.png' },
	{ tag_type: 'sake', tag: 'reizan', name: 'れいざん', image_url: 'reizan.png' },
	{ tag_type: 'sake', tag: 'takakiya', name: '鷹来屋', image_url: 'takakiya.png' },
	{ tag_type: 'sake', tag: 'yumenonakamade', name: '夢の中まで', image_url: 'yumenonakamade.png' },
	{ tag_type: 'sake', tag: 'kojyu', name: '幸寿', image_url: 'kojyu.png' },
	{ tag_type: 'sake', tag: 'reimei', name: '黎明', image_url: 'reimei.png' },

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

	# anime
	{ tag_type: 'anime', tag: 'mahouka', name: '魔法科高校の劣等生', image_url: 'mahouka.jpg' },
	{ tag_type: 'anime', tag: 'kamigaminoitazura', name: '神々の悪戯', image_url: 'kamigaminoitazura.jpg' },
	{ tag_type: 'anime', tag: 'mekakucity', name: 'メカクシティアクターズ', image_url: 'mekakucity.jpg' },
	{ tag_type: 'anime', tag: 'corda', name: '金色のコルダblue♪sky', image_url: 'corda.jpg' },
	{ tag_type: 'anime', tag: 'soreseka', name: 'それでも世界は美しい', image_url: 'soreseka.jpg' },
	{ tag_type: 'anime', tag: 'captain-earth', name: 'キャプテン・アース', image_url: 'captain-earth.jpg' },
	{ tag_type: 'anime', tag: 'nisekoi', name: 'ニセコイ', image_url: 'nisekoi.jpg' },
	{ tag_type: 'anime', tag: 'matsutaro', name: '暴れん坊力士!!松太郎', image_url: 'matsutaro.jpg' },
	{ tag_type: 'anime', tag: 'cf-vanguard', name: 'カードファイト!!ヴァンガード', image_url: 'cf-vanguard.jpg' },
	{ tag_type: 'anime', tag: 'dragon_kai', name: 'ドラゴンボール改　魔人ブウ編', image_url: 'dragon_kai.jpg' },
	{ tag_type: 'anime', tag: 'haikyu', name: 'ハイキュー!!', image_url: 'haikyu.jpg' },
	{ tag_type: 'anime', tag: 'yugioh-arcv', name: '遊✩戯✩王　ARC-V', image_url: 'yugioh-arcv.jpg' },
	{ tag_type: 'anime', tag: 'babysteps', name: 'ベイビーステップ', image_url: 'babysteps.jpg' },
	{ tag_type: 'anime', tag: 'diaace', name: 'ダイヤのA', image_url: 'diaace.jpg' },
	{ tag_type: 'anime', tag: 'happiness-precure', name: 'ハピネスチャージプリキュア！', image_url: 'happiness-precure.jpg' },
	{ tag_type: 'anime', tag: 'onepiece', name: 'ワンピース　ONE PIECE', image_url: 'onepiece.jpg' },
	{ tag_type: 'anime', tag: 'gaimu', name: '仮面ライダー鎧武', image_url: 'gaimu.jpg' },
	{ tag_type: 'anime', tag: 'tqg', name: '烈車戦隊トッキュウジャー', image_url: 'tqg.jpg' },
	{ tag_type: 'anime', tag: 'gokukoku', name: '極黒のブリュンヒルデ', image_url: 'gokukoku.jpg' },
	{ tag_type: 'anime', tag: 'lovelive', name: 'ラブライブ！', image_url: 'lovelive.jpg' },
	{ tag_type: 'anime', tag: 'breakblade', name: 'ブレイクブレイド', image_url: 'breakblade.jpg' },
	{ tag_type: 'anime', tag: 'oneweekfriends', name: '１週間フレンズ', image_url: 'oneweekfriends.jpg' },
	{ tag_type: 'anime', tag: 'gaworare', name: '彼女がフラグを折られたら', image_url: 'gaworare.jpg' },
	{ tag_type: 'anime', tag: 'nobunaga', name: 'ノブナガ・ザ・フール', image_url: 'nobunaga.jpg' },
	{ tag_type: 'anime', tag: 'oreca_dracolle', name: 'オレカバトル＆ドラゴンコレクション', image_url: 'oreca_dracolle.jpg' },
	{ tag_type: 'anime', tag: 'herobank', name: 'ヒーローバンク', image_url: 'herobank.jpg' },
	{ tag_type: 'anime', tag: 'mangakasan', name: 'マンガ家さんとアシスタントさんと', image_url: 'mangakasan.jpg' },
	{ tag_type: 'anime', tag: 'm3', name: 'M3～ソノ黒キ鋼～', image_url: 'm3.jpg' },
	{ tag_type: 'anime', tag: 'gigantshooter', name: '超爆裂異次元メンコバトル　ギガントシューターつかさ', image_url: 'gigantshooter.jpg' },
	{ tag_type: 'anime', tag: 'yowapeda', name: '弱虫ペダル', image_url: 'yowapeda.jpg' },
	{ tag_type: 'anime', tag: 'majinbone', name: 'マジンボーン', image_url: 'majinbone.jpg' },
	{ tag_type: 'anime', tag: 'black-bullet', name: 'ブラック・ブレット', image_url: 'black-bullet.jpg' },
	{ tag_type: 'anime', tag: 'mahoushoujyotaisen', name: '魔法少女大戦', image_url: 'mahoushoujyotaisen.jpg' },
	{ tag_type: 'anime', tag: 'kenichi', name: '史上最強の弟子ケンイチ闇の襲撃', image_url: 'kenichi.jpg' },
	{ tag_type: 'anime', tag: 'souleaternot', name: 'ソウルイーターノット!', image_url: 'souleaternot.jpg' },
	{ tag_type: 'anime', tag: 'hxh', name: 'HUNTER×HUNTER', image_url: 'hxh.jpg' },
	{ tag_type: 'anime', tag: 'gaist', name: 'ガイストクラッシャー', image_url: 'gaist.jpg' },
	{ tag_type: 'anime', tag: 'dw_avengers', name: 'ディスク・ウォーズ：アベンジャーズ', image_url: 'dw_avengers.jpg' },
	{ tag_type: 'anime', tag: 'kutsudaru', name: 'くつだる。', image_url: 'kutsudaru.jpg' },
	{ tag_type: 'anime', tag: 'ngnl', name: 'ノーゲーム・ノーライフ', image_url: 'ngnl.jpg' },
	{ tag_type: 'anime', tag: 'chaika', name: '棺姫のチャイカ', image_url: 'chaika.jpg' },
	{ tag_type: 'anime', tag: 'daishogun', name: '風雲維新ダイショーグン', image_url: 'daishogun.jpg' },
	{ tag_type: 'anime', tag: 'naruto', name: 'NARUTO　ナルト疾風伝', image_url: 'naruto.jpg' },
	{ tag_type: 'anime', tag: 'pokemon', name: 'ポケットモンスターXY', image_url: 'pokemon.jpg' },
	{ tag_type: 'anime', tag: 'escha-logy', name: 'エスカ＆ロジーのアトリエ', image_url: 'escha-logy.jpg' },
	{ tag_type: 'anime', tag: 'tamagotchi', name: 'GO-GO　たまごっち!', image_url: 'tamagotchi.jpg' },
	{ tag_type: 'anime', tag: 'gochiusa', name: 'ご注文はうさぎですか？', image_url: 'gochiusa.jpg' },
	{ tag_type: 'anime', tag: 'aikatsu', name: 'アイカツ！', image_url: 'aikatsu.jpg' },
	{ tag_type: 'anime', tag: 'inuneko', name: '犬神さんと猫山さん', image_url: 'inuneko.jpg' },
	{ tag_type: 'anime', tag: 'bns', name: 'Blade&Soul', image_url: 'bns.jpg' },
	{ tag_type: 'anime', tag: 'kawaisou', name: '僕らはみんな河合荘', image_url: 'kawaisou.jpg' },
	{ tag_type: 'anime', tag: 'akuma-riddle', name: '悪魔のリドル', image_url: 'akuma-riddle.jpg' },
	{ tag_type: 'anime', tag: 'selector-wixoss', name: 'selector infected WIXOSS', image_url: 'selector-wixoss.jpg' },
	{ tag_type: 'anime', tag: 'knightsofsidonia', name: 'シドニアの騎士', image_url: 'knightsofsidonia.jpg' },
	{ tag_type: 'anime', tag: 'pingpong', name: 'ピンポン', image_url: 'pingpong.jpg' },
	{ tag_type: 'anime', tag: 'nanana', name: '龍ヶ嬢七々々の埋蔵金', image_url: 'nanana.jpg' },
	{ tag_type: 'anime', tag: 'kantoku', name: '監督不行届', image_url: 'kantoku.jpg' },
	{ tag_type: 'anime', tag: 'tmnt', name: 'ミュータントタートルズ', image_url: 'tmnt.jpg' },
	{ tag_type: 'anime', tag: 'youkai-watch', name: '妖怪ウォッチ', image_url: 'youkai-watch.jpg' },
	{ tag_type: 'anime', tag: 'mushishi', name: '蟲師', image_url: 'mushishi.jpg' },
	{ tag_type: 'anime', tag: 'jojo', name: 'ジョジョの奇妙な冒険', image_url: 'jojo.jpg' },
	{ tag_type: 'anime', tag: 'date-a-live', name: 'デート・ア・ライブ', image_url: 'date-a-live.jpg' },
	{ tag_type: 'anime', tag: 'jewelpet', name: 'レディジュエルペット', image_url: 'jewelpet.jpg' },
	{ tag_type: 'anime', tag: 'tenkaiknight', name: 'テンカイナイト', image_url: 'tenkaiknight.jpg' },
	{ tag_type: 'anime', tag: 'prettyrhythm', name: 'プリティリズム・オールスターセレクション', image_url: 'prettyrhythm.jpg' },
	{ tag_type: 'anime', tag: 'fairytail', name: 'FAIRY TAIL', image_url: 'fairytail.jpg' },
	{ tag_type: 'anime', tag: 'kindaichi_r', name: '金田一少年の事件簿R', image_url: 'kindaichi_r.jpg' },
	{ tag_type: 'anime', tag: 'keroro', name: 'ケロロ', image_url: 'keroro.jpg' },
	{ tag_type: 'anime', tag: 'pacworld', name: 'パックワールド', image_url: 'pacworld.jpg' },
	{ tag_type: 'anime', tag: 'penguin', name: '健全ロボダイミダラー', image_url: 'penguin.jpg' },
	{ tag_type: 'anime', tag: 'seikoku', name: '星刻の竜騎士', image_url: 'seikoku.jpg' },
	{ tag_type: 'anime', tag: 'conan', name: '名探偵コナン', image_url: 'conan.jpg' },

	# company
	{ tag_type: 'company', tag: 'mizuho_bank', name: 'みずほ銀行', image_url: 'mizuho_bank.jpg' },
{ tag_type: 'company', tag: 'mitsubishi_bank', name: '三菱東京UFJ銀行', image_url: 'mitsubishi_bank.jpg' },
{ tag_type: 'company', tag: 'mitsui_bank', name: '三井住友銀行', image_url: 'mitsui_bank.jpg' },
{ tag_type: 'company', tag: 'risona_bank', name: 'りそな銀行', image_url: 'risona_bank.jpg' },
{ tag_type: 'company', tag: 'srisona_ban', name: '埼玉りそな銀行', image_url: 'srisona_ban.jpg' },
{ tag_type: 'company', tag: 'mitsubishi_tbank', name: '三菱UFJ信託銀行', image_url: 'mitsubishi_tbank.jpg' },
{ tag_type: 'company', tag: 'mizuho_tbank', name: 'みずほ信託銀行', image_url: 'mizuho_tbank.jpg' },
{ tag_type: 'company', tag: 'mitsui_tbank', name: '三井住友信託銀行', image_url: 'mitsui_tbank.jpg' },
{ tag_type: 'company', tag: 'nomura_tbank', name: '野村信託銀行 ', image_url: 'nomura_tbank.jpg' },
{ tag_type: 'company', tag: 'aozora_bank', name: 'あおぞら銀行', image_url: 'aozora_bank.jpg' },
{ tag_type: 'company', tag: 'shinsei_bank', name: '新生銀行', image_url: 'shinsei_bank.jpg' },
{ tag_type: 'company', tag: 'nocyu', name: '農林中央金庫', image_url: 'nocyu.jpg' },
{ tag_type: 'company', tag: 'yucho', name: 'ゆうちょ銀行', image_url: 'yucho.jpg' },
{ tag_type: 'company', tag: 'japan_nbank', name: 'ジャパンネット銀行', image_url: 'japan_nbank.jpg' },
{ tag_type: 'company', tag: 'sbi_nbank', name: '住信SBIネット銀行', image_url: 'sbi_nbank.jpg' },
{ tag_type: 'company', tag: 'sony_nbank', name: 'ソニー銀行', image_url: 'sony_nbank.jpg' },
{ tag_type: 'company', tag: 'rakuten_nbank', name: '楽天銀行', image_url: 'rakuten_nbank.jpg' },
{ tag_type: 'company', tag: 'jibun_nbank', name: 'じぶん銀行', image_url: 'jibun_nbank.jpg' },
{ tag_type: 'company', tag: 'nomura_secu', name: '野村證券', image_url: 'nomura_secu.jpg' },
{ tag_type: 'company', tag: 'daiwa_secu', name: '大和証券', image_url: 'daiwa_secu.jpg' },
{ tag_type: 'company', tag: 'mizuho_secu', name: 'みずほ証券', image_url: 'mizuho_secu.jpg' },
{ tag_type: 'company', tag: 'mitsubishi_secu', name: '三菱UFJモルガン・スタンレー証券', image_url: 'mitsubishi_secu.jpg' },
{ tag_type: 'company', tag: 'mitsubishi_sho', name: '三菱商事', image_url: 'mitsubishi_sho.jpg' },
{ tag_type: 'company', tag: 'sumitomo_sho', name: '住友商事', image_url: 'sumitomo_sho.jpg' },
{ tag_type: 'company', tag: 'itochu', name: '伊藤忠商事', image_url: 'itochu.jpg' },
{ tag_type: 'company', tag: 'marubeni', name: '丸紅', image_url: 'marubeni.jpg' },
{ tag_type: 'company', tag: 'mitsui_sho', name: '三井物産', image_url: 'mitsui_sho.jpg' },

]

keywords.each do |keyword| setup_keyword(keyword) end

#########################################################
# setup the search_condition data
#########################################################
def setup_search_condition(list)
	keyword_id = get_keyword_id(list[:tag])
	rows = SearchCondition.where(keyword_id: keyword_id)
	if rows.size == 0 then
		data = {}
		data[:keyword_id] = keyword_id
		data[:search_word] = list[:search_word]
		SearchCondition.create(data)
	else
		rows.each do |row|
			row['search_word'] = list[:search_word]
			row.save
		end
	end
end

search_conditions = [
	# sake
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

	# anime
	{ search_word: '魔法科高校の劣等生', tag: 'mahouka' },
	{ search_word: '神々の悪戯', tag: 'kamigaminoitazura' },
	{ search_word: 'メカクシティアクターズ', tag: 'mekakucity' },
	{ search_word: '金色のコルダ', tag: 'corda' },
	{ search_word: 'それでも世界は美しい', tag: 'soreseka' },
	{ search_word: 'キャプテン・アース', tag: 'captain-earth' },
	{ search_word: 'ニセコイ', tag: 'nisekoi' },
	{ search_word: '暴れん坊力士 松太郎', tag: 'matsutaro' },
	{ search_word: 'ヴァンガード', tag: 'cf-vanguard' },
	{ search_word: 'ドラゴンボール改', tag: 'dragon_kai' },
	{ search_word: 'ハイキュー', tag: 'haikyu' },
	{ search_word: '遊戯王', tag: 'yugioh-arcv' },
	{ search_word: 'ベイビーステップ', tag: 'babysteps' },
	{ search_word: 'ダイヤのA', tag: 'diaace' },
	{ search_word: 'プリキュア', tag: 'happiness-precure' },
	{ search_word: 'ワンピース', tag: 'onepiece' },
	{ search_word: '鎧武', tag: 'gaimu' },
	{ search_word: 'トッキュウジャー', tag: 'tqg' },
	{ search_word: '極黒のブリュンヒルデ', tag: 'gokukoku' },
	{ search_word: 'ラブライブ', tag: 'lovelive' },
	{ search_word: 'ブレイクブレイド', tag: 'breakblade' },
	{ search_word: '１週間フレンズ', tag: 'oneweekfriends' },
	{ search_word: '彼女がフラグを折られたら', tag: 'gaworare' },
	{ search_word: 'ノブナガ・ザ・フール', tag: 'nobunaga' },
	{ search_word: 'オレカバトル', tag: 'oreca_dracolle' },
	{ search_word: 'ヒーローバンク', tag: 'herobank' },
	{ search_word: 'マンガ家さんとアシスタントさんと', tag: 'mangakasan' },
	{ search_word: 'ソノ黒キ鋼', tag: 'm3' },
	{ search_word: 'ギガントシューターつかさ', tag: 'gigantshooter' },
	{ search_word: '弱虫ペダル', tag: 'yowapeda' },
	{ search_word: 'マジンボーン', tag: 'majinbone' },
	{ search_word: 'ブラック・ブレット', tag: 'black-bullet' },
	{ search_word: '魔法少女大戦', tag: 'mahoushoujyotaisen' },
	{ search_word: '史上最強の弟子ケンイチ', tag: 'kenichi' },
	{ search_word: 'ソウルイーターノット', tag: 'souleaternot' },
	{ search_word: 'ハンターハンター', tag: 'hxh' },
	{ search_word: 'ガイストクラッシャー', tag: 'gaist' },
	{ search_word: 'ディスク・ウォーズ：アベンジャーズ', tag: 'dw_avengers' },
	{ search_word: 'くつだる', tag: 'kutsudaru' },
	{ search_word: 'ノーゲーム ノーライフ', tag: 'ngnl' },
	{ search_word: '棺姫のチャイカ', tag: 'chaika' },
	{ search_word: '風雲維新ダイショーグン', tag: 'daishogun' },
	{ search_word: 'NARUTO', tag: 'naruto' },
	{ search_word: 'ポケットモンスター', tag: 'pokemon' },
	{ search_word: 'エスカ＆ロジーのアトリエ', tag: 'escha-logy' },
	{ search_word: 'たまごっち', tag: 'tamagotchi' },
	{ search_word: 'ご注文はうさぎですか', tag: 'gochiusa' },
	{ search_word: 'アイカツ', tag: 'aikatsu' },
	{ search_word: '犬神さんと猫山さん', tag: 'inuneko' },
	{ search_word: 'Blade&Soul', tag: 'bns' },
	{ search_word: '僕らはみんな河合荘', tag: 'kawaisou' },
	{ search_word: '悪魔のリドル', tag: 'akuma-riddle' },
	{ search_word: '"selector infected WIXOSS"', tag: 'selector-wixoss' },
	{ search_word: 'シドニアの騎士', tag: 'knightsofsidonia' },
	{ search_word: 'ピンポン', tag: 'pingpong' },
	{ search_word: '龍ヶ嬢七々々の埋蔵金', tag: 'nanana' },
	{ search_word: '監督不行届', tag: 'kantoku' },
	{ search_word: 'ミュータントタートルズ', tag: 'tmnt' },
	{ search_word: '妖怪ウォッチ', tag: 'youkai-watch' },
	{ search_word: '蟲師', tag: 'mushishi' },
	{ search_word: 'ジョジョ', tag: 'jojo' },
	{ search_word: 'デート ア ライブ', tag: 'date-a-live' },
	{ search_word: 'ジュエルペット', tag: 'jewelpet' },
	{ search_word: 'テンカイナイト', tag: 'tenkaiknight' },
	{ search_word: 'プリティリズム', tag: 'prettyrhythm' },
	{ search_word: '"FAIRY TAIL"', tag: 'fairytail' },
	{ search_word: '金田一少年の事件簿R', tag: 'kindaichi_r' },
	{ search_word: 'ケロロ', tag: 'keroro' },
	{ search_word: 'パックワールド', tag: 'pacworld' },
	{ search_word: '健全ロボダイミダラー', tag: 'penguin' },
	{ search_word: '星刻の竜騎士', tag: 'seikoku' },
	{ search_word: '名探偵コナン', tag: 'conan' },

	# company
	{ search_word: 'みずほ銀行', tag: 'mizuho_bank' },
	{ search_word: '三菱東京UFJ銀行', tag: 'mitsubishi_bank' },
	{ search_word: '三井住友銀行', tag: 'mitsui_bank' },
	{ search_word: 'りそな銀行', tag: 'risona_bank' },
	{ search_word: '埼玉りそな銀行', tag: 'srisona_ban' },
	{ search_word: '三菱UFJ信託銀行', tag: 'mitsubishi_tbank' },
	{ search_word: 'みずほ信託銀行', tag: 'mizuho_tbank' },
	{ search_word: '三井住友信託銀行', tag: 'mitsui_tbank' },
	{ search_word: '野村信託銀行', tag: 'nomura_tbank' },
	{ search_word: 'あおぞら銀行', tag: 'aozora_bank' },
	{ search_word: '新生銀行', tag: 'shinsei_bank' },
	{ search_word: '農林中央金庫', tag: 'nocyu' },
	{ search_word: 'ゆうちょ銀行', tag: 'yucho' },
	{ search_word: 'ジャパンネット銀行', tag: 'japan_nbank' },
	{ search_word: '住信SBIネット銀行', tag: 'sbi_nbank' },
	{ search_word: 'ソニー銀行', tag: 'sony_nbank' },
	{ search_word: '楽天銀行', tag: 'rakuten_nbank' },
	{ search_word: 'じぶん銀行', tag: 'jibun_nbank' },
	{ search_word: '野村證券', tag: 'nomura_secu' },
	{ search_word: '大和証券', tag: 'daiwa_secu' },
	{ search_word: 'みずほ証券', tag: 'mizuho_secu' },
	{ search_word: '三菱UFJ 証券', tag: 'mitsubishi_secu' },
	{ search_word: '三菱商事', tag: 'mitsubishi_sho' },
	{ search_word: '住友商事', tag: 'sumitomo_sho' },
	{ search_word: '伊藤忠商事', tag: 'itochu' },
	{ search_word: '丸紅', tag: 'marubeni' },
	{ search_word: '三井物産', tag: 'mitsui_sho' },

]
search_conditions.each do |list| setup_search_condition(list) end

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
Keyword.all.each do |keyword|
	row = DayTrend.new()
	row['keyword_id'] = keyword['id']
	row['day_count'] = 0
	row['week_count'] = 0
	row['month_count'] = 0
	row['total_count'] = 0
	row['base_date'] = Date.today()
	row['day_rank'] = rank
	row['week_rank'] = rank
	row['month_rank'] = rank
	row['total_rank'] = rank
	rank += 1
	if DayTrend.where(base_date: row['base_date'], keyword_id: row['keyword_id']).count == 0 then
		row.save
	end
end
