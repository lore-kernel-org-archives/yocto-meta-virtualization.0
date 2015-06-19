Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A07BE009C6; Fri, 19 Jun 2015 12:25:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2EFBBE00992
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Jun 2015 12:25:54 -0700 (PDT)
Received: by yhpn97 with SMTP id n97so84204308yhp.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Jun 2015 12:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6WgKGFcTKyiqGNKN7/7ZMtrGZj9nGslwOKOwyOeOZvI=;
	b=MDTmkVbKWBptu9BiMVQ718T/E4sAZDtJCf4L9wg+5VmoRNh2BhY7OXLKiO29fuThWv
	M2PR2BEYL7KUl9M8JWPp2qMnh8o6NOV/yvrTmWkCOWGjbpKvA7vgeEHK14VCNy7Ycm/B
	bfIhYGT1p2csyakTXmFrHoXxf2Ko5kgabA4dbcqNx6epof7DfcWUh4OSVKX0i0sgIBfg
	T95ScyKAX/R+ygSXfLTSvwFGF4QK29mV/NzC6jOmlKt/ZQHnZumdB6u7M/cJ0vRRxEwr
	9ANV28Az8VkxNGDvWBZRR6suVlbNAWTxLGYxJK2GjWhVo4Ja+AX3XjnWBQABMfQLWNmD
	TN0Q==
MIME-Version: 1.0
X-Received: by 10.170.186.73 with SMTP id c70mr19020961yke.54.1434741953958;
	Fri, 19 Jun 2015 12:25:53 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Fri, 19 Jun 2015 12:25:53 -0700 (PDT)
In-Reply-To: <1434607853-2097-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1434607853-2097-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Fri, 19 Jun 2015 15:25:53 -0400
Message-ID: <CADkTA4P13E=4VJKm6vjw1wO65F5oVUtY-vd6jtAfhRDFrDH0Vw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] open-iscsi-user: fix warnings and errors.
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
X-List-Received-Date: Fri, 19 Jun 2015 19:25:58 -0000
Content-Type: text/plain; charset=UTF-8

merged to branches master and fido-kilo.

Bruce

On Thu, Jun 18, 2015 at 2:10 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> WARNING: QA Issue: /usr/sbin/iscsi@underscore@discovery_open-iscsi-user contained
> in package open-iscsi-user requires /bin/bash,
> but no providers found in its RDEPENDS [file-rdeps]
>
> ERROR: Function failed: SYSTEMD_SERVICE_open-iscsi-user-systemd value
> iscsi-initiator.service does not exist
>
> Also,modify the LICENSE from GPL to GPLv2.
>
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  .../recipes-connectivity/open-iscsi/open-iscsi-user_2.0-871.bb   | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-871.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-871.bb
> index 593d791..5b3a257 100644
> --- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-871.bb
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.0-871.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Open-iSCSI project is a high performance, transport independent, multi-platform implementation of RFC3720."
>  HOMEPAGE = "http://www.open-iscsi.org/"
> -LICENSE = "GPL"
> +LICENSE = "GPLv2"
>  PR = "r1"
>
>  inherit systemd
> @@ -38,15 +38,18 @@ SRC_URI_append = "  file://iscsi-initiator                                   \
>                      file://iscsi-initiator.service                           \
>                      file://iscsi-initiator-targets.service                   \
>                   "
> +RDEPENDS_${PN} += "bash"
>  RDEPENDS_${PN}-systemd += "${PN}"
>  FILES_${PN}-systemd +=  "   ${base_libdir}/systemd                  \
>                              ${sysconfdir}/default/iscsi-initiator   \
>                          "
>  SYSTEMD_PACKAGES = "${PN}-systemd"
> -SYSTEMD_SERVICE = " iscsi-initiator.service iscsi-initiator-targets.service "
> -
> +SYSTEMD_SERVICE_${PN}-systemd = "iscsi-initiator.service iscsi-initiator-targets.service"
>
>  do_install_append () {
>          install -d ${D}${sysconfdir}/default/
>          install -m 0644 ${WORKDIR}/iscsi-initiator ${D}${sysconfdir}/default/
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/iscsi-initiator.service ${D}${systemd_unitdir}/system/
> +        install -m 0644 ${WORKDIR}/iscsi-initiator-targets.service ${D}${systemd_unitdir}/system/
>  }
> --
> 1.8.4.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

