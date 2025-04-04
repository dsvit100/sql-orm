-- movie = Movie.objects.get(id=1)
-- movie.title = '변경하려는 이름'
-- movie.save()

SELECT * FROM movies_movie
WHERE id=1;

UPDATE movies_movie
SET title='iron man'
WHERE id=1;