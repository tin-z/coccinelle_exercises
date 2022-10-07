
// comment
// usage: spatch --sp-file ./ex2.cocci --dir <path>


@cfu@
expression * e;
expression arg1, arg2;
type T;
position p1;
@@

* T * e = (T *) kzalloc@p1(arg1, arg2);


@script:python@
p1 << cfu.p1;
@@
l1 = p1[0].line
print("kzalloc on line: {}".format(l1))



