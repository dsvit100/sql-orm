-- movie = Movie.objects.get(id=1)
-- movie.delete()
-- delete는 save()가 없어도 바로 db에 반영됨

DELETE FROM movies_movie
WHERE id=2;

SELECT * FROM movies_movie;