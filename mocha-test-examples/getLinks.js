let links = [];

let exceptionLinks = [
  '#', null, "//www.liveinternet.ru/click"
];

$('a').each(function (i, o) {
    let link = o.getAttribute('href');
    let isNotExist = true;
    for(var item in exceptionLinks) {
      if(exceptionLinks[item] == link) {
        isNotExist = false;
      }
    }

    for(var item in links) {
      if(links[item] == link) {
        isNotExist = false;
      }
    }

    if(isNotExist) {
      links.push(link);
    }
});

console.log(links);
