Return-Path: <John_Mehaffey@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F314E0086D; Fri, 17 Apr 2015 09:02:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.94.38.131 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37C8BE007A0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Apr 2015 09:02:38 -0700 (PDT)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1Yj8j0-0005up-9P from John_Mehaffey@mentor.com 
	for meta-virtualization@yoctoproject.org;
	Fri, 17 Apr 2015 09:02:38 -0700
Received: from NA-MBX-03.mgc.mentorg.com ([fe80::9a:1569:df57:45b8]) by
	SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) with mapi id
	14.03.0224.002; Fri, 17 Apr 2015 09:02:37 -0700
From: "Mehaffey, John" <John_Mehaffey@mentor.com>
To: "Eremin, Dmitry" <Dmitry_Eremin@mentor.com>
Thread-Topic: [meta-virtualization] [PATCH] conf: override SECURITY_CFLAGS
	for a set of recipes
Thread-Index: AQHQeSfqtTS3I0yRZUWPcmEq8rj2ZA==
Date: Fri, 17 Apr 2015 16:02:34 +0000
Message-ID: <371E240E6FC1D44DA5E51EE9DCDCB784014A8B1E12@NA-MBX-03.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.34.91.1]
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] conf: override SECURITY_CFLAGS for a set of recipes
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
X-List-Received-Date: Fri, 17 Apr 2015 16:02:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> From: meta-virtualization-bounces@yoctoproject.org [meta-virtualization-b=
ounces@yoctoproject.org] on behalf of Eremin, Dmitry=0A=
> Sent: Friday, April 17, 2015 6:41 AM=0A=
> To: meta-virtualization@yoctoproject.org=0A=
> Subject: [meta-virtualization] [PATCH] conf: override SECURITY_CFLAGS for=
 a     set of recipes=0A=
>=0A=
> Some of recipes produce errors if the distro has enabled usage of=0A=
> security_flags.inc file. Fix those errors (and QA warnings) by providing=
=0A=
> an additional include file that is require'd from conf/layer.conf.=0A=
>=0A=
> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>=0A=
> ---=0A=
>  conf/distro/include/virt_security_flags.inc | 5 +++++=0A=
>  conf/layer.conf                             | 3 +++=0A=
>  2 files changed, 8 insertions(+)=0A=
>  create mode 100644 conf/distro/include/virt_security_flags.inc=0A=
>=0A=
> diff --git a/conf/distro/include/virt_security_flags.inc b/conf/distro/in=
clude/virt_security_flags.inc=0A=
> new file mode 100644=0A=
> index 0000000..f4c288b=0A=
> --- /dev/null=0A=
> +++ b/conf/distro/include/virt_security_flags.inc=0A=
> @@ -0,0 +1,5 @@=0A=
> +# Build errors with the pie options enabled=0A=
> +SECURITY_CFLAGS_pn-libvirt =3D "${SECURITY_NO_PIE_CFLAGS}"=0A=
> +=0A=
> +# This has text relco errors with the pie options enabled=0A=
> +SECURITY_CFLAGS_pn-lxc =3D "${SECURITY_NO_PIE_CFLAGS}"=0A=
> diff --git a/conf/layer.conf b/conf/layer.conf=0A=
> index 7ae9d09..f5c1b1e 100644=0A=
> --- a/conf/layer.conf=0A=
> +++ b/conf/layer.conf=0A=
> @@ -16,3 +16,6 @@ LICENSE_PATH +=3D "${LAYERDIR}/files/custom-licenses"=
=0A=
>  LAYERVERSION_virtualization-layer =3D "1"=0A=
>=0A=
>  LAYERDEPENDS_virtualization-layer =3D "core networking-layer"=0A=
> +=0A=
> +# Override security flags=0A=
> +require conf/distro/include/virt_security_flags.inc=0A=
> --=0A=
> 2.1.4=0A=
=0A=
=0A=
Hi Dmitry,=0A=
There is a typo in the comment:=0A=
"# This has text relco errors with the pie options enabled"=0A=
It should be reloc errors.=0A=
=0A=
Sincerely,=0A=
John Mehaffey=0A=
Linux System Architect=0A=
Mentor Graphics=0A=

