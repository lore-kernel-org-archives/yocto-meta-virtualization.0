Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DEFBE00B56; Tue,  3 Nov 2015 01:52:32 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E802E0088C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Nov 2015 01:52:28 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA39qRfg014331
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 3 Nov 2015 01:52:28 -0800 (PST)
Received: from [128.224.5.143] (128.224.5.143) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 3 Nov 2015 01:52:27 -0800
Message-ID: <563883DA.8050008@windriver.com>
Date: Tue, 3 Nov 2015 04:52:26 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <jianchuan.wang@windriver.com>, <meta-virtualization@yoctoproject.org>
References: <1446543315-25520-1-git-send-email-jianchuan.wang@windriver.com>
In-Reply-To: <1446543315-25520-1-git-send-email-jianchuan.wang@windriver.com>
Subject: Re: [PATCH] openvswith: Uprev to latest stable version 2.4.0
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
X-List-Received-Date: Tue, 03 Nov 2015 09:52:32 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

There was a typo in the short log (openvswith), but I fixed that during
my merge, and I've pushed the change.

Thanks!

Bruce

On 11/03/2015 04:35 AM, jianchuan.wang@windriver.com wrote:
> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>
> Uprev to git rev bb429e09f7783f1ba23ac0682ed9edf424f0cfbb (based on 2.4.0)
> - Remove non_reproducible_builds_cleanup.patch since it
>    have been in the version 2.4.0.
>
> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
> ---
>   .../non_reproducible_builds_cleanup.patch          | 18 ------
>   ...-1667bb34988358aaf1c92d0d21fad4b1c8698780.patch | 69 ----------------------
>   ...-bb429e09f7783f1ba23ac0682ed9edf424f0cfbb.patch | 69 ++++++++++++++++++++++
>   recipes-networking/openvswitch/openvswitch_git.bb  |  7 +--
>   4 files changed, 72 insertions(+), 91 deletions(-)
>   delete mode 100644 recipes-networking/openvswitch/openvswitch-git/non_reproducible_builds_cleanup.patch
>   delete mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-1667bb34988358aaf1c92d0d21fad4b1c8698780.patch
>   create mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-bb429e09f7783f1ba23ac0682ed9edf424f0cfbb.patch
>
> diff --git a/recipes-networking/openvswitch/openvswitch-git/non_reproducible_builds_cleanup.patch b/recipes-networking/openvswitch/openvswitch-git/non_reproducible_builds_cleanup.patch
> deleted file mode 100644
> index 999f2ea..0000000
> --- a/recipes-networking/openvswitch/openvswitch-git/non_reproducible_builds_cleanup.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Remove __DATE__, __TIME__ - error messages on non-reproducible builds
> -
> -Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ----
> - datapath/datapath.c             |    2 +-
> - 1 files changed, 1 insertions(+), 1 deletions(-)
> -
> ---- a/datapath/datapath.c
> -+++ b/datapath/datapath.c
> -@@ -2142,7 +2142,7 @@
> -
> - 	BUILD_BUG_ON(sizeof(struct ovs_skb_cb) > FIELD_SIZEOF(struct sk_buff, cb));
> -
> --	pr_info("Open vSwitch switching datapath %s, built "__DATE__" "__TIME__"\n",
> -+	pr_info("Open vSwitch switching datapath %s\n",
> - 		VERSION);
> -
> - 	err = action_fifos_init();
> diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-1667bb34988358aaf1c92d0d21fad4b1c8698780.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-1667bb34988358aaf1c92d0d21fad4b1c8698780.patch
> deleted file mode 100644
> index 76e312c..0000000
> --- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-1667bb34988358aaf1c92d0d21fad4b1c8698780.patch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -Add test-install rule to support ptest execution
> -
> -Signed-off-by: Radu Patriu <radu.patriu@enea.com>
> -
> ----
> - Makefile.am |    2 ++
> - test.mk     |   49 +++++++++++++++++++++++++++++++++++++++++++++++++
> - 2 files changed, 51 insertions(+)
> -
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -369,3 +369,5 @@
> - include vtep/automake.mk
> - include datapath-windows/automake.mk
> - include datapath-windows/include/automake.mk
> -+include test.mk
> -+
> ---- /dev/null
> -+++ b/test.mk
> -@@ -0,0 +1,49 @@
> -+TEST_DEST ?= ${prefix}/lib/openvswitch
> -+TEST_ROOT ?= ${prefix}/lib/openvswitch
> -+TEST_DEPEND =
> -+
> -+if HAVE_OPENSSL
> -+TEST_DEPEND += $(TESTPKI_FILES)
> -+endif
> -+
> -+test-install: $(TEST_DEPEND)
> -+	@list='$(noinst_PROGRAMS) $(EXTRA_DIST) $(dist_check_SCRIPTS) $(TEST_DEPEND) tests/atlocal tests/atconfig' ;\
> -+	install -d $(TEST_DEST)/tests ;\
> -+	install -d $(TEST_DEST)/python ;\
> -+	install -d $(TEST_DEST)/python/ovs ;\
> -+	install -d $(TEST_DEST)/python/ovs/db ;\
> -+	install -d $(TEST_DEST)/python/ovs/unixctl ;\
> -+	install -d $(TEST_DEST)/vswitchd ;\
> -+	install vswitchd/vswitch.ovsschema $(TEST_DEST)/vswitchd ;\
> -+	install -d $(TEST_DEST)/debian ;\
> -+	install debian/ovs-monitor-ipsec $(TEST_DEST)/debian ;\
> -+	install -d $(TEST_DEST)/build-aux ;\
> -+	install build-aux/check-structs $(TEST_DEST)/build-aux ;\
> -+	install -d $(TEST_DEST)/xenserver ;\
> -+	install xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync $(TEST_DEST)/xenserver ;\
> -+	install xenserver/opt_xensource_libexec_interface-reconfigure $(TEST_DEST)/xenserver ;\
> -+	install xenserver/opt_xensource_libexec_InterfaceReconfigure.py $(TEST_DEST)/xenserver ;\
> -+	install xenserver/opt_xensource_libexec_InterfaceReconfigureBridge.py $(TEST_DEST)/xenserver ;\
> -+	install xenserver/opt_xensource_libexec_InterfaceReconfigureVswitch.py $(TEST_DEST)/xenserver ;\
> -+	install -d $(TEST_DEST)/vtep ;\
> -+	install vtep/vtep.ovsschema $(TEST_DEST)/vtep ;\
> -+	for p in $$list ; do \
> -+	  echo $$p ;\
> -+	  p=$${p#./} ;\
> -+	  pre=$${p#tests\/} ;\
> -+	  if test $$pre != $$p ; then \
> -+	    echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
> -+	    install $$p $(TEST_DEST)/tests/$$pre ;\
> -+	    continue ;\
> -+	  fi ;\
> -+	  pre=$${p#python\/ovs\/} ;\
> -+	  if test $$pre != $$p ; then \
> -+	    echo installing $$p to $(TEST_DEST)/python/ovs/$$pre ;\
> -+	    install $$p $(TEST_DEST)/python/ovs/$$pre ;\
> -+	    continue ;\
> -+	  fi; \
> -+	done ;\
> -+	sed -i 's|abs_builddir=.*|abs_builddir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
> -+	sed -i 's|abs_srcdir=.*|abs_srcdir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
> -+	sed -i 's|abs_top_srcdir=.*|abs_top_srcdir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
> -+	sed -i 's|abs_top_builddir=.*|abs_top_builddir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
> diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-bb429e09f7783f1ba23ac0682ed9edf424f0cfbb.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-bb429e09f7783f1ba23ac0682ed9edf424f0cfbb.patch
> new file mode 100644
> index 0000000..c8ebff1
> --- /dev/null
> +++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-bb429e09f7783f1ba23ac0682ed9edf424f0cfbb.patch
> @@ -0,0 +1,69 @@
> +Add test-install rule to support ptest execution
> +
> +Signed-off-by: Radu Patriu <radu.patriu@enea.com>
> +
> +---
> + Makefile.am |    2 ++
> + test.mk     |   49 +++++++++++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 51 insertions(+)
> +
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -382,3 +382,5 @@
> + include datapath-windows/automake.mk
> + include datapath-windows/include/automake.mk
> + include windows/automake.mk
> ++include test.mk
> ++
> +--- /dev/null
> ++++ b/test.mk
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
> ++	@list='$(noinst_PROGRAMS) $(EXTRA_DIST) $(dist_check_SCRIPTS) $(TEST_DEPEND) tests/atlocal tests/atconfig' ;\
> ++	install -d $(TEST_DEST)/tests ;\
> ++	install -d $(TEST_DEST)/python ;\
> ++	install -d $(TEST_DEST)/python/ovs ;\
> ++	install -d $(TEST_DEST)/python/ovs/db ;\
> ++	install -d $(TEST_DEST)/python/ovs/unixctl ;\
> ++	install -d $(TEST_DEST)/vswitchd ;\
> ++	install vswitchd/vswitch.ovsschema $(TEST_DEST)/vswitchd ;\
> ++	install -d $(TEST_DEST)/debian ;\
> ++	install debian/ovs-monitor-ipsec $(TEST_DEST)/debian ;\
> ++	install -d $(TEST_DEST)/build-aux ;\
> ++	install build-aux/check-structs $(TEST_DEST)/build-aux ;\
> ++	install -d $(TEST_DEST)/xenserver ;\
> ++	install xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync $(TEST_DEST)/xenserver ;\
> ++	install xenserver/opt_xensource_libexec_interface-reconfigure $(TEST_DEST)/xenserver ;\
> ++	install xenserver/opt_xensource_libexec_InterfaceReconfigure.py $(TEST_DEST)/xenserver ;\
> ++	install xenserver/opt_xensource_libexec_InterfaceReconfigureBridge.py $(TEST_DEST)/xenserver ;\
> ++	install xenserver/opt_xensource_libexec_InterfaceReconfigureVswitch.py $(TEST_DEST)/xenserver ;\
> ++	install -d $(TEST_DEST)/vtep ;\
> ++	install vtep/vtep.ovsschema $(TEST_DEST)/vtep ;\
> ++	for p in $$list ; do \
> ++	  echo $$p ;\
> ++	  p=$${p#./} ;\
> ++	  pre=$${p#tests\/} ;\
> ++	  if test $$pre != $$p ; then \
> ++	    echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
> ++	    install $$p $(TEST_DEST)/tests/$$pre ;\
> ++	    continue ;\
> ++	  fi ;\
> ++	  pre=$${p#python\/ovs\/} ;\
> ++	  if test $$pre != $$p ; then \
> ++	    echo installing $$p to $(TEST_DEST)/python/ovs/$$pre ;\
> ++	    install $$p $(TEST_DEST)/python/ovs/$$pre ;\
> ++	    continue ;\
> ++	  fi; \
> ++	done ;\
> ++	sed -i 's|abs_builddir=.*|abs_builddir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
> ++	sed -i 's|abs_srcdir=.*|abs_srcdir='"'"'$(TEST_ROOT)/tests'"'"'|g' $(TEST_DEST)/tests/atconfig
> ++	sed -i 's|abs_top_srcdir=.*|abs_top_srcdir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
> ++	sed -i 's|abs_top_builddir=.*|abs_top_builddir='"'"'$(TEST_ROOT)'"'"'|g' $(TEST_DEST)/tests/atconfig
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 13d6165..0c918cd 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -9,19 +9,18 @@ RDEPENDS_${PN}-ptest += "\
>   	"
>
>   S = "${WORKDIR}/git"
> -PV = "2.3.90+${SRCREV}"
> +PV = "2.4.0+${SRCREV}"
>
>   FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
>
> -SRCREV = "1667bb34988358aaf1c92d0d21fad4b1c8698780"
> +SRCREV = "bb429e09f7783f1ba23ac0682ed9edf424f0cfbb"
>   SRC_URI += "\
> -	git://github.com/openvswitch/ovs.git;protocol=git \
> +	git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.4 \
>   	file://openvswitch-add-more-target-python-substitutions.patch \
>   	file://openvswitch-add-ptest-${SRCREV}.patch \
>   	file://run-ptest \
>   	file://disable_m4_check.patch \
>   	file://kernel_module.patch \
> -	file://non_reproducible_builds_cleanup.patch \
>   	"
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=5973c953e3c8a767cf0808ff8a0bac1b"
>


