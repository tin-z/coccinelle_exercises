
// note: 
//    - if we do not insert the 'exists' flag after the rule name, then it will match only the exact code patterns
//    - that means if-else blocks are skiped
//    - this is not required if we use '*' operand which adopt this behavior by default

@cfu exists@
expression e, e1;
identifier f;
position p1, p2;
@@

e =
(
  kzalloc@p1
|
  kmalloc@p1
)
 (...);
... when != e = e1
(
  e == NULL || ...
|
  e != NULL && ...
|
 e@p2->f
)




@script:python@
p1 << cfu.p1;
p2 << cfu.p2;
@@
l1 = p1[0]
l2 = p2[0]
print("kmalloc/kzalloc on {}:{}".format(l1.file, l1.line))
print("undef usage at {}:{}".format(l2.file, l2.line))
print("")







