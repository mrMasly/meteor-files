
upload = (file, name, cb) ->
  reader = new FileReader
  reader.onload = =>
    Meteor.call '__mrmasly__files__upload__', file.name, reader.result, name, (err, res) =>
      cb err, res
  reader.readAsBinaryString file

CollectionBehaviours.define 'files', (data) ->

  # изменям url
  defaultTransform = @collection._transform
  @collection._transform = (doc) ->
    if doc[data.field]?
      for store, url of doc[data.field]
        doc[data.field][store] = "#{data.url}/#{url}"
    if defaultTransform then defaultTransform doc else doc


  @collection._insert = @collection.insert
  @collection.insert = (doc, cb) =>
    if doc[data.field]?
      file = doc[data.field]
      upload file, @collection._name, (err, res) =>
        if err then return cb err
        doc[data.field] = res
        @collection._insert doc, cb
    else
      @collection._insert doc, cb

  @collection._update = @collection.update
  @collection.update = (selector, modifer, callback) =>
    if modifer.$set? and modifer.$set[data.field]?
      file = modifer.$set[data.field]
      upload file, @collection._name, (err, res) =>
        if err then return cb err
        modifer.$set[data.field] = res
        @collection._update selector, modifer, callback
    else
      @collection._update selector, modifer, callback
