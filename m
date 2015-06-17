Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2EDCCE00A65; Wed, 17 Jun 2015 13:10:24 -0700 (PDT)
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
	*      [209.85.212.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7052DE00A51
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Jun 2015 13:10:22 -0700 (PDT)
Received: by wicnd19 with SMTP id nd19so2666246wic.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 Jun 2015 13:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ORckYqUaJavr4jC5MbwhzpaLkFi8j3QModog7WtqOJ4=;
	b=UXPPPN/mLKeyQEMz0lboNSUi/kfBRXE6EjvW8zy1vrbo0SlwTBAhEFMAUseZGQe3ps
	+Y5YbTc/dWyf82eja2N0SoUiRGmh5kiP9na8ItOgIxP/9srFaXQy30zixSErMtADec52
	lQbGPxgRTqKm0Yd8FiGpbd09yultsnahh7hHWOg+vBG3hzzVpFi6kbJDEcMy7Eu6xEZY
	32yyAymUcdK0BW5QPT0M/U+0uda4Y3YgEKwLHEIoQ4SCT+psefPXKjckc30/4FDE5mK/
	PIdXM/ws7UOZT9OU07Ns4EZnxzxYyEcd6e39RqfVj0Clh3QRD31HoPHV31keDytzp4Z4
	hyFQ==
MIME-Version: 1.0
X-Received: by 10.194.82.38 with SMTP id f6mr8545910wjy.16.1434571821592; Wed,
	17 Jun 2015 13:10:21 -0700 (PDT)
Received: by 10.28.129.82 with HTTP; Wed, 17 Jun 2015 13:10:21 -0700 (PDT)
In-Reply-To: <1434551827-7833-1-git-send-email-jason.wessel@windriver.com>
References: <1434551827-7833-1-git-send-email-jason.wessel@windriver.com>
Date: Wed, 17 Jun 2015 16:10:21 -0400
Message-ID: <CADkTA4PjwcyDK5jeW+GRODHFeBqcxv8FHFV=-9dO2sqd-wHAPw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-gevent: Fix cross compile for ARM
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
X-List-Received-Date: Wed, 17 Jun 2015 20:10:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

merged.

Bruce

On Wed, Jun 17, 2015 at 10:37 AM, Jason Wessel
<jason.wessel@windriver.com> wrote:
> The lack of a proper ability to regenerate configure causes the cross
> compile detect logic to fail (shown below).  It is easiest to just
> force the cross compile option at configure time.
>
> | configure: error: in `/opt/buildtmp/work/cortexa7t2hf-vfp-neon-wrs-linu=
x-gnueabi/python-gevent/1.0.1-r0/gevent-1.0.1/build/temp.linux-x86_64-2.7/l=
ibev':
> | configure: error: cannot run C compiled programs.
> | If you meant to cross compile, use `--host'.
> | See `config.log' for more details
> | Running '/bin/sh /opt/buildtmp/work/cortexa7t2hf-vfp-neon-wrs-linux-gnu=
eabi/python-gevent/1.0.1-r0/gevent-1.0.1/libev/configure > configure-output=
.txt' in /opt/buildtmp/work/cortexa7t2hf-vfp-neon-wrs-linux-gnueabi/python-=
gevent/1.0.1-r0/gevent-1.0.1/build/temp.linux-x86_64-2.7/libev
> | building 'gevent.core' extension
> | creating build/temp.linux-x86_64-2.7/gevent
> | ccache arm-wrs-linux-gnueabi-gcc -march=3Darmv7-a -mfloat-abi=3Dhard -m=
fpu=3Dneon -marm -mthumb-interwork -mtune=3Dcortex-a7 --sysroot=3D/opt/buil=
dtmp/sysroots/fsl-ls10xx -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pip=
e -g -fPIC -DLIBEV_EMBED=3D1 -DEV_COMMON=3D -DEV_CLEANUP_ENABLE=3D0 -DEV_EM=
BED_ENABLE=3D0 -DEV_PERIODIC_ENABLE=3D0 -Ibuild/temp.linux-x86_64-2.7/libev=
 -Ilibev -I/opt/buildtmp/sysroots/fsl-ls10xx/usr/include/python2.7 -c geven=
t/gevent.core.c -o build/temp.linux-x86_64-2.7/gevent/gevent.core.o
> | In file included from gevent/libev.h:2:0,
> |                  from gevent/gevent.core.c:313:
> | libev/ev.c:45:22: fatal error: config.h: No such file or directory
> |  #  include "config.h"
> |                       ^
> | compilation terminated.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  recipes-devtools/python/python-gevent_1.0.1.bb |    7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/recipes-devtools/python/python-gevent_1.0.1.bb b/recipes-dev=
tools/python/python-gevent_1.0.1.bb
> index 44f9518..47f1267 100644
> --- a/recipes-devtools/python/python-gevent_1.0.1.bb
> +++ b/recipes-devtools/python/python-gevent_1.0.1.bb
> @@ -24,3 +24,10 @@ inherit setuptools
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>  SRC_URI +=3D "file://libev-conf.patch"
>  SRC_URI +=3D "file://gevent-allow-ssl-v2-or-v3-certificates.patch"
> +
> +# The python-gevent has no autoreconf ability
> +# and the logic for detecting a cross compile is flawed
> +# so always force a cross compile
> +do_configure_append() {
> +       sed -i -e 's/^cross_compiling=3Dno/cross_compiling=3Dyes/' ${S}/l=
ibev/configure
> +}
> \ No newline at end of file
> --
> 1.7.9.5
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

