-- INSERT = 테이블에 내가 가지고 있는 데이터를 삽입함

-- movies_movie(db안의 테이블명) (컬럼명)
-- 넣을 값 VALUES (컬럼에 맞는 값)

-- ORM문법 (터미널창에 입력)
-- Movie.objects.create(
--  title='dark night',
--  year=2008
-- )
INSERT INTO movies_movie (title, year) VALUES ('dark night', 2008);