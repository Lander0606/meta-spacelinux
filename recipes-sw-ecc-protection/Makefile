obj-m += sw_ecc_protection.o
 $(info CFLAGS: $(CFLAGS))
 all:
 	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
 
 clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
