// ref, https://www.youtube.com/watch?v=xA5FBvuCvMs


// this rule collection informations, which can be used after
//  - we fixing the structure values, whatever they do contain
//  - this is helpfull because many structures in kernel linux contains function pointers, that are used in OB oriented-way
@platform@
identifier p, probefn, removefn;
@@

struct platform_driver p = {
  .probe = probefn,
  .remove = removefn,
};


//
@prb@
identifier platform.probefn, pdev;
expression e, e1, e2;
@@
probefn(struct platform_device * pdev, ...) {
  <+...
- e = kzalloc(e1, e2)
+ e = devm_kzalloc(&pdev->dev, e1, e2)
  ...
?-kfree(e);
  ...+>
}

@rem depends on prb@
identifier platform.removefn;
expression prb.e;
identifier func =~ "^kfree$"
@@
removefn(...) {
  <...
- kfree(e);
  ...>
}



// NOTE 1:
//  - we enclose our changes using ' <+... ...+>' enclosure to tell coccinelle that we want to match the code pattern
//    whatever position it is: at the beginning, in the middle, and at the end of the function declaration
//  - of course we could split the matching in to 3 code pattern matching
//
// NOTE 2:
//  - when we have '?' at the begining of the line, it means the matching is optional
//
// NOTE 3:
//  - <... ...> to define a block over what can be matched and modified more than once.
//
// NOTE 4:
//  - 'depends on' means it will be executed only if <rule-x> is matched or not if we add the '!' operand before the name
//  - we can combine more rule dependencies by using && and || operands
//  - e.g. @script:python depends on pktset && pktdata && pktzero@
//
// NOTE 5: Using regular expression to filter on identifier
//  - The '=~' operator uses a regular expression as argument.
//  - e.g. identifier func =~ "^\(sprintf\|strcat\|strcpy\)$";
//
// NOTE 5.2: We can also use regex to match function names
//  - e.g. @@ identifier e; @@ !e = \(kmalloc\|kzalloc\|kcalloc\|devm_kmalloc\|devm_kcalloc\)(...);
//
// NOTE 6: If we need all arrays
//  - @@ type T; T[] E; @@


