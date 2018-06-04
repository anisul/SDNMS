install:
	install sdnms sdnms_tui /usr/local/bin
	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
	grep -q "`cat sdnms.services`" /etc/services || cat sdnms.services >> /etc/services
	install sdnms.xinetd /etc/xinetd.d/sdnms
	ln -sf /usr/local/bin/sdnms_tui /usr/local/bin/sdnms_net
	ln -sf /usr/local/bin/sdnms_tui /usr/local/bin/sdnms_gui

clone:
	git clone https://github.com/anisul/SDNMS.git

download:
	git pull

upload:
	git add .
	git commit -a
	git push origin

tags:
	git push origin --tags
