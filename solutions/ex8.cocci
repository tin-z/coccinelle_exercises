
@cfu@
expression e, e1;
identifier f;
@@

e =
(
  kzalloc
|
  kmalloc
)
 (...);
... when != e = e1
(
  e == NULL || ...
|
  e != NULL && ...
|
* e->f
)



