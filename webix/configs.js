dt = webix.ui({
  container: 'datatable',
  view: 'datatable',
  columns: [
    {
      id: 'connectionType',
      header: [
        {text: Lang.aliasServer},
        {text: '', content: 'selectFilter'}
      ],
      fillspace: 1,
      sort: 'string'
    }
  autoheight: true,
  data: data
});
