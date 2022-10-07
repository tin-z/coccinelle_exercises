

@cfu@
expression arg1, arg2, arg3;
position p1;
@@

dma_map_single@p1(arg1, arg2, arg3, 
(
  DMA_FROM_DEVICE
|
  DMA_TO_DEVICE
| 
  DMA_BIDIRECTIONAL
|
  DMA_NONE_DEVICE
)
  ) 



@script:python@
p1 << cfu.p1;
@@
l1 = p1[0]
print("dma_map_single on {}:{}".format(l1.file, l1.line))



