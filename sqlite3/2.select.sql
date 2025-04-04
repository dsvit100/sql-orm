-- SQL문법으로
-- * = 모든 컬럼 선택

-- Movie.objects.all()
SELECT * FROM movies_movie;

-- User.objects.all()
SELECT * FROM movies_user;

-- Movie.objects.all().order_by('year')
-- 모든 영화들을 'year'로 정렬
SELECT * FROM movies_movie
ORDER BY year;

-- Movie.objects.all().order_by('-year') 내림차순 정렬
SELECT * FROM movies_movie
ORDER BY year DESC;

-- User.objects.filter(age=31)
SELECT * FROM movies_user
WHERE age=31; 

-- 20세 이상 30세 미만 필터
-- User.objects.filter(age__gre=20, age__lt=30)
SELECT * FROM movies_user
WHERE age >= 20 AND age < 30;

-- Movie.objects.filter(Q(year__lt=2000) | Q(year__gt=2010))
-- .............왜때문에 오류
-- Q() = 적용하고 싶은 필터를 Q로 감싸준다
-- OR을 쓸 수 없고 파이프 기호 사용
SELECT * FROM movies_movie
WHERE year < 2000 OR year > 2010;

-- 컬럼의 최댓값 가져오기 (MAX(컬럼명))
-- aggrigate여러 연산을 넣을 때 사용하는 함수
-- Movie.objects.aggregate(max('year'))
SELECT title, MAX(year) FROM movies_movie;

-- 모든 유저들의 평균값을 가져옴
-- User.objects.aggregate(Avg('age'))
SELECT AVG(age) FROM movies_user;

-- 1번 영화의 평균 평점(1번 영화에 달려있는 모든 리뷰를 가져와서 평균내기)
--  Score.objects.filter(movie_id=1).aggregate(Max('value'), Avg('value'))
SELECT MAX(value), AVG(value) FROM movies_score
WHERE movie_id=1;

-- 1번 유저가 쓴 댓글 개수 확인하기
-- Score.objects.filter(user_id=1).count() / len(Score.objects.filter(user_id=1))
SELECT COUNT(*) FROM movies_score
WHERE user_id=1;

-- django lookup filter
-- contains 포함되어있나요
-- User.objects.filter(age__lt=20)
-- lt = less than
-- gt = greate than
-- lte = less than equal
-- gte = greate than equel 크거나 같나요
SELECT * FROM movies_user
WHERE age>20;

-- Movie.objects.filter(title__contains='the')
SELECT * FROM movies_movie
WHERE title LIKE '%the%';
-- ? = 어떤 글자가 와도 되지만 칸은 지켜줘
-- * = 이 위치에 어떤 글자가 들어와도 됩니다.
-- % = * 와 동일하게 쓰임

-- Movie.objects.filter(title__startswith='the')
SELECT * FROM movies_movie
WHERE title LIKE 'the%';

-- Movie.objects.filter(title__endswith='on.')
SELECT * FROM movies_movie
WHERE title LIKE '%on.';

-- 앞뒤에 더 뭐가 붙어도 상관없으니 g로 시작, d로 끝나는 네글자가 들어간 DB 찾아줘
-- ORM에서 사용하려면 정규표현식을 사용해야 합니다.
-- 정규표현식이란 = 패턴을 만들 때 사용 (핸드폰 번호, 이메일 주소)
SELECT * FROM movies_movie
WHERE title LIKE '%g__d%';

-- 중복되지 않은 고유값 출력
-- User.objects.values('country').distinct().count()
SELECT COUNT(DISTINCT country) FROM movies_user;

-- 범위 출력
-- User.objects.filter(age__range=[20,29])
SELECT * FROM movies_user
WHERE age BETWEEN 20 AND 29;

-- Movie.objects.filter(year__in=[2000, 2005, 2010])
-- __in = 내가 주는 데이터와 일치하는 것들
SELECT * FROM movies_movie
WHERE year IN (2000, 2005, 2010);

table과 table을 섞어서 필터링 = join