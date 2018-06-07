install: sdnms_ui.mo
	install sdnms sdnms_tui /usr/local/bin
	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
	grep -q "`cat sdnms.services`" /etc/services || cat sdnms.services >> /etc/services
	install sdnms.xinetd /etc/xinetd.d/sdnms
	ln -sf /usr/local/bin/sdnms_tui /usr/local/bin/sdnms_net
	ln -sf /usr/local/bin/sdnms_tui /usr/local/bin/sdnms_gui
	install sdnms_ui.mo /usr/share/locale/bn/LC_MESSAGES/sdnms_ui.mo

sdnms_gui.pot: sdnms_gui
	xgettext -o sdnms_ui.pot -L Shell sdnms_gui

sdnms_gui-bn.mo: sdnms_ui-bn.po
	msgfmt -o sdnms_ui.mo sdnms_ui-bn.po

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
