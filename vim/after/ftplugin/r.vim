setlocal formatprg=formatr
setlocal shiftwidth=2 tabstop=2 softtabstop=2 
let &makeprg='R --no-save -s <$*'
let &errorformat='%.%#Error\ in\ %m,\ #%l'
