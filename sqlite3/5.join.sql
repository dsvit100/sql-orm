-- 여러 테이블을 조합해서 봐야 할 때 사용
-- 1번 유저가 작성한 모든 점수(scores) 출력
-- user = User.objects.get(id=1)
-- user.score_set.all()
-- Score.objects.filter(user_id=1) 위와 동일


SELECT *
FROM movies_user JOIN movies_score
-- user와 score가 합쳐줌
ON movies_user.id = movies_score.user_id
-- 양 테이블에 공통적으로 들어간 컬럼
-- 두개의 테이블을 합쳐서 하나의 테이블이 됨
WHERE movies_user.id=1;


-- 100번 영화가 어떤 카테고리에 속해있는지
-- Movie.objects.get(id=100).categories.all()
-- categories인 이유는? 
-- 영화정보, category(이름), 중간테이블(categori_movies)
SELECT *
FROM movies_movie JOIN movies_category_movies
ON movies_movie.id = movies_category_movies.movie_id
JOIN movies_category
ON movies_category_movies.category_id = movies_category.id
WHERE movies_movie.id = 100;


-- drama 카테고리에 속한 모든 영화 출력
-- Category.objects.get(id=1).movies.all()
SELECT *
FROM movies_category JOIN movies_category_movies
ON movies_category.id = movies_category_movies.category_id
JOIN movies_movie
ON movies_category_movies.movie_id = movies_movie.id
WHERE movies_category.name = 'drama'

-- group by 내가 원하는 컬럼들을 묶어 볼 때 사용하는 기능
-- User.objects.values('country').annotate(Count('id'))
-- .annotate() = 새로운 컬럼을 더 붙일거야
SELECT country, COUNT(*) FROM movies_user
GROUP BY country;

-- 나라별 평균 평점
-- User.objects.values('country').annotate(Avg('score__value'))
-- score__ = score 테이블의 value값으로 계산할 거야 = django 규칙

SELECT country, AVG(value)
FROM movies_user JOIN movies_score
ON movies_user.id = movies_score.user_id
-- user.id를 기준으로 묶어주고
GROUP BY country;
-- country를 기준으로 묶어줌


User.objects.values('country').annotate(Avg('score__value'))