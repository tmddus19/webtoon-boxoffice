# 1. HTTParty.get(url)
# 2. json 파싱해서
# 3. 파싱된 정보를 Webtoon에 저장

days = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"]

days.each do |day|
    url = "http://webtoon.daum.net/data/pc/webtoon/list_serialized/#{day}"
    response = HTTParty.get(url)
    data = JSON.parse(response.body)
    data["data"].each do |webtoon|
        # Webtoon 모델에 저장하겠다.
        Webtoon.create(
            title: webtoon["title"],
            intro: webtoon["introduction"], 
            image: webtoon["appThumbnailImage"]["url"],
            genre: webtoon["cartoon"]["genres"][0]["name"],
            score: webtoon["averageScore"]
        )
    end
end