Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37062E00973; Mon, 21 Mar 2016 07:26:58 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F3AC0E00948
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Mar 2016 07:26:54 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2LEQr8i002906
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Mar 2016 07:26:53 -0700 (PDT)
Received: from server.local (147.11.116.210) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 21 Mar 2016 07:26:52 -0700
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1458231905-15071-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <56F004AC.4090001@windriver.com>
Date: Mon, 21 Mar 2016 10:26:52 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.0
MIME-Version: 1.0
In-Reply-To: <1458231905-15071-1-git-send-email-mark.asselstine@windriver.com>
Cc: arnold.german@windriver.com
Subject: Re: [PATCH] lxc: fix build issue - unable to find Python.h
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
X-List-Received-Date: Mon, 21 Mar 2016 14:26:58 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-03-17 12:25 PM, Mark Asselstine wrote:
> Prior to poky commit 3d45853eef1269b455d840a60491802251368378
> [python3: fix do_configure check platform triplet error] lxc's
> configure scripts would fail to find python3 and would therefor
> configure with python3 support disabled.
>
> After poky integrated the above commit lxc can, and does, detect
> python3 and attempts to configure with python support. Unfortunately
> it would detect the host's python3 which it would use to run setup.py
> and therefor get the host's include path etc. and ultimately fail to
> build.
>
> To fix this we make 'python' support configurable via a PACKAGECONFIG
> and we default to not configuring with this support, to match our
> previous configuration. We also fix things such that 'python' support
> can be enabled in the PACKAGECONFIG and the build will complete
> successfully, using our python3 and not the host's.

merged as-is to master.

>
> We might want to eventually enable the python support but since this
> not only enables python extensions but even goes as far as turning
> scripts like lxc-ls into python scripts, instead of shell scripts,
> keeping it disabled for now is the minimally invasive approach.

Indeed. That's overkill for now, but definitely something to consider.

Bruce

>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   recipes-containers/lxc/lxc_1.1.4.bb | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/recipes-containers/lxc/lxc_1.1.4.bb b/recipes-containers/lxc/lxc_1.1.4.bb
> index e017dcf..a4c44d2 100644
> --- a/recipes-containers/lxc/lxc_1.1.4.bb
> +++ b/recipes-containers/lxc/lxc_1.1.4.bb
> @@ -64,6 +64,13 @@ PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparm
>   PACKAGECONFIG[templates] = ",,, ${PN}-templates"
>   PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
>   PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
> +PACKAGECONFIG[python] = "--enable-python,--disable-python,python3,python3-core"
> +
> +# required by python3 to run setup.py
> +export BUILD_SYS
> +export HOST_SYS
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
>
>   inherit autotools pkgconfig ptest update-rc.d systemd
>
> @@ -78,6 +85,7 @@ INITSCRIPT_PARAMS_${PN}-setup = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
>   FILES_${PN}-doc = "${mandir} ${infodir}"
>   # For LXC the docdir only contains example configuration files and should be included in the lxc package
>   FILES_${PN} += "${docdir}"
> +FILES_${PN} += "${libdir}/python3*"
>   FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
>   PACKAGES =+ "${PN}-templates ${PN}-setup ${PN}-networking"
>   FILES_${PN}-templates += "${datadir}/lxc/templates"
> @@ -92,6 +100,12 @@ FILES_${PN}-setup += "/etc/init.d"
>
>   PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
>
> +CACHED_CONFIGUREVARS += " \
> +    ac_cv_path_PYTHON='${STAGING_BINDIR_NATIVE}/python3-native/python3' \
> +    am_cv_python_pyexecdir='${exec_prefix}/${libdir}/python3.5/site-packages' \
> +    am_cv_python_pythondir='${prefix}/${libdir}/python3.5/site-packages' \
> +"
> +
>   do_install_append() {
>   	# The /var/cache/lxc directory created by the Makefile
>   	# is wiped out in volatile, we need to create this at boot.
> @@ -107,6 +121,13 @@ do_install_append() {
>   	    install -d ${D}${sysconfdir}/init.d
>   	    install -m 755 config/init/sysvinit/lxc* ${D}${sysconfdir}/init.d
>   	fi
> +
> +	# since python3-native is used for install location this will not be
> +	# suitable for the target and we will have to correct the package install
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
> +	    if [ -d ${D}${exec_prefix}/lib/python* ]; then mv ${D}${exec_prefix}/lib/python* ${D}${libdir}/; fi
> +	    rmdir --ignore-fail-on-non-empty ${D}${exec_prefix}/lib
> +	fi
>   }
>
>   EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
>


