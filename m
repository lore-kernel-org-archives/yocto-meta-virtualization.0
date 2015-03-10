Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB033E003A8; Tue, 10 Mar 2015 10:08:50 -0700 (PDT)
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
	*      [209.85.217.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56FDBE003A8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Mar 2015 10:08:44 -0700 (PDT)
Received: by lbdu10 with SMTP id u10so3245535lbd.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Mar 2015 10:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=J+KzUFn1sW932L8cbRzlbAKCTmG5UbrrpX07xkPdrEs=;
	b=L4d4lNx9AEoegZHRW/a0zOFbekYmMX5FL15QBzFHvhRIJ6+HNKYQM2GXivv9Ry9Tvp
	PPi1flpPEhwz8TKw1xn7hge+XVC/eNBnBjm6mUMXf9ldLuSihrRI4cucjBv7Yn0hZDR+
	Ce6YCoC2V1obv8v6c2mh5XBEOSOYWbUQRSxnCorYUUdU97nh8BXCPoKElZ2YTz1b9Bct
	Ds1kwT2tGP4d6anQY5yidHrqWuGHa4AI7Us52evaeCDUgmBX7QLi51zrxwJO7iuQFSr1
	85zi4gGprlphsHqJg6Whou0LSerAYPFGJzHyaQHqXhbV2thSgCuxL8//PyZ7VBoRcf6/
	55zw==
MIME-Version: 1.0
X-Received: by 10.152.28.5 with SMTP id x5mr30795254lag.112.1426007322119;
	Tue, 10 Mar 2015 10:08:42 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Tue, 10 Mar 2015 10:08:42 -0700 (PDT)
In-Reply-To: <1425989489-458-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1425989489-458-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Tue, 10 Mar 2015 13:08:42 -0400
Message-ID: <CADkTA4PhnTZQ5FQqvmc7Y8J9BT+tHqpbg4JUTrgKyjS4q0KV-Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/3] lxc: Add PACKAGECONFIG for seccomp
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
X-List-Received-Date: Tue, 10 Mar 2015 17:08:50 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 10, 2015 at 8:11 AM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> Determine whether libseccomp is installed in the Yocto image, and based on that,
> compile the necessary support for LXC as well.
>
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> ---
>  recipes-containers/lxc/lxc_1.0.7.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc/lxc_1.0.7.bb
> index c618c84..4110ac5 100644
> --- a/recipes-containers/lxc/lxc_1.0.7.bb
> +++ b/recipes-containers/lxc/lxc_1.0.7.bb
> @@ -43,12 +43,14 @@ EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
>
>  PACKAGECONFIG ??= "templates \
>      ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> +    ${@base_contains('IMAGE_INSTALL', 'libseccomp', 'seccomp', '', d)} \

This doesn't seem correct, or at least not in the spirit of other
package config options
and tests that I've used (and seen). But if you know of a reference
that looks like this,
point me in its direction and I'll have a look.

Testing on distro features is one thing, as would be image features ..
but IMAGE_INSTALL
is not the same, and isn't always used.

Part of the package config is to trigger both depends and rdepends on
other packages
when it is enabled. In this case, we are doing the opposite, using the
dependency to
trigger the package config.

Either this test needs to be patched into the lxc configuration phase,
so it can detect
it at runtime, or just leave it at a package config option. Your
layers can then enable
that packageconfig and everything works as expected, and we don't
force all users
to enable this in lxc when they may not want it simply because
libseccomp is present.

Bruce

>  "
>  PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
>  PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
>  PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
>  PACKAGECONFIG[templates] = ",,, ${PN}-templates"
>  PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
> +PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
>
>  inherit autotools pkgconfig ptest update-rc.d systemd
>
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

