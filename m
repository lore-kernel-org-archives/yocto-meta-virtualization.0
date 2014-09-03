Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E9F93E00566; Wed,  3 Sep 2014 05:46:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7EE6CE0054C
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Sep 2014 05:46:08 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s83Ck6oR008813
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 3 Sep 2014 05:46:06 -0700 (PDT)
Received: from server.local (128.224.20.149) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 3 Sep 2014 05:46:05 -0700
Message-ID: <54070D8E.4020307@windriver.com>
Date: Wed, 3 Sep 2014 08:46:06 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Chong Lu <Chong.Lu@windriver.com>, <meta-virtualization@yoctoproject.org>
References: <1409735822-23058-1-git-send-email-Chong.Lu@windriver.com>
In-Reply-To: <1409735822-23058-1-git-send-email-Chong.Lu@windriver.com>
Subject: Re: [PATCH V2] lxc: fix RDEPENDS on bash
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
X-List-Received-Date: Wed, 03 Sep 2014 12:46:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-09-03, 5:17 AM, Chong Lu wrote:
> Split a ${PN}-template pkg to put ${datadir}/lxc/templates/, and debash in
> ${datadir}/lxc/hooks/*
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
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   recipes-containers/lxc/lxc_1.0.5.bb |   11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/lxc/lxc_1.0.5.bb b/recipes-containers/lxc/lxc_1.0.5.bb
> index bea1ad0..c0603ee 100644
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
> @@ -57,8 +61,11 @@ do_install_append() {
>   	rm -rf ${D}${localstatedir}/cache
>   	install -d ${D}${sysconfdir}/default/volatiles
>   	echo "d root root 0755 ${localstatedir}/cache/lxc none" \
> -	     > ${D}${sysconfdir}/default/volatiles/99_lxc
> +	    > ${D}${sysconfdir}/default/volatiles/99_lxc

This change looks cosmetic. Don't mix whitespace and functional change.

>
> +	# The checkbashisms shows there are no bashism, so use /bin/sh.

This belongs in the commit message as well, with a link to the upstream
site.

Bruce

> +	for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do \
> +	    sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
>   }
>
>   EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
>


