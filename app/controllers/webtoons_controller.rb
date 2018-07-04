class WebtoonsController < ApplicationController
  def index
    @webtoons = Webtoon.all
  end
  
  def boxoffice
    
  end
  
  def result
    @date = params[:date]
    # 영진위 api를 통해 해당 날짜의 boxoffice 정보를 보여준다.
    # 1. boxoffice 정보를 요청한다. (HTTParty)
    # 2. 받아온 정보(json)를 파싱한다.
    # 3. 파싱된 해시에서 원하는 정보를 꺼내어 보여준다.
    base = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
    key = "0406c227375495574739b7cf1b2d5e6c"
    date = params[:date].delete("-") # 2018-07-02
    url = base + "key=" + key + "&" + "targetDt=" + date
    res = HTTParty.get(url)
    data = JSON.parse(res.body)
    
    @movies = []
    data["boxOfficeResult"]["dailyBoxOfficeList"].each do |movie|
        @movies.push({
            "rank" => movie["rank"],
            "title" => movie["movieNm"],
            "sales" => movie["salesAcc"],
            "audi" => movie["audiAcc"]
        })
    end
    
  end
  
  def stock
    url = "http://finance.daum.net/"
    res = HTTParty.get(url)
  end
end
