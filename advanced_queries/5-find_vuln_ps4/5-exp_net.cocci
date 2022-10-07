
@r1@
position p1;
@@
MCLGET@p1(...)


@r2 exists@
identifier f;
position r1.p1;
expression e;
statement S1;
@@

(
if (e > MCLBYTES)
  S1
|
if (e >= MCLBYTES)
  S1
|
if (e <= MCLBYTES)
  S1
)

...

MCLGET@p1(...)

...


@result depends on (!r2) @
position r1.p1;
position p2;
identifier f;
@@

f@p2(...)
{ 
  ...  when any
* MCLGET@p1(...)
  ...  when any
}


@script:python depends on result@
f << result.f;
p1 << r1.p1;
@@
l1 = p1[0]
print("MCLGET called by function '{}' at line: {}:{}".format(f, l1.file, l1.line))
// in future :
// url_git = "https://<link-repo-git>/<branch>/"
// range = 8
// print(url_git + l1.file[1:] + "#L{}-L{}".format(max(0, int(l1.line) - range), int(l1.line) + range))
// print()

