Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08DC6E00B7F
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 Apr 2014 17:53:15 -0700 (PDT)
Received: by mail-lb0-f174.google.com with SMTP id u14so7524830lbd.19
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 Apr 2014 17:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QaYW0EYG/KVJyybUGx4MTttRZrCHrX/+AOV+kjSiugE=;
	b=gwFKa0sqIPQhGEWZzYdjMcqqwkyDlVjuXjt62DaT4D5YML98KwyOSiJvtGk3MIjioa
	v4kOWOcB/W+xhMrqvSV/JNYiMV6xvDACp1dgt6owL6xWiJj/Z1E5L9GVpFb68CCf9CMX
	G6gOZI1CEtzByI0ad/SA2J5Z6hPQHIk7yfB2Kq2nw6GT06TLgFFOT7Xv39b15Jo3ecyB
	IyDde3Jqhv0HwfQ9uF42WPmiO8wdoLpOWEPOvsOpMSxGDU4R6mKD84YTpxviuWn6S5IH
	XYypS0Ja3jSWJ4yRqBuCb+qWnGikBaIHHmdzBC8tym4g6Kj8/l5KIWe4JqhsIvpLQ5xz
	9P/g==
MIME-Version: 1.0
X-Received: by 10.152.18.229 with SMTP id z5mr12046477lad.27.1396399993568;
	Tue, 01 Apr 2014 17:53:13 -0700 (PDT)
Received: by 10.112.58.132 with HTTP; Tue, 1 Apr 2014 17:53:13 -0700 (PDT)
In-Reply-To: <1396255798-12753-1-git-send-email-radu.patriu@enea.com>
References: <1396255798-12753-1-git-send-email-radu.patriu@enea.com>
Date: Tue, 1 Apr 2014 20:53:13 -0400
Message-ID: <CADkTA4O2QAqbpkR+MynBre3VhXkiyY+uC77P3DQF_K0RkgR72w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Radu Patriu <radu.patriu@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: add ptest support
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Apr 2014 00:53:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 31, 2014 at 4:49 AM, Radu Patriu <radu.patriu@enea.com> wrote:
> Install openvswitch test suite and run it as ptest.

Looks good to me.

merged.

Bruce

>
> Signed-off-by: Radu Patriu <radu.patriu@enea.com>
> ---
>  .../openvswitch/files/openvswitch-add-ptest.patch  |   67 ++++++++++++++++++++
>  recipes-networking/openvswitch/files/run-ptest     |    4 ++
>  .../openvswitch/openvswitch_2.0.0.bb               |   16 ++++-
>  3 files changed, 85 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-networking/openvswitch/files/openvswitch-add-ptest.patch
>  create mode 100644 recipes-networking/openvswitch/files/run-ptest
>
> diff --git a/recipes-networking/openvswitch/files/openvswitch-add-ptest.patch b/recipes-networking/openvswitch/files/openvswitch-add-ptest.patch
> new file mode 100644
> index 0000000..aebb182
> --- /dev/null
> +++ b/recipes-networking/openvswitch/files/openvswitch-add-ptest.patch
> @@ -0,0 +1,67 @@
> +Add test-install rule to support ptest execution
> +
> +Signed-off-by: Radu Patriu <radu.patriu@enea.com>
> +
> +Index: ovs/Makefile.am
> +===================================================================
> +--- ovs.orig/Makefile.am       2014-03-10 16:19:46.000000000 +0200
> ++++ ovs/Makefile.am    2014-03-10 16:23:10.481075341 +0200
> +@@ -276,3 +276,4 @@
> + include python/automake.mk
> + include python/compat/automake.mk
> + include tutorial/automake.mk
> ++include test.mk
> +Index: ovs/test.mk
> +===================================================================
> +--- /dev/null  1970-01-01 00:00:00.000000000 +0000
> ++++ ovs/test.mk        2014-03-10 16:42:41.000000000 +0200
> +@@ -0,0 +1,49 @@
> ++TEST_DEST ?= ${prefix}/lib/openvswitch
> ++TEST_ROOT ?= ${prefix}/lib/openvswitch
> ++TEST_DEPEND =
> ++
> ++if HAVE_OPENSSL
> ++TEST_DEPEND += $(TESTPKI_FILES)
> ++endif
> ++
> ++test-install: $(TEST_DEPEND)
> ++      @list='$(noinst_PROGRAMS) $(EXTRA_DIST) $(dist_check_SCRIPTS) $(TEST_DEPEND) tests/atlocal tests/atconfig' ;\
> ++      install -d $(TEST_DEST)/tests ;\
> ++      install -d $(TEST_DEST)/python ;\
> ++      install -d $(TEST_DEST)/python/ovs ;\
> ++      install -d $(TEST_DEST)/python/ovs/db ;\
> ++      install -d $(TEST_DEST)/python/ovs/unixctl ;\
> ++      install -d $(TEST_DEST)/vswitchd ;\
> ++      install vswitchd/vswitch.ovsschema $(TEST_DEST)/vswitchd ;\
> ++      install -d $(TEST_DEST)/debian ;\
> ++      install debian/ovs-monitor-ipsec $(TEST_DEST)/debian ;\
> ++      install -d $(TEST_DEST)/build-aux ;\
> ++      install build-aux/check-structs $(TEST_DEST)/build-aux ;\
> ++      install -d $(TEST_DEST)/xenserver ;\
> ++      install xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync $(TEST_DEST)/xenserver ;\
> ++      install xenserver/opt_xensource_libexec_interface-reconfigure $(TEST_DEST)/xenserver ;\
> ++      install xenserver/opt_xensource_libexec_InterfaceReconfigure.py $(TEST_DEST)/xenserver ;\
> ++      install xenserver/opt_xensource_libexec_InterfaceReconfigureBridge.py $(TEST_DEST)/xenserver ;\
> ++      install xenserver/opt_xensource_libexec_InterfaceReconfigureVswitch.py $(TEST_DEST)/xenserver ;\
> ++      install -d $(TEST_DEST)/vtep ;\
> ++      install vtep/vtep.ovsschema $(TEST_DEST)/vtep ;\
> ++      for p in $$list ; do \
> ++        echo $$p ;\
> ++        p=$${p#./} ;\
> ++        pre=$${p#tests\/} ;\
> ++        if test $$pre != $$p ; then \
> ++          echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
> ++          install $$p $(TEST_DEST)/tests/$$pre ;\
> ++          continue ;\
> ++        fi ;\
> ++        pre=$${p#python\/ovs\/} ;\
> ++        if test $$pre != $$p ; then \
> ++          echo installing $$p to $(TEST_DEST)/python/ovs/$$pre ;\
> ++          install $$p $(TEST_DEST)/python/ovs/$$pre ;\
> ++          continue ;\
> ++        fi; \
> ++      done ;\
> ++      sed -i 's|abs_builddir=.*|abs_builddir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|abs_srcdir=.*|abs_srcdir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|abs_top_srcdir=.*|abs_top_srcdir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|abs_top_builddir=.*|abs_top_builddir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
> diff --git a/recipes-networking/openvswitch/files/run-ptest b/recipes-networking/openvswitch/files/run-ptest
> new file mode 100644
> index 0000000..dd06707
> --- /dev/null
> +++ b/recipes-networking/openvswitch/files/run-ptest
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +./tests/testsuite --am-fmt -C tests AUTOTEST_PATH=utilities:vswitchd:ovsdb:tests
> +
> diff --git a/recipes-networking/openvswitch/openvswitch_2.0.0.bb b/recipes-networking/openvswitch/openvswitch_2.0.0.bb
> index 15c4dca..0100308 100644
> --- a/recipes-networking/openvswitch/openvswitch_2.0.0.bb
> +++ b/recipes-networking/openvswitch/openvswitch_2.0.0.bb
> @@ -14,6 +14,10 @@ RDEPENDS_${PN}-pki = "${PN}"
>  RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
>  RRECOMMENDS_${PN} += "kernel-module-openvswitch"
>
> +RDEPENDS_${PN}-ptest += "python-logging python-syslog python-argparse python-io \
> +                     python-fcntl python-shell python-lang python-xml python-math \
> +                     python-datetime python-netclient python sed"
> +
>  # Some installers will fail because of an install order based on
>  # rdeps.  E.g. ovs-pki calls sed in the postinstall.  sed may be
>  # queued for install later.
> @@ -26,7 +30,9 @@ SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
>         file://openvswitch-controller-setup \
>         file://openvswitch-add-target-python-handling.patch \
>         file://openvswitch-add-target-perl-handling.patch \
> -        file://openvswitch-add-more-target-python-substitutions.patch \
> +       file://openvswitch-add-more-target-python-substitutions.patch \
> +       file://openvswitch-add-ptest.patch \
> +       file://run-ptest \
>         "
>
>  SRC_URI[md5sum] = "7d7a58350e634e515e0fe43c64d64f44"
> @@ -60,7 +66,13 @@ FILES_${PN}-switch = "${sysconfdir}/init.d/openvswitch-switch \
>  FILES_${PN} += "${datadir}/ovsdbmonitor"
>  FILES_${PN} += "/run"
>
> -inherit autotools update-rc.d
> +inherit autotools update-rc.d ptest
> +
> +EXTRA_OEMAKE += "TEST_DEST=${D}${PTEST_PATH} TEST_ROOT=${PTEST_PATH}"
> +
> +do_install_ptest() {
> +       oe_runmake test-install
> +}
>
>  INITSCRIPT_PACKAGES = "${PN}-switch ${PN}-controller"
>  INITSCRIPT_NAME_${PN}-switch = "openvswitch-switch"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

