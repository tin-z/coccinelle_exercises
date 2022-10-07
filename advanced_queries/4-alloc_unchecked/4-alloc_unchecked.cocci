// check *alloc functions which do not check return values


@r1@
expression e, e1;
expression func =~ "(kzalloc|kmalloc|devm_kzalloc|devm_kmalloc)";
position p1;
@@
e@p1 = func(...);
 ... when != e == NULL
     when != e != NULL
     when != e = e1

@r2@
position r1.p1, p2;
expression r1.e, r1.func;
identifier f;
@@
f@p2(...)
{
... when any
e@p1 = func(...);
... when any
}



@script:python depends on r2@
f << r2.f;
p1 << r1.p1;
@@
l1 = p1[0]
print("*alloc* without null-check called by function '{}' at line: {}:{}".format(f, l1.file, l1.line))



