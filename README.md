### This project in Beta

-------

## Example
Configure Meteor Mongo Collection
```javascript
const Movies = new Mongo.Collection('movies');
Movies.attachBehaviour('files', {
  field: 'image',
  dir: '/../files/movies',
  url: '/files/movies',
  stores:
    xs: [320, 180]
    sm: [640, 360]
});
```
Options
- **field** - The field of the document in which the file will be stored
- **dir** - Path to the directory for storing files (relative from project directory. It is recommended to store files outside the meteor project directory, as in the example above)
- **url** - Url, which will be automatically generated for files. Meteor will link this url to the file directory. You can specify a url with '//' - for example, if you want to distribute files using Nginx
- **stores** - Storage for files. The original file will be saved in 'stores.original'. By specifying Other stores - you can pass a function - what to do with the files before saving or the array [width, height] - for images resize

Save document with file
```javascript
function save(e) {
  // get file source
  file = e.targer.files[0]
  // save new document width file
  Movies.insert({
    name: 'My awesome movie'
    image: file
  }, function(err, res) {
    // error if mongo error or files error
    if(err != null) {
      console.log(err);
    }
  })
}

```
Get document with files
```javascript
let movie = Movies.findOne();
console.log(movie);
// result:
// movie = {
//   name: 'My awesome movie'
//   image: {
//     original: '/files/movies/1d22f89sd98/original.jpg',
//     xs: '/files/movies/1d22f89sd98/xs.jpg',
//     sm: '/files/movies/1d22f89sd98/sm.jpg'
//   }
// }
//
```
--------

## Features & Roadmap
- [x] Easy configure mongo collection
- [x] Create url for files by meteor WebApp
- [x] Support image (jpeg/png)
- [x] Easy resize image files
- [ ] Auto remove files, are't in documents
- [ ] User function for edit file after upload
- [ ] Validation files
- [ ] Multiple files to one mongo document
- [ ] Other fiches))

-------


LICENCE ISC - Created @mrMasly
