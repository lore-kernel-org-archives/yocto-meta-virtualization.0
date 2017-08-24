Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5E897E0090A; Thu, 24 Aug 2017 06:56:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.217.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.217.195 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2852E0090A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 06:56:36 -0700 (PDT)
Received: by mail-ua0-f195.google.com with SMTP id c3so1127952uae.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Aug 2017 06:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2piENwc9SzBD9DTDr+tw1PsnxJSI9I3ftyBWXvgrTI0=;
	b=puvWbEktP2LjhizWBGQi+eFdITWZWq8nYSZKm3oYFxmhTRsd6FACbwhyhX25tMGLRn
	iN1RKOlOOKiP7Bxda2IxTh1ce6xA7FTg9SjTd3Qcbe96ndkjkxtaPCmJhxRWiyHJmm49
	mg8hV0HM7iJvpLbrWxBiNTRXw66fnJpIGtOAHAj88ovvXhOdCsCI0LyO3D+ZgwbSSoXe
	n0ETTbwGwtH5yxsP9qYoHGJPNScmRchHgGVOwJpXKbsR7zIzyRjAEBAkV2aDGbLhY684
	/8SzWTEB56sXGEcAQsE0bE34yGheoNR9G29eyvsez+RzHem2L8QuKVTjJqsrYWpXHGpo
	4gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2piENwc9SzBD9DTDr+tw1PsnxJSI9I3ftyBWXvgrTI0=;
	b=YomdB5A5qPriHE2ORseRh8hCqFk4ZQgW3J/cXvAM2MTIuh6ZABPo2l92+eg1qaYonf
	/zb1Dw+xx1c8jGYfTTmezky4vhZ810OjNuamNP4irt7swFD+ydjN87wMyaE8HCh9xDVH
	W46gs10vcjTSjOgdkJoTVa8djorlDuP8omJzf4qdpkGU6OrLMyMPKviiyBf8Bu2pe/Dn
	QLS2zYT9gw3TD00QB9Z7iV00GBGYQJ5f/5JAQigmtZXBdduam0VQSeI5+1QpXWpveRZj
	DIRaIJ0tYzTJSDdtubsKn7CnTHwY/SuiXGw0DHTyV9QfIQqCy8aSWdWA7OX7hKZISAnr
	jfJA==
X-Gm-Message-State: AHYfb5iFPbgJnRAtvIalLhMS9m3W33jP9FjZiM8LSHU1z6lk8JADQ9Ui
	1Jhqm78WxCZ3yqESuvJ0S8IoX69m7g==
X-Received: by 10.176.74.193 with SMTP id t1mr3851232uae.41.1503582995772;
	Thu, 24 Aug 2017 06:56:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Thu, 24 Aug 2017 06:56:35 -0700 (PDT)
In-Reply-To: <1503556778-7536-1-git-send-email-yi.zhao@windriver.com>
References: <1503556778-7536-1-git-send-email-yi.zhao@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 Aug 2017 09:56:35 -0400
Message-ID: <CADkTA4OVV2n6epc9YH2pN-iXn_zKYZBW0B_nCgzgq+YUJ3Bfqw@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Mark Asselstine <mark.asselstine@windriver.com>
Subject: Re: [PATCH V2] docker-distribution: update to 2.6.2
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
X-List-Received-Date: Thu, 24 Aug 2017 13:56:37 -0000
Content-Type: multipart/alternative; boundary="f403045f90565a7c76055780324e"

--f403045f90565a7c76055780324e
Content-Type: text/plain; charset="UTF-8"

v2 is merged.

Bruce

On Thu, Aug 24, 2017 at 2:39 AM, Yi Zhao <yi.zhao@windriver.com> wrote:

> CVE-2017-11468 is fixed in this release.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2017-11468
>
> Release note:
> https://github.com/docker/distribution/releases/tag/v2.6.2
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  recipes-containers/docker-distribution/docker-distribution_git.bb | 6
> +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/docker-distribution/docker-
> distribution_git.bb b/recipes-containers/docker-distribution/docker-
> distribution_git.bb
> index 08b6d70..e2eac2e 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -3,14 +3,14 @@ SUMMARY = "The Docker toolset to pack, ship, store, and
> deliver content"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
>
> -SRCREV_distribution="0810eba2adf048b77621472991211924d9ec31c5"
> -SRC_URI = "git://github.com/docker/distribution.git;branch=
> master;name=distribution;destsuffix=git/src/github.com/docker/distribution
> \
> +SRCREV_distribution="48294d928ced5dd9b378f7fd7c6f5da3ff3f2c89"
> +SRC_URI = "git://github.com/docker/distribution.git;branch=
> release/2.6;name=distribution;destsuffix=git/src/github.com/
> docker/distribution \
>             file://docker-registry.service \
>            "
>
>  PACKAGES =+ "docker-registry"
>
> -PV = "v2.6.0-rc+git${SRCPV}"
> +PV = "v2.6.2"
>  S = "${WORKDIR}/git/src/github.com/docker/distribution"
>
>  inherit goarch
> --
> 2.7.4
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f403045f90565a7c76055780324e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">v2 is merged.<div><br></div><div>Bruce</div></div><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Aug 24, 2017 at 2=
:39 AM, Yi Zhao <span dir=3D"ltr">&lt;<a href=3D"mailto:yi.zhao@windriver.c=
om" target=3D"_blank">yi.zhao@windriver.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><span class=3D"">CVE-2017-11468 is fixed in this r=
elease.<br>
<br>
Reference:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2017-11468" rel=3D"noreferr=
er" target=3D"_blank">https://nvd.nist.gov/vuln/<wbr>detail/CVE-2017-11468<=
/a><br>
<br>
Release note:<br>
<a href=3D"https://github.com/docker/distribution/releases/tag/v2.6.2" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/docker/<wbr>distributi=
on/releases/tag/v2.<wbr>6.2</a><br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com">yi.zhao=
@windriver.com</a>&gt;<br>
---<br>
</span>=C2=A0recipes-containers/docker-<wbr>distribution/<a href=3D"http://=
docker-distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-<wb=
r>distribution_git.bb</a> | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-containers/docker-<wbr>distribution/<a href=3D"http://=
docker-distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-<wb=
r>distribution_git.bb</a> b/recipes-containers/docker-<wbr>distribution/<a =
href=3D"http://docker-distribution_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">docker-<wbr>distribution_git.bb</a><br>
index 08b6d70..e2eac2e 100644<br>
--- a/recipes-containers/docker-<wbr>distribution/<a href=3D"http://docker-=
distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-<wbr>distr=
ibution_git.bb</a><br>
+++ b/recipes-containers/docker-<wbr>distribution/<a href=3D"http://docker-=
distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-<wbr>distr=
ibution_git.bb</a><br>
@@ -3,14 +3,14 @@ SUMMARY =3D &quot;The Docker toolset to pack, ship, store=
, and deliver content&quot;<br>
<span class=3D"">=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>d2794c0df5b907fd=
ace235a619d803<wbr>14&quot;<br>
<br>
-SRCREV_distribution=3D&quot;<wbr>0810eba2adf048b776214729912119<wbr>24d9ec=
31c5&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/docker/distribution.g=
it;branch=3Dmaster;name=3Ddistribution;destsuffix=3Dgit/src/github.com/dock=
er/distribution" rel=3D"noreferrer" target=3D"_blank">github.com/docker/<wb=
r>distribution.git;branch=3D<wbr>master;name=3Ddistribution;<wbr>destsuffix=
=3Dgit/src/github.com/<wbr>docker/distribution</a> \<br>
+SRCREV_distribution=3D&quot;<wbr>48294d928ced5dd9b378f7fd7c6f5d<wbr>a3ff3f=
2c89&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/docker/distribution.g=
it;branch=3Drelease/2.6;name=3Ddistribution;destsuffix=3Dgit/src/github.com=
/docker/distribution" rel=3D"noreferrer" target=3D"_blank">github.com/docke=
r/<wbr>distribution.git;branch=3D<wbr>release/2.6;name=3Ddistribution;<wbr>=
destsuffix=3Dgit/src/github.com/<wbr>docker/distribution</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker-registry.service \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0PACKAGES =3D+ &quot;docker-registry&quot;<br>
<br>
-PV =3D &quot;v2.6.0-rc+git${SRCPV}&quot;<br>
</span>+PV =3D &quot;v2.6.2&quot;<br>
<div class=3D"HOEnZb"><div class=3D"h5">=C2=A0S =3D &quot;${WORKDIR}/git/sr=
c/<a href=3D"http://github.com/docker/distribution" rel=3D"noreferrer" targ=
et=3D"_blank">github.<wbr>com/docker/distribution</a>&quot;<br>
<br>
=C2=A0inherit goarch<br>
--<br>
2.7.4<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div>

--f403045f90565a7c76055780324e--
