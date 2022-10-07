
@@
expression e1, e2;
@@

- e1->hwif_data = e2
+ ide_set_hwifdata(e1, e2)




@@
expression e1;
@@

- e1->hwif_data
+ ide_get_hwifdata(e1)




