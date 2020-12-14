# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

User.create!([
  {email: "test@test.com", encrypted_password: "$2a$12$d6lwjeVFTlDQtWS7plLfpuQO35uQoh4R/oyGpIMJwIEiqQUFHZ7U2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "テストユーザー", introduce: "テストユーザーになります。", admin: nil},
  {email: "test@com", encrypted_password: "$2a$12$lg5KuEnCZQJQ0B7iL/PgAuC.4bIkOpzJz4BlmPrrNTBNBhDgvYVc6", reset_password_token: "08130c64aa6d8ab2451d17d304eb4ce168530f9532b44ff91e9852a3eda5b852", reset_password_sent_at: "2020-10-27 11:54:06", remember_created_at: nil, name: "テストユーザー2", introduce: nil, admin: nil},
  {email: "gyarubaku@yahoo.ne.jp", encrypted_password: "$2a$12$cHC6EqjB/GkBgJD9ALcfquG.FhRbWxQJKbxlvGHSN872DDv7RXGk6", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "山崎泰則", introduce: "テストユーザー？", admin: nil},
  {email: "t@t", encrypted_password: "$2a$12$4lxfiZMKKlWsbk5ASjPvAOYDQ1AzODlcONaUq8ZMKRxP5yl5EFzFu", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "test", introduce: "test34889", admin: nil}
])
Genre.create!([
  {name: "観光地", category_id: 5, search: "landmark"},
  {name: "食事処", category_id: 2, search: "restaurant"},
  {name: "レンタカー", category_id: 3, search: "rentacar"},
  {name: "カードショップ", category_id: 6, search: "card-shop"},
  {name: "ホテル", category_id: 1, search: "hotel"},
  {name: "水族館", category_id: 4, search: "aquarium"},
  {name: "コンビニ", category_id: 6, search: "convenience-store"},
  {name: "動物園", category_id: 4, search: "zoo"},
  {name: "ハワイアンレストラン", category_id: 2, search: "hawaian-restaurant"},
  {name: "洋食", category_id: 2, search: "western-food"},
  {name: "日本食", category_id: 2, search: "japanese-food"},
  {name: "ショッピングモール", category_id: 6, search: "shopping-mall"},
  {name: "ファッション", category_id: 6, search: "fashion"},
  {name: "スーパー", category_id: 6, search: "supar"}
])
Area.create!([
  {name: "ホノルル", island_id: 6, search: "honolulu"},
  {name: "ワイルク", island_id: 2, search: "wailuku"},
  {name: "ワイキキ", island_id: 6, search: "waikiki"},
  {name: "ワヒアワ", island_id: 6, search: "wahiawa"},
  {name: "カイルア コナ", island_id: 1, search: "kailua-kona"}
])
History.create!([
  {user_id: 1, experience_id: 7, comment: nil},
  {user_id: 1, experience_id: 1, comment: nil}
])
Favorite.create!([
  {user_id: 1, experience_id: 4, comment: ""},
  {user_id: 1, experience_id: 6, comment: ""},
  {user_id: 1, experience_id: 7, comment: nil},
  {user_id: 10, experience_id: 1, comment: nil},
  {user_id: 1, experience_id: 1, comment: nil},
  {user_id: 1, experience_id: 5, comment: nil},
  {user_id: 1, experience_id: 3, comment: nil}
])
SnsCredential.create!([
  {provider: "facebook", uid: "154587356359318", user_id: 9}
])
Experience.create!([
  {name: "ハワイ出雲大社", outline: "", address: "215 N Kukui St, Honolulu, HI 96817", latitude: 21.315507, longitude: -157.860823, business_hours_start: "8:30", business_hours_finish: "16:00", area_id: 1, genre_id: 1, score: 3.4, heading: 0.7442534824221285, pitch: -0.005456512448489548, fov: 120.0, zoom: 0.5849625007211563},
  {name: "ホノルル動物園", outline: "", address: "151 Kapahulu Ave. Honolulu HI 96815", latitude: 21.27102105001876, longitude: -157.8216668153002, business_hours_start: "9:00", business_hours_finish: "16:00", area_id: 1, genre_id: 8, score: 0.0, heading: 80.99776862736235, pitch: 7.007798373036664, fov: 90.0, zoom: 1.0},
  {name: "マウイ オーシャン センター", outline: nil, address: "192 Maalaea Rd, Wailuku, HI 96793", latitude: 20.79233488421192, longitude: -156.5126617064572, business_hours_start: "9:00", business_hours_finish: "17:00", area_id: 2, genre_id: 6, score: 0.0, heading: 81.54915568022477, pitch: -9.76361710778049, fov: 54.914331218834015, zoom: 1.7127422970167263},
  {name: "ハウ・ツリー・ラナイ", outline: nil, address: "2863 Kalakaua Avenue, Lobby floor of the Kaimana Beach Hotel, Honolulu, HI 96815", latitude: 21.26328600546552, longitude: -157.8213162347674, business_hours_start: "10:00", business_hours_finish: "20:30", area_id: 1, genre_id: 9, score: 0.0, heading: 272.09314254471064, pitch: 2.722181929057328, fov: 107.3852589981389, zoom: 0.7452009414428279},
  {name: "エッグスン シングス サラトガ本店", outline: nil, address: "343 Saratoga Road Honolulu, Hawaii 96815", latitude: 21.2812999, longitude: -157.8311402, business_hours_start: "6:00", business_hours_finish: "22:00", area_id: 1, genre_id: 9, score: 0.0, heading: 334.575134927103, pitch: -0.31941773651804795, fov: 120.0, zoom: 0.0},
  {name: "丸亀製麺 ワイキキ店", outline: nil, address: "2310 Kūhiō Ave. #124, Honolulu, HI 96815", latitude: 21.27949546958747, longitude: -157.8261752886107, business_hours_start: "11:00", business_hours_finish: "21:00", area_id: 3, genre_id: 11, score: 0.0, heading: 75.93652146751933, pitch: 3.491251860391557, fov: 95.12881483284178, zoom: 0.9200425970566853},
  {name: "クカニロコ・バース・ストーン", outline: nil, address: "Kamehameha Hwy, Wahiawa, HI 96786", latitude: 21.5046715, longitude: -158.0360277, business_hours_start: "0:00", business_hours_finish: "24:00", area_id: 4, genre_id: 1, score: 4.0, heading: 283.3895592965079, pitch: 20.906770097302058, fov: 120.0, zoom: 0.5849625007211563},
  {name: "ダイヤモンド ヘッド", outline: nil, address: "18th Ave., Waikiki, Honolulu, Oahu, HI 96815", latitude: 21.25351718830514, longitude: -157.8077901899815, business_hours_start: "日 ~ 土 : 6:00", business_hours_finish: "16:30", area_id: 1, genre_id: 1, score: 0.0, heading: 18.04706904979218, pitch: -21.937938517512563, fov: 120.0, zoom: 0.5849625007211563},
  {name: "アラモアナ・ショッピングセンター", outline: nil, address: "1450 Ala Moana Blvd, Honolulu, Oahu, HI 96814-4604", latitude: 21.2910515, longitude: -157.8436392, business_hours_start: nil, business_hours_finish: nil, area_id: 1, genre_id: 12, score: 0.0, heading: 24.888991930257877, pitch: 3.742514551486522, fov: 120.0, zoom: 0.5849625007211563},
  {name: "ヴィクトリアズ シークレット&ピンク", outline: nil, address: "2230 Kalakaua Ave, Honolulu, HI 96815", latitude: 21.279392, longitude: -157.828818, business_hours_start: "10:00", business_hours_finish: "23:00", area_id: 1, genre_id: 13, score: 0.0, heading: 72.50825996484618, pitch: -5.694193774813414, fov: 120.0, zoom: 0.5849625007211563},
  {name: "ドンキホーテ ホノルル", outline: nil, address: "801 Kaheka St, Honolulu, HI 96814", latitude: 21.2931103, longitude: -157.8386282, business_hours_start: "0:00", business_hours_finish: "24:00", area_id: 1, genre_id: 14, score: 0.0, heading: 316.12463069386393, pitch: 6.698481371762625, fov: 120.0, zoom: 0.5849625007211563},
  {name: "ハーツレンタカー コナ国際空港", outline: nil, address: "73 104 Aulepe St, Kailua-Kona, HI 96740", latitude: 19.73479728743544, longitude: -156.0364442714798, business_hours_start: "6:00", business_hours_finish: "22:30", area_id: 5, genre_id: 3, score: 0.0, heading: 153.49446057234925, pitch: 1.082000457907128, fov: 44.24447534006388, zoom: 2.024427679514255},
  {name: "アラモレンタカー ダニエル・K・イノウエ国際空港", outline: nil, address: "3055 N Nimitz Hwy\n\n96819 Honolulu", latitude: 21.33588474682802, longitude: -157.9082260896729, business_hours_start: "7:00", business_hours_finish: "19:00", area_id: 1, genre_id: 3, score: 0.0, heading: 169.39216401925987, pitch: 0.7844533840175956, fov: 75.52985100278835, zoom: 1.2528780605504422},
  {name: "パラダイス レンタカー", outline: nil, address: "1843 Ala Moana Blvd, Honolulu, HI 96815", latitude: 21.28457544509887, longitude: -157.8367937337185, business_hours_start: "8:00", business_hours_finish: "17:00", area_id: 1, genre_id: 3, score: 0.0, heading: 157.2389548326501, pitch: 0.5497695623079863, fov: 51.23667318840421, zoom: 1.8127481973163575},
  {name: "シェラトン ワイキキ ホテル", outline: nil, address: "2255 Kalakaua Ave, Honolulu, HI 96815", latitude: 21.27819282327562, longitude: -157.8296438212882, business_hours_start: nil, business_hours_finish: nil, area_id: 1, genre_id: 5, score: 0.0, heading: 259.0188596185164, pitch: 32.009801316369334, fov: 120.0, zoom: 0.5849625007211563},
  {name: "モアナ・サーフライダー・ウェスティン・リゾート&スパ", outline: nil, address: "2365 Kalakaua Ave, Honolulu, HI 96815", latitude: 21.2769027, longitude: -157.8263809, business_hours_start: nil, business_hours_finish: nil, area_id: 1, genre_id: 5, score: 0.0, heading: 179.2403805119354, pitch: 20.46194344275905, fov: 120.0, zoom: 0.5849625007211563},
  {name: "ヒルトン ハワイアン ビレッジ ワイキキ ビーチ リゾート", outline: nil, address: "2005 Kalia Rd, Honolulu, HI 96815", latitude: 21.2846084, longitude: -157.835938, business_hours_start: nil, business_hours_finish: nil, area_id: 1, genre_id: 5, score: 0.0, heading: 186.40876811328613, pitch: 25.98933449033754, fov: 74.96071828993425, zoom: 1.263790224160779}
])
Review.create!([
  {comment: "テスト", score: 4, user_id: 1, experience_id: 1, title: "テスト1"},
  {comment: "テスト2", score: 3, user_id: 1, experience_id: 1, title: "テスト2"},
  {comment: "test", score: 5, user_id: 1, experience_id: 1, title: "test"},
  {comment: "test", score: 4, user_id: 1, experience_id: 7, title: "テスト"},
  {comment: "テスト", score: 3, user_id: 1, experience_id: 1, title: "画像テスト"},
  {comment: "tests", score: 2, user_id: 1, experience_id: 1, title: "test"}
])
ActiveStorage::Blob.create!([
  {key: "8tu2485eok9i1j74fdxgb3n9e9ut", filename: "IMG_8484.JPG", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 3358199, checksum: "Rnr7kelHrICPyRP+zc7HyQ=="},
  {key: "z7ym6ypl4nv24p6m7ul5xc4vhuqr", filename: "IMG_8484.JPG", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 3358199, checksum: "Rnr7kelHrICPyRP+zc7HyQ=="},
  {key: "ckogruq4rcuwov1vli9bamy3jm78", filename: "register_image.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 1683437, checksum: "aagyNRU851SLCvmhEzC0hQ=="},
  {key: "7cxjgt3sk3mcuplwkaszw67no000", filename: "toppage.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 1793966, checksum: "ZjdvoPHNydMzAijOxXmviA=="},
  {key: "lx8l2xshto0jx4unmg6v7djxw1ut", filename: "mypage_image.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 8275890, checksum: "6L+hNJPbt8f3C88RAAaAlA=="},
  {key: "ai09n43jbcts4soei3lyl26p7ifz", filename: "mypage_image.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 8275890, checksum: "6L+hNJPbt8f3C88RAAaAlA=="},
  {key: "fuqf448u4fjou199e0stkbdaabzx", filename: "toppage.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 1793966, checksum: "ZjdvoPHNydMzAijOxXmviA=="},
  {key: "4toabtmlk5fvk3s6fgwm6jrxurai", filename: "mypage_image.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 8275890, checksum: "6L+hNJPbt8f3C88RAAaAlA=="},
  {key: "qzkpgp916urmcgltshse0qu26lnp", filename: "register_image.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 1683437, checksum: "aagyNRU851SLCvmhEzC0hQ=="},
  {key: "2dh6ah0qfl521ou38u5jvvruk5kn", filename: "toppage_header.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 1387275, checksum: "308eKUhXU4tdSRcbI9fv2g=="},
  {key: "i296xhpygszcvz8gz8e1zi02mbcb", filename: "toppage.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 1793966, checksum: "ZjdvoPHNydMzAijOxXmviA=="},
  {key: "eu72ru9psx0bfdkwx486ir3fwrte", filename: "テスト画像", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 102589, checksum: "+CLbwxgZoBZ38D/bHi4pdQ=="},
  {key: "kumqg1rir6rrjykzppk8ckg68q3k", filename: "テスト画像", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 102589, checksum: "+CLbwxgZoBZ38D/bHi4pdQ=="},
  {key: "du0g51hiodf98bvisuohhciudovk", filename: "テスト画像", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 102589, checksum: "+CLbwxgZoBZ38D/bHi4pdQ=="},
  {key: "p15a0pq5kvdws3auxmwy4g2gypno", filename: "テスト画像", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 102589, checksum: "+CLbwxgZoBZ38D/bHi4pdQ=="},
  {key: "a7cyi2gd41i2zwac81i8aup5oyr4", filename: "テスト画像", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 102589, checksum: "+CLbwxgZoBZ38D/bHi4pdQ=="},
  {key: "6fp7xiom4t1mqxf7rmtn133gu1b9", filename: "テスト画像", content_type: "image/png", metadata: {"identified"=>true}, byte_size: 102589, checksum: "+CLbwxgZoBZ38D/bHi4pdQ=="},
  {key: "63o0z6htqdxbzri14zohhizrz2at", filename: "toppage_header.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 1387275, checksum: "308eKUhXU4tdSRcbI9fv2g=="}
])
ActiveStorage::Attachment.create!([
  {name: "images", record_type: "Review", record_id: 13, blob_id: 29},
  {name: "images", record_type: "Review", record_id: 13, blob_id: 30},
  {name: "images", record_type: "Review", record_id: 14, blob_id: 31},
  {name: "images", record_type: "Review", record_id: 15, blob_id: 32},
  {name: "images", record_type: "Review", record_id: 15, blob_id: 33},
  {name: "images", record_type: "Review", record_id: 17, blob_id: 34},
  {name: "images", record_type: "Review", record_id: 17, blob_id: 35},
  {name: "images", record_type: "Review", record_id: 17, blob_id: 36},
  {name: "images", record_type: "Review", record_id: 17, blob_id: 37},
  {name: "image", record_type: "User", record_id: 10, blob_id: 44}
])
