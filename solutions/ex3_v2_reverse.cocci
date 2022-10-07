

@cfu@
expression arg1, arg2, arg3;
@@

- dma_map_single(&arg1->dev, 
+ pci_map_single(arg1,
  arg2, arg3, 
(
- DMA_FROM_DEVICE
+ PCI_DMA_FROMDEVICE
|
- DMA_TO_DEVICE
+ PCI_DMA_TODEVICE
| 
- DMA_BIDIRECTIONAL
+ PCI_DMA_BIDIRECTIONAL
|
- DMA_NONE_DEVICE
+ PCI_DMA_NONE
)
  ) 




