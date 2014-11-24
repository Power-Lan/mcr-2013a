
INSTALL_PATH = /usr/local/MATLAB/MATLAB_Compiler_Runtime
SILENT_CONFIG := $(shell mktemp)

MCR_R2013a_glnxa64_installer.zip:
	wget http://fr.mathworks.com/supportfiles/MCR_Runtime/R2013a/MCR_R2013a_glnxa64_installer.zip

all: MCR_R2013a_glnxa64_installer.zip
	mkdir -p mcr
	unzip MCR_R2013a_glnxa64_installer.zip -d mcr
	echo "destinationFolder=$(DEB)/$(INSTALL_PATH)" > $(SILENT_CONFIG)
	echo "agreeToLicense=yes" >> $(SILENT_CONFIG)
	echo "mode=silent" >> $(SILENT_CONFIG)
	./mcr/install -inputFile $(SILENT_CONFIG)

clean:
	rm -Rf mcr

mrproper: clean
	rm -f MCR_R2013a_glnxa64_installer.zip

