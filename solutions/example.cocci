@cfu@
position p1;
expression e;
@@

e = dma_map_single@p1(...);


@script:python@
p1 << cfu.p1;
@@
l1 = p1[0].line
print("dma_map_single on line: {}".format(l1))


