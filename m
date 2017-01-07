Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A1198E00890; Fri,  6 Jan 2017 19:12:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_10_20, 
	RCVD_IN_DNSWL_LOW,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.1 HTML_OBFUSCATE_10_20 BODY: Message is 10% to 20% HTML obfuscation
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.178 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F3B3E00828
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Jan 2017 19:12:37 -0800 (PST)
Received: by mail-qt0-f178.google.com with SMTP id x49so29216562qtc.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Jan 2017 19:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n2Gns4OZczkDDyfjLMZbwIuBOaMB708tObTKzju9KqI=;
	b=BxGbZAt6ai7CenXQcBdjFumpm8DrnSX1JtlXngbc1Dnetg8M/Gd9mTqf6GCLASC6j3
	TMbvhDvp+rs9TRjpuV+ZNb3dMXSitBqGDGTknUY8Ddp+pX7ETJ4AylK8vNmN98CXFpa8
	AUBzGzhMFIdAMU/ZjNM1QwZNk1gOAUK6jZfaZ6e/SO4FWrRFYZH+W5bYKfkqx5hbhP2r
	zsrMSyDXPcyRfqjJ+w+jIk2htvBF4hwUIusYOtN6yvF+E1yy9KnQbiMuPMQi7Z6q5rbI
	RhilNezf6zK10tL5UxKyT1EzEVzv7GgiL2ZF1OKCt39diFrqq7uPaiA8xhBo9hOQQj4F
	P9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n2Gns4OZczkDDyfjLMZbwIuBOaMB708tObTKzju9KqI=;
	b=WRbZ9KLO4/W+lSDGStpA7dnfFuHSqHH2kFfRHNSWZDHFenIBrlSLDxhThgim3llgyz
	B3eeFa82Nehvg3VP2T8fVXDA4bADtZb7VgfPUm+mkNAABEKN1lioTyNamf2xLfSFywa9
	Qzzy2OzBV9jjzR3jP6fB18bgHwzd8OI3sCsc/hTUJ72hJo1aKXJA2EPgvkzRWl2WH4ru
	djSEvdeK5/i8Wc8aJsr6BeJhsllxXztbQoU1TgPXDkkBNDXr1oxMbzX4aB+N19MWdXk5
	03AERGukM46ovkRxfY1+Q5dDrazNGXeClRk3FqJ9YG2dzq8hxfbU+g0XHRvxCqh0OQ0b
	EPgA==
X-Gm-Message-State: AIkVDXJrlISHPPLH6MX1Hqxs4sJtYsG98ePREvqLKB36qv2ijUrbynvO20ZmcI+hwUxD5qCnxjGQ0LDHDqPO6Q==
X-Received: by 10.200.43.212 with SMTP id n20mr3173746qtn.117.1483758757009;
	Fri, 06 Jan 2017 19:12:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Fri, 6 Jan 2017 19:12:36 -0800 (PST)
In-Reply-To: <1483721458-14568-1-git-send-email-mark.asselstine@windriver.com>
References: <1483721458-14568-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Jan 2017 22:12:36 -0500
Message-ID: <CADkTA4MRVMDDnQqLvaMJ-YreGyqWpTSJXG4xRoef4ed9KxEuqQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [mcs][PATCH] housekeeping: update Poky LICENSE checksum
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
X-List-Received-Date: Sat, 07 Jan 2017 03:12:41 -0000
Content-Type: multipart/alternative; boundary=001a1135b98ea52f2b0545788161

--001a1135b98ea52f2b0545788161
Content-Type: text/plain; charset=UTF-8

all three patches are merged.

Bruce

On Fri, Jan 6, 2017 at 11:50 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> The Poky LICENSE file was updated at the beginning of 2014 and we have
> yet to update the md5 to reflect this.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../recipes-extended/packagegroups/packagegroup-cloud-benchmarking.bb
>  | 2 +-
>  .../recipes-extended/packagegroups/packagegroup-cloud-compute.bb
> | 2 +-
>  .../recipes-extended/packagegroups/packagegroup-cloud-controller.bb
>  | 2 +-
>  .../recipes-extended/packagegroups/packagegroup-cloud-debug.bb
> | 2 +-
>  .../recipes-extended/packagegroups/packagegroup-cloud-extras.bb
>  | 2 +-
>  .../recipes-extended/packagegroups/packagegroup-cloud-network.bb
> | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-benchmarking.bb b/meta-openstack/recipes-
> extended/packagegroups/packagegroup-cloud-benchmarking.bb
> index 46f18fb..6310b8f 100644
> --- a/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-benchmarking.bb
> +++ b/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-benchmarking.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Add benchmarking capabilities to cloud images"
>  PR = "r0"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=
> 3f40d7994397109285ec7b81fdeb3b58 \
> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=
> 4d92cd373abda3937c2bc47fbc49d690 \
>                      file://${COREBASE}/meta/COPYING.MIT;md5=
> 3da9cfbcb788c80a0384361b4de20420"
>
>  inherit packagegroup
> diff --git a/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-compute.bb b/meta-openstack/recipes-extended/packagegroups/
> packagegroup-cloud-compute.bb
> index 7563792..21f8f10 100644
> --- a/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-compute.bb
> +++ b/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-compute.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Configuration for OpenStack Compute node"
>  PR = "r0"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=
> 3f40d7994397109285ec7b81fdeb3b58 \
> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=
> 4d92cd373abda3937c2bc47fbc49d690 \
>                      file://${COREBASE}/meta/COPYING.MIT;md5=
> 3da9cfbcb788c80a0384361b4de20420"
>
>  inherit packagegroup
> diff --git a/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-controller.bb b/meta-openstack/recipes-extended/packagegroups/
> packagegroup-cloud-controller.bb
> index 653a493..f172839 100644
> --- a/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-controller.bb
> +++ b/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-controller.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Configuration for OpenStack Controller node"
>  PR = "r0"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=
> 3f40d7994397109285ec7b81fdeb3b58 \
> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=
> 4d92cd373abda3937c2bc47fbc49d690 \
>                      file://${COREBASE}/meta/COPYING.MIT;md5=
> 3da9cfbcb788c80a0384361b4de20420"
>
>  inherit packagegroup
> diff --git a/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-debug.bb b/meta-openstack/recipes-extended/packagegroups/
> packagegroup-cloud-debug.bb
> index eb3cb50..e5517d2 100644
> --- a/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-debug.bb
> +++ b/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-debug.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Add debugging capabilities to cloud images"
>  PR = "r0"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=
> 3f40d7994397109285ec7b81fdeb3b58 \
> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=
> 4d92cd373abda3937c2bc47fbc49d690 \
>                      file://${COREBASE}/meta/COPYING.MIT;md5=
> 3da9cfbcb788c80a0384361b4de20420"
>
>  inherit packagegroup
> diff --git a/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-extras.bb b/meta-openstack/recipes-extended/packagegroups/
> packagegroup-cloud-extras.bb
> index 2fcad8b..6fb6045 100644
> --- a/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-extras.bb
> +++ b/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-extras.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Extra packages that improve the usability of compute/control
> nodes"
>  PR = "r0"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=
> 3f40d7994397109285ec7b81fdeb3b58 \
> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=
> 4d92cd373abda3937c2bc47fbc49d690 \
>                      file://${COREBASE}/meta/COPYING.MIT;md5=
> 3da9cfbcb788c80a0384361b4de20420"
>
>  inherit packagegroup
> diff --git a/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-network.bb b/meta-openstack/recipes-extended/packagegroups/
> packagegroup-cloud-network.bb
> index 6134124..f5b07a2 100644
> --- a/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-network.bb
> +++ b/meta-openstack/recipes-extended/packagegroups/package
> group-cloud-network.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Configuration for OpenStack Network node"
>  PR = "r0"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=
> 3f40d7994397109285ec7b81fdeb3b58 \
> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=
> 4d92cd373abda3937c2bc47fbc49d690 \
>                      file://${COREBASE}/meta/COPYING.MIT;md5=
> 3da9cfbcb788c80a0384361b4de20420"
>
>  inherit packagegroup
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1135b98ea52f2b0545788161
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">all three patches are merged.<div><br></div><div>Bruce</di=
v></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, J=
an 6, 2017 at 11:50 AM, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:mark.asselstine@windriver.com" target=3D"_blank">mark.asselstine@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The Poky=
 LICENSE file was updated at the beginning of 2014 and we have<br>
yet to update the md5 to reflect this.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0.../recipes-extended/<wbr>packagegroups/<a href=3D"http://packagegrou=
p-cloud-benchmarking.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-=
<wbr>cloud-benchmarking.bb</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../recipes-extended/<wbr>packagegroups/<a href=3D"http://packagegrou=
p-cloud-compute.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr>=
cloud-compute.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../recipes-extended/<wbr>packagegroups/<a href=3D"http://packagegrou=
p-cloud-controller.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<w=
br>cloud-controller.bb</a>=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../recipes-extended/<wbr>packagegroups/<a href=3D"http://packagegrou=
p-cloud-debug.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr>cl=
oud-debug.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../recipes-extended/<wbr>packagegroups/<a href=3D"http://packagegrou=
p-cloud-extras.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr>c=
loud-extras.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../recipes-extended/<wbr>packagegroups/<a href=3D"http://packagegrou=
p-cloud-network.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-<wbr>=
cloud-network.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A06 files changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"=
http://packagegroup-cloud-benchmarking.bb" rel=3D"noreferrer" target=3D"_bl=
ank">package<wbr>group-cloud-benchmarking.bb</a> b/meta-openstack/recipes-<=
wbr>extended/packagegroups/<a href=3D"http://packagegroup-cloud-benchmarkin=
g.bb" rel=3D"noreferrer" target=3D"_blank">package<wbr>group-cloud-benchmar=
king.bb</a><br>
index 46f18fb..6310b8f 100644<br>
--- a/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"http://=
packagegroup-cloud-benchmarking.bb" rel=3D"noreferrer" target=3D"_blank">pa=
ckage<wbr>group-cloud-benchmarking.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"http://=
packagegroup-cloud-benchmarking.bb" rel=3D"noreferrer" target=3D"_blank">pa=
ckage<wbr>group-cloud-benchmarking.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0SUMMARY =3D &quot;Add benchmarking capabilities to cloud images&quot;=
<br>
=C2=A0PR =3D &quot;r0&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;<wbr>md5=3D<wbr>3f40=
d7994397109285ec7b81fdeb3b<wbr>58 \<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;<wbr>md5=3D<wbr>4d92=
cd373abda3937c2bc47fbc49d6<wbr>90 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://${COREBASE}/meta/<wbr>COPYING.MIT;md5=3D<wbr>3da9cfbcb788c80a0384=
361b4de204<wbr>20&quot;<br>
<br>
=C2=A0inherit packagegroup<br>
diff --git a/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"=
http://packagegroup-cloud-compute.bb" rel=3D"noreferrer" target=3D"_blank">=
package<wbr>group-cloud-compute.bb</a> b/meta-openstack/recipes-<wbr>extend=
ed/packagegroups/<a href=3D"http://packagegroup-cloud-compute.bb" rel=3D"no=
referrer" target=3D"_blank">package<wbr>group-cloud-compute.bb</a><br>
index 7563792..21f8f10 100644<br>
--- a/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"http://=
packagegroup-cloud-compute.bb" rel=3D"noreferrer" target=3D"_blank">package=
<wbr>group-cloud-compute.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"http://=
packagegroup-cloud-compute.bb" rel=3D"noreferrer" target=3D"_blank">package=
<wbr>group-cloud-compute.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0SUMMARY =3D &quot;Configuration for OpenStack Compute node&quot;<br>
=C2=A0PR =3D &quot;r0&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;<wbr>md5=3D<wbr>3f40=
d7994397109285ec7b81fdeb3b<wbr>58 \<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;<wbr>md5=3D<wbr>4d92=
cd373abda3937c2bc47fbc49d6<wbr>90 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://${COREBASE}/meta/<wbr>COPYING.MIT;md5=3D<wbr>3da9cfbcb788c80a0384=
361b4de204<wbr>20&quot;<br>
<br>
=C2=A0inherit packagegroup<br>
diff --git a/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"=
http://packagegroup-cloud-controller.bb" rel=3D"noreferrer" target=3D"_blan=
k">package<wbr>group-cloud-controller.bb</a> b/meta-openstack/recipes-<wbr>=
extended/packagegroups/<a href=3D"http://packagegroup-cloud-controller.bb" =
rel=3D"noreferrer" target=3D"_blank">package<wbr>group-cloud-controller.bb<=
/a><br>
index 653a493..f172839 100644<br>
--- a/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"http://=
packagegroup-cloud-controller.bb" rel=3D"noreferrer" target=3D"_blank">pack=
age<wbr>group-cloud-controller.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"http://=
packagegroup-cloud-controller.bb" rel=3D"noreferrer" target=3D"_blank">pack=
age<wbr>group-cloud-controller.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0SUMMARY =3D &quot;Configuration for OpenStack Controller node&quot;<b=
r>
=C2=A0PR =3D &quot;r0&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;<wbr>md5=3D<wbr>3f40=
d7994397109285ec7b81fdeb3b<wbr>58 \<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;<wbr>md5=3D<wbr>4d92=
cd373abda3937c2bc47fbc49d6<wbr>90 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://${COREBASE}/meta/<wbr>COPYING.MIT;md5=3D<wbr>3da9cfbcb788c80a0384=
361b4de204<wbr>20&quot;<br>
<br>
=C2=A0inherit packagegroup<br>
diff --git a/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"=
http://packagegroup-cloud-debug.bb" rel=3D"noreferrer" target=3D"_blank">pa=
ckage<wbr>group-cloud-debug.bb</a> b/meta-openstack/recipes-<wbr>extended/p=
ackagegroups/<a href=3D"http://packagegroup-cloud-debug.bb" rel=3D"noreferr=
er" target=3D"_blank">package<wbr>group-cloud-debug.bb</a><br>
index eb3cb50..e5517d2 100644<br>
--- a/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"http://=
packagegroup-cloud-debug.bb" rel=3D"noreferrer" target=3D"_blank">package<w=
br>group-cloud-debug.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"http://=
packagegroup-cloud-debug.bb" rel=3D"noreferrer" target=3D"_blank">package<w=
br>group-cloud-debug.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0SUMMARY =3D &quot;Add debugging capabilities to cloud images&quot;<br=
>
=C2=A0PR =3D &quot;r0&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;<wbr>md5=3D<wbr>3f40=
d7994397109285ec7b81fdeb3b<wbr>58 \<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;<wbr>md5=3D<wbr>4d92=
cd373abda3937c2bc47fbc49d6<wbr>90 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://${COREBASE}/meta/<wbr>COPYING.MIT;md5=3D<wbr>3da9cfbcb788c80a0384=
361b4de204<wbr>20&quot;<br>
<br>
=C2=A0inherit packagegroup<br>
diff --git a/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"=
http://packagegroup-cloud-extras.bb" rel=3D"noreferrer" target=3D"_blank">p=
ackage<wbr>group-cloud-extras.bb</a> b/meta-openstack/recipes-<wbr>extended=
/packagegroups/<a href=3D"http://packagegroup-cloud-extras.bb" rel=3D"noref=
errer" target=3D"_blank">package<wbr>group-cloud-extras.bb</a><br>
index 2fcad8b..6fb6045 100644<br>
--- a/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"http://=
packagegroup-cloud-extras.bb" rel=3D"noreferrer" target=3D"_blank">package<=
wbr>group-cloud-extras.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"http://=
packagegroup-cloud-extras.bb" rel=3D"noreferrer" target=3D"_blank">package<=
wbr>group-cloud-extras.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0SUMMARY =3D &quot;Extra packages that improve the usability of comput=
e/control nodes&quot;<br>
=C2=A0PR =3D &quot;r0&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;<wbr>md5=3D<wbr>3f40=
d7994397109285ec7b81fdeb3b<wbr>58 \<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;<wbr>md5=3D<wbr>4d92=
cd373abda3937c2bc47fbc49d6<wbr>90 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://${COREBASE}/meta/<wbr>COPYING.MIT;md5=3D<wbr>3da9cfbcb788c80a0384=
361b4de204<wbr>20&quot;<br>
<br>
=C2=A0inherit packagegroup<br>
diff --git a/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"=
http://packagegroup-cloud-network.bb" rel=3D"noreferrer" target=3D"_blank">=
package<wbr>group-cloud-network.bb</a> b/meta-openstack/recipes-<wbr>extend=
ed/packagegroups/<a href=3D"http://packagegroup-cloud-network.bb" rel=3D"no=
referrer" target=3D"_blank">package<wbr>group-cloud-network.bb</a><br>
index 6134124..f5b07a2 100644<br>
--- a/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"http://=
packagegroup-cloud-network.bb" rel=3D"noreferrer" target=3D"_blank">package=
<wbr>group-cloud-network.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>extended/packagegroups/<a href=3D"http://=
packagegroup-cloud-network.bb" rel=3D"noreferrer" target=3D"_blank">package=
<wbr>group-cloud-network.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0SUMMARY =3D &quot;Configuration for OpenStack Network node&quot;<br>
=C2=A0PR =3D &quot;r0&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;<wbr>md5=3D<wbr>3f40=
d7994397109285ec7b81fdeb3b<wbr>58 \<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;<wbr>md5=3D<wbr>4d92=
cd373abda3937c2bc47fbc49d6<wbr>90 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://${COREBASE}/meta/<wbr>COPYING.MIT;md5=3D<wbr>3da9cfbcb788c80a0384=
361b4de204<wbr>20&quot;<br>
<br>
=C2=A0inherit packagegroup<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a1135b98ea52f2b0545788161--
