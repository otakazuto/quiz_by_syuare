Question.create!(
    [
        {
            id: 1,
            content: "サッカーは1チーム何人で試合をするでしょうか？",
        },
        {
            id: 2,
            content: "ワールドカップが初めて開催された国はどこでしょうか？",
        },
        {
            id: 3,
            content: "バロンドールの受賞回数が最も多いのは誰でしょうか？",
        },
        {
            id: 4,
            content: "ワールドカップで一度も優勝したことがない国はどこでしょうか？",
        },
        {
            id: 5,
            content: "次回のワールドカップの開催国はどこでしょうか？",
        },
        {
            id: 6,
            content: "自チームのゴールにボールを入れてしまう事をなんというでしょうか？",
        },
        {
            id: 7,
            content: "サッカー男子日本代表はなんと呼ばれているでしょうか？",
        }
    ]
)

Choice.create!(
    [
        {
            question_id: 1,
            choice_text: "9人",
        },
        {
            question_id: 1,
            choice_text: "10人",
        },
        {
            question_id: 1,
            choice_text: "11人",
            is_correct: true,
        },
        {
            question_id: 1,
            choice_text: "12人",
        },
        
        {
            question_id: 2,
            choice_text: "ブラジル",
        },
        {
            question_id: 2,
            choice_text: "ウルグアイ",
            is_correct: true,
        },
        {
            question_id: 2,
            choice_text: "イタリア",
        },
        {
            question_id: 2,
            choice_text: "日本",
        },
        {
            question_id: 3,
            choice_text: "リオネル・メッシ",
            is_correct: true,
        },
        {
            question_id: 3,
            choice_text: "クリスティアーノ・ロナウド",
        },
        {
            question_id: 3,
            choice_text: "ヨハン・クライフ",
        },
        {
            question_id: 3,
            choice_text: "デビット・ベッカム",
        },
        {
            question_id: 4,
            choice_text: "アルゼンチン",
        },
        {
            question_id: 4,
            choice_text: "スペイン",
        },
        {
            question_id: 4,
            choice_text: "ウルグアイ",
        },
        {
            question_id: 4,
            choice_text: "オランダ",
            is_correct: true,
        },
        {
            question_id: 5,
            choice_text: "アメリカ",
        },
        {
            question_id: 5,
            choice_text: "カナダ",
        },
        {
            question_id: 5,
            choice_text: "メキシコ",
        },
        {
            question_id: 5,
            choice_text: "三国共同開催",
            is_correct: true,
        },
        {
            question_id: 6,
            choice_text: "バックゴール",
        },
        {
            question_id: 6,
            choice_text: "オウンゴール",
            is_correct: true,
        },
        {
            question_id: 6,
            choice_text: "ロスゴール",
        },
        {
            question_id: 6,
            choice_text: "ミスゴール",
        },
        {
            question_id: 7,
            choice_text: "なでしこジャパン",
        },
        {
            question_id: 7,
            choice_text: "侍ジャパン",
        },
        {
            question_id: 7,
            choice_text: "サムライブルー",
            is_correct: true,
        },
        {
            question_id: 7,
            choice_text: "彗星ジャパン",
        }
    ]
)

Answer.create!(
    [
        {
            question_id: 1,
            explanation: "正解は11人です。フィールドプレイヤーが10人とゴールキーパーの合わせて11人で試合を行います。"
        },
        {
            question_id: 2,
            explanation: "正解はウルグアイです。1930年にウルグアイで初開催され、開催国であるウルグアイが初代の優勝国となりました。"
        },
        {
            question_id: 3,
            explanation: "正解はリオネル・メッシです。リオネル・メッシが最多の7回受賞しており、その次に多く受賞したのは、クリスティアーノ・ロナウドの5回受賞である。"
        },
        {
            question_id: 4,
            explanation: "正解はオランダです。"
        },
        {
            question_id: 5,
            explanation: "正解はアメリカ/カナダ/メキシコの三国協同開催です。"
        },
        {
            question_id: 6,
            explanation: "正解はオウンゴールです。"
        },
        {
            question_id: 7,
            explanation: "正解はサムライブルーです。"
        }
    ]
)