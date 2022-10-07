

@cfu@
expression arg1, arg2, arg3;
@@

- pci_map_single(arg1,
+ dma_map_single(&arg1->dev, 
  arg2, arg3, 
(
- PCI_DMA_FROMDEVICE
+ DMA_FROM_DEVICE
|
- PCI_DMA_TODEVICE
+ DMA_TO_DEVICE
| 
- PCI_DMA_BIDIRECTIONAL
+ DMA_BIDIRECTIONAL
|
- PCI_DMA_NONE
+ DMA_NONE_DEVICE
)
  ) 




