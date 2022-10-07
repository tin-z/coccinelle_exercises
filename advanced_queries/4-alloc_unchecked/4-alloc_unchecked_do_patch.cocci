// check *alloc functions which do not check return values


@rule1@
expression e, e1;
expression func =~ "(kzalloc|kmalloc|devm_kzalloc|devm_kmalloc)";
position p1;
@@
e@p1 = func(...);
 ... when != e == NULL
     when != e != NULL
     when != e = e1


// if rule1 is matched then apply rule2 also

@rule2 depends on rule1@
expression rule1.e;
expression rule1.func;
position rule1.p1;
@@
e@p1 = func(...);
+ if ( e == NULL)
+ {
+   return -ENOMEM;
+ }



