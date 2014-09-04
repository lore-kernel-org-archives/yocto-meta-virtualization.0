Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30229E00744; Thu,  4 Sep 2014 12:40:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7146FE004F5
	for <meta-virtualization@yoctoproject.org>;
	Thu,  4 Sep 2014 12:40:47 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s84JejcF027408
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 4 Sep 2014 12:40:45 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 12:40:45 -0700
Message-ID: <5408C028.9070906@windriver.com>
Date: Thu, 4 Sep 2014 15:40:24 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Chong Lu <Chong.Lu@windriver.com>, <meta-virtualization@yoctoproject.org>
References: <1409816891-468-1-git-send-email-Chong.Lu@windriver.com>
In-Reply-To: <1409816891-468-1-git-send-email-Chong.Lu@windriver.com>
Subject: Re: [PATCH V3] lxc: fix RDEPENDS on bash
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
X-List-Received-Date: Thu, 04 Sep 2014 19:40:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-09-04 03:48 AM, Chong Lu wrote:
> Split a ${PN}-template pkg to put ${datadir}/lxc/templates/, and debash in
> ${datadir}/lxc/hooks/* since the checkbashisms shows there are no bashism, so
> use /bin/sh.
>
> checkbashisms is from devscripts package:
> http://packages.ubuntu.com/trusty/devscripts
>
> Bash scripts:
> lxc/usr/share/lxc/hooks/mountcgroups:#!/bin/bash
> lxc/usr/share/lxc/hooks/ubuntu-cloud-prep:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-debian:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-openmandriva:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-archlinux:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-centos:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-plamo:1:#!/bin/bash -eu
> lxc/usr/share/lxc/templates/lxc-ubuntu-cloud:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-opensuse:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-gentoo:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-altlinux:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-sshd:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-ubuntu:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-cirros:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-busybox:1:#!/bin/bash
> lxc/usr/share/lxc/templates/lxc-fedora:1:#!/bin/bash

Looks good.

merged.

Bruce

>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   recipes-containers/lxc/lxc_1.0.5.bb |    8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-containers/lxc/lxc_1.0.5.bb b/recipes-containers/lxc/lxc_1.0.5.bb
> index bea1ad0..04c027d 100644
> --- a/recipes-containers/lxc/lxc_1.0.5.bb
> +++ b/recipes-containers/lxc/lxc_1.0.5.bb
> @@ -37,10 +37,11 @@ S = "${WORKDIR}/${BPN}-${PV}"
>   PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
>   EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
>
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "templates"
>   PACKAGECONFIG[doc] = "--enable-doc,--disable-doc,,"
>   PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
>   PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
> +PACKAGECONFIG[templates] = ",,, ${PN}-templates"
>
>   inherit autotools pkgconfig ptest
>
> @@ -48,6 +49,9 @@ FILES_${PN}-doc = "${mandir} ${infodir}"
>   # For LXC the docdir only contains example configuration files and should be included in the lxc package
>   FILES_${PN} += "${docdir}"
>   FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
> +PACKAGES =+ "${PN}-templates"
> +FILES_${PN}-templates += "${datadir}/lxc/templates"
> +RDEPENDS_${PN}-templates += "bash"
>
>   PRIVATE_LIBS_${PN}-ptest = "liblxc.so.1"
>
> @@ -59,6 +63,8 @@ do_install_append() {
>   	echo "d root root 0755 ${localstatedir}/cache/lxc none" \
>   	     > ${D}${sysconfdir}/default/volatiles/99_lxc
>
> +	for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do \
> +	    sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
>   }
>
>   EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
>


