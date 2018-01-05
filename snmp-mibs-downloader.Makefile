# -*- mode: Makefile;-*-
# Makefile for mib-downloader
#

CONFFILES= snmp-mibs-downloader.conf \
           iana.conf ianalist \
           rfc.conf rfclist rfcmibs.diff \
           simpleweb.conf simplelist \
           ianarfc.conf ianarfclist

BINFILES = download-mibs smistrip

INSTALL=   /usr/bin/install


install: dirs installbins
	$(INSTALL) -m 644 $(CONFFILES)  $(DESTDIR)$(REPO_BASE)
	cp mibrfcs/*                    $(DESTDIR)$(REPO_DOWNLOADER_BASE)/mibrfcs
	cp mibiana/*                    $(DESTDIR)$(REPO_DOWNLOADER_BASE)/mibiana
	gzip -n9 -f                     $(DESTDIR)$(REPO_DOWNLOADER_BASE)/mibrfcs/*
	gzip -n9 -f                     $(DESTDIR)$(REPO_DOWNLOADER_BASE)/mibiana/*
	ln -sf /var/lib/snmp/mibs/ietf  $(DESTDIR)$(REPO_SNMP_MIBS_DIRS)/ietf
	ln -sf /var/lib/snmp/mibs/iana  $(DESTDIR)$(REPO_SNMP_MIBS_DIRS)/iana


clean: $(BINFILES)
	rm -rf $(DESTDIR)$(REPO_BASE)
	rm -rf $(DESTDIR)$(REPO_DOWNLOADER_BASE)

installbins: $(BINFILES)
	$(INSTALL) -m 755 $(BINFILES)   $(DESTDIR)/usr/bin

$(BINFILES): 
	rm -f  $(DESTDIR)/usr/bin/$@

dirs:
	mkdir -p $(DESTDIR)$(REPO_BASE)
	mkdir -p $(DESTDIR)$(REPO_DOWNLOADER_BASE)/mib{rfcs,iana}

.PHONY : install clean dirs $(BINFILES)
