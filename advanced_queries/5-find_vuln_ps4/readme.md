
## refs
 - https://hackerone.com/reports/1350653 
 - https://outflux.net/slides/2011/defcon/kernel-exploitation.pdf
 - https://a13xp0p0v.github.io/2019/08/10/cfu.html
 - https://github.com/gmacario/learning-coccinelle/tree/master/wk4


## contents

 - The objective was to perform code pattern and find similar vuln to the https://hackerone.com/reports/1350653 ones, which is a heap overflow
    * ps4 is based on netbsd 9

 - The vulnerability is caused by not checking the size of user input before copying it to an mbuffer
 - The mbuffer was returned from the call to `MCLGET` which returns a mbuff with fixed size of `MCLBYTES` bytes number
 - By comparing the source code before and after the patch being applied we noted that was added the compare
```
...
  if (<len> >= MCLBYTES)
...
  if (<len> > MHLEN) { 
...
  <copy from user-controlled-input>
```

 - By following the example here, which uses to negate the condition of patch changes https://outflux.net/slides/2011/defcon/kernel-exploitation.pdf

 - The script produced [here](5-exp_net.cocci)
    * [freebsd results](output1.txt)
    * [netbsd results](output2.txt)
    * [xnu results](output3.txt)


## analysis
 
 - so we started inspecting outputs (no bug found on xnu)

 - freebsd sink points (not all)
```
MCLGET called by function 'ng_vjc_rcvdata' at line: ./sys/netgraph/ng_vjc.c:487
MCLGET called by function 'my_encap' at line: ./sys/dev/my/if_my.c:1345
MCLGET called by function 'dme_rxeof' at line: ./sys/dev/dme/if_dme.c:516
MCLGET called by function 'gss_get_mic' at line: ./sys/kgssapi/gss_get_mic.c:61
```

 - netbsd sink points
```
MCLGET called by function 'lii_rxintr' at line: ./sys/dev/pci/if_lii.c:999
MCLGET called by function 'wpi_tx_data' at line: ./sys/dev/pci/if_wpi.c:2037
MCLGET called by function 'et_encap' at line: ./sys/dev/pci/if_et.c:1873
MCLGET called by function 'ste_start' at line: ./sys/dev/pci/if_ste.c:708
MCLGET called by function 'cemac_ifstart' at line: ./sys/dev/cadence/if_cemac.c:814
```

 - Molte delle entry sopra erano FP
 - cmq sono ritornato sul output originale e per ogni entry controllavo se nella basedir del file non ci fosse nessuna ref a MCLBYTES, 
   ciò ha permesso di velocizzare il tutto

 - attenzione anche a:
    * funzioni che copiano ma non usano il len da user
    * funzioni che mascherano il lin e.g. & 0xFFF etc.
    * funzioni che non fanno memory copy palesi, e.g. m_append non c'è overflow


## future work
 - find vuln similar to those reported here https://twitter.com/m00nbsd/status/1134345384426446849/photo/1

