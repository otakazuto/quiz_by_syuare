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
        }
    ]
)