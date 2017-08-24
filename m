Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C979E0090A; Wed, 23 Aug 2017 20:35:15 -0700 (PDT)
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
	*      [209.85.213.65 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.65 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21607E00726
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 20:35:13 -0700 (PDT)
Received: by mail-vk0-f65.google.com with SMTP id t4so572317vkg.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 20:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Um4X1qKl0GqtuBt9Y/Z41eUvCCZ6KEbQ+jJQn4Wzbcg=;
	b=Bczv58KdBb0oopROQxa34CF5cHbpQEiTEHf0fdldubS4RW4KRml5tlwdli0Iwp59iA
	xLfUAtqfaQNv8imZJG2qspzKUk64S9ZTB6tnMM6PlypBtP2y3YXX5flrdTqe5vd/4CVX
	wvJ2ID91o3TZ5/OaGakmqCkp2m4Erfc8uVitvxPPzPI5OOZrAPpDsWhz0tTm+LM4B3Od
	tWYLm3oniKlBe9ePz+PqBnSIhZQVGuvwk7TaqgvH22tlnxDVH+mk2zifaMTGj+L4Bn+f
	BUFozGHvQSpsw7kG4NIZ12Kg0Jqo2PFuToZMtXYF3FSDc5+Q85yAqltpHJQMyCTwWnwB
	zHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Um4X1qKl0GqtuBt9Y/Z41eUvCCZ6KEbQ+jJQn4Wzbcg=;
	b=F1uWiBl/KQm9DTCQpnzVAevbzk4YK3VFXyxhjHqZoLfNuy2xx5dGE0hERdVhdlZCcH
	DmmHOyGe+00PbSxfqNu7sYd2IWS8B/bMoZLVhDtvyKS1x9hKXZHcSwBTXyNUV+NFu+g0
	OWr8dcbn+yXGY7EMgzbSbQEivi7qizBCwuti5fTbq7Ki1rdnd5AyBR5emtfViuqbW9vC
	dH/CZy9ac4kFu80CxsWXwGCfYzB9zdNlbwnvGxMnu0eF6aWSOEF8V0g1Q8LaPBwV2ftz
	jyFVpSpCyUBw6f9KweZzLl7zDbNa5TKn20fTQdGI19K0QLNrvlGKx80srQIW9FJ65nP8
	6Odg==
X-Gm-Message-State: AHYfb5hNfcRkXLAvlEjbTZbeWhDhBvL3mid1mtbaFdtuo4LRZKl6GXad
	uHsSW9ZDP2BEdc1a3Un+ruS4YslUhw==
X-Received: by 10.31.209.71 with SMTP id i68mr2660786vkg.188.1503545712348;
	Wed, 23 Aug 2017 20:35:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Wed, 23 Aug 2017 20:35:11 -0700 (PDT)
In-Reply-To: <1503537222-1882-1-git-send-email-yi.zhao@windriver.com>
References: <1503537222-1882-1-git-send-email-yi.zhao@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Aug 2017 23:35:11 -0400
Message-ID: <CADkTA4NCrLd2Nd5GijNHxMrDSYzQDyAYzEiQYOqoMPQXSoXLXQ@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Mark Asselstine <mark.asselstine@windriver.com>
Subject: Re: [PATCH] docker-distribution: update to 2.6.2
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
X-List-Received-Date: Thu, 24 Aug 2017 03:35:15 -0000
Content-Type: multipart/alternative; boundary="001a114e2482169371055777845d"

--001a114e2482169371055777845d
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 23, 2017 at 9:13 PM, Yi Zhao <yi.zhao@windriver.com> wrote:

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
>  .../{docker-distribution_git.bb => docker-distribution_2.6.2.bb}     | 5
> ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename recipes-containers/docker-distribution/{docker-distribution_git.bb
> => docker-distribution_2.6.2.bb} (90%)
>
> diff --git a/recipes-containers/docker-distribution/docker-
> distribution_git.bb b/recipes-containers/docker-distribution/docker-
> distribution_2.6.2.bb
> similarity index 90%
> rename from recipes-containers/docker-distribution/docker-
> distribution_git.bb
> rename to recipes-containers/docker-distribution/docker-
> distribution_2.6.2.bb
> index 08b6d70..b0a380b 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_2.6.2.bb
> @@ -3,14 +3,13 @@ SUMMARY = "The Docker toolset to pack, ship, store, and
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
>

This stays as a _git recipe. Please re-send it with _git and the PV
restored.

Bruce


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

--001a114e2482169371055777845d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 23, 2017 at 9:13 PM, Yi Zhao <span dir=3D"ltr">&lt;<a href=
=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">CVE-2017-11468 is fi=
xed in this release.<br>
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
=C2=A0.../{<a href=3D"http://docker-distribution_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">docker-distribution_git.<wbr>bb</a> =3D&gt; <a href=3D"h=
ttp://docker-distribution_2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">do=
cker-distribution_2.6.2.bb</a>}=C2=A0 =C2=A0 =C2=A0| 5 ++---<br>
=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br>
=C2=A0rename recipes-containers/docker-<wbr>distribution/{<a href=3D"http:/=
/docker-distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-<w=
br>distribution_git.bb</a> =3D&gt; <a href=3D"http://docker-distribution_2.=
6.2.bb" rel=3D"noreferrer" target=3D"_blank">docker-distribution_2.6.2.bb</=
a>} (90%)<br>
<br>
diff --git a/recipes-containers/docker-<wbr>distribution/<a href=3D"http://=
docker-distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-<wb=
r>distribution_git.bb</a> b/recipes-containers/docker-<wbr>distribution/<a =
href=3D"http://docker-distribution_2.6.2.bb" rel=3D"noreferrer" target=3D"_=
blank">docker-<wbr>distribution_2.6.2.bb</a><br>
similarity index 90%<br>
rename from recipes-containers/docker-<wbr>distribution/<a href=3D"http://d=
ocker-distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-<wbr=
>distribution_git.bb</a><br>
rename to recipes-containers/docker-<wbr>distribution/<a href=3D"http://doc=
ker-distribution_2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">docker-<wbr=
>distribution_2.6.2.bb</a><br>
index 08b6d70..b0a380b 100644<br>
--- a/recipes-containers/docker-<wbr>distribution/<a href=3D"http://docker-=
distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-<wbr>distr=
ibution_git.bb</a><br>
+++ b/recipes-containers/docker-<wbr>distribution/<a href=3D"http://docker-=
distribution_2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">docker-<wbr>dis=
tribution_2.6.2.bb</a><br>
@@ -3,14 +3,13 @@ SUMMARY =3D &quot;The Docker toolset to pack, ship, store=
, and deliver content&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
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
-PV =3D &quot;v2.6.0-rc+git${SRCPV}&quot;<br></blockquote><div><br></div><d=
iv>This stays as a _git recipe. Please re-send it with _git and the PV rest=
ored.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
=C2=A0S =3D &quot;${WORKDIR}/git/src/<a href=3D"http://github.com/docker/di=
stribution" rel=3D"noreferrer" target=3D"_blank">github.<wbr>com/docker/dis=
tribution</a>&quot;<br>
<br>
=C2=A0inherit goarch<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a114e2482169371055777845d--
