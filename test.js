import { Manga, Cover, Author } from 'mangadex-full-api'
import express from 'express';
import cors from 'cors';
const app = express();
const port = 3777;


async function getBook(searchQuery) {
  var book_obj = []
  let results = await Manga.search({
    contentRating: ["safe", "suggestive"],
    title: searchQuery,
    limit: 21 // API Max is 100 per request, but this function accepts more
  })

  let count = 0;
  for (var i = 0; i < results.length; i++) {
    let auth = await Author.get(results[i].authors[0].id)
    let cov = await Cover.get(results[i].mainCover.id)
    count = count + 2;
    let pr = Math.floor(Math.random() * 10000);
    let sto = Math.floor(Math.random() * 100);
    book_obj.push({
      id: results[i].id,
      name: results[i].localizedTitle.en,
      desc: results[i].localizedDescription.en,
      price: pr,
      stock: sto,
      author: auth.name,
      authorid: auth.id,
      image: cov.image512
    })
  }

  return (book_obj)
}
async function getBookJSON(query) {
  let books = await getBook(query);
  return JSON.stringify(books)
}

app.use(cors({
  origin: '*'
}));

app.get('/', async (req, res) => {
  console.log(`request from`)
  console.log(req.headers.origin)
  console.log(req.ip)
  console.log(req.url)
  var json_result = await getBookJSON(req.query.str)
  res.send(json_result)
});

app.listen(port, () => {
  console.log(`BookServer listening on port ${port}!`)
});