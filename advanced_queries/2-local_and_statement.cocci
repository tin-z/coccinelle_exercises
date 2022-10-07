// ref, https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1349602.html

// task: remove unnecessary temporary variables ensuring that ret is a local variable
@@
local idexpression ret;
expression e;
@@

-ret =
+return
    e;
- return ret;


@@ 
identifier e1; 
expression e2; 
statement S1, S2; 
@@

+ e1 = e2;
if (
-    (e1 = e2)
+     e1
        == NULL) S1 else S2



// NOTE 1:
//  - 'local idexpression' is used to match only local vars
//
// NOTE 2:
//  - 'statement' if-else blocks


