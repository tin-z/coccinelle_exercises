
@@
ide_hwif_t * e1;
expression e2;
@@

- e1->hwif_data = e2
+ ide_set_hwifdata(e1, e2)



@@
ide_hwif_t * e1;
@@

- e1->hwif_data
+ ide_get_hwifdata(e1)




