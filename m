Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2261E00DA5; Tue, 13 Aug 2019 05:30:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.174 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C7DFE00D98
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 05:30:21 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id u15so6402877ljl.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 05:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uViJAi9ERt/BC7o+hqMwy+KX/u0GNxEdQpLUzVF29Mk=;
	b=Ca+W6lvCEp+1wjDShtc9eNmGuO3rwUkD2Y2zmA3dFsxu8eSzQk9cvjOD9b1QPsJLSA
	Ggz41sDdAUTjlilCXRvGePhZFCDUCk7+q1v+qpHUugNb/AK6nFrF2pcWJ4Scj8rTZdim
	p+FdsssluERKC5iAdFYE4x3gX/HUCoGGb+/AQqLmayjSXSVzA8XsoVhnQdMBa1SzSlKy
	ntJJGhg+31qjqv5MgIYLcXzHIxqpFZ2vy+xHfVB+O+T6kay/QSCwlZ6IZvQzGzyvMdzQ
	bQo2VYvwhMdJnEfXxxMn+qXf9/rM7QoBTnie1o/Sg3++EPIJG6XGVOqsleZ87HCYBcPL
	lwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uViJAi9ERt/BC7o+hqMwy+KX/u0GNxEdQpLUzVF29Mk=;
	b=UAl9YFvGg7Ah57jZpES/Hju1ghn1DxfyHjftdBiz0Slgiol38N8W3/nXB++JYO1aiS
	r/tlWNwbuPPXnJaVgVk38vX5/YBHhG7+h0AGDQNobeVPE9t9UfjlqEskviWlPqCdx9Cb
	oxUO7czMLhxPZjd4woap6w4Op3Tl0wMriWZbyChH0v3b7WAwzNMFmP6J3Lw2VNMgzRmV
	Bg3GrELuCDAMS4f4VHjJpoZFan5buv/YZrc9ak8VsKKr13cXsl98PmOU96vOSk1epXD1
	nsdkKcIcSRAPVTprpBtQGEV9FHH8RcPjrYMWcvG3+qSS6OCbw0wgVl1JBxEEKahWt4NN
	KjDQ==
X-Gm-Message-State: APjAAAXPPdAXmbjDUdQYX1ICGuYAu+hkVBzX//gwXvexnjJvgLdBMIuC
	9MxRl7zDf64aJKmxcfqLXCZoWtmhe9e3wH0MRmI=
X-Google-Smtp-Source: APXvYqyDGqGKIuREN7tGoiDCj+PcS1Bl+q8tctOenME2uuDag7KFLecTTQwgbvya2ITOt7GLK7kskGFWNiKKG9IkGbo=
X-Received: by 2002:a2e:93c5:: with SMTP id p5mr21281440ljh.79.1565699420004; 
	Tue, 13 Aug 2019 05:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190813075136.6248-1-Qi.Chen@windriver.com>
	<20190813075136.6248-3-Qi.Chen@windriver.com>
In-Reply-To: <20190813075136.6248-3-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 13 Aug 2019 08:30:08 -0400
Message-ID: <CADkTA4M74K_xPSiCnJYFdqSsEkGD0mXXL-BaF4mAs6Y7cieUGw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 3/4] cni: upgrade git version to latest master
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
X-List-Received-Date: Tue, 13 Aug 2019 12:30:22 -0000
Content-Type: multipart/alternative; boundary="000000000000c12736058ffecd3a"

--000000000000c12736058ffecd3a
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 13, 2019 at 3:51 AM Chen Qi <Qi.Chen@windriver.com> wrote:

> Upgrade the git version to latest master to make the recipe
> truly serve its purpose.
>

That's  not a good reason to do the uprev, this is a git recipe because it
makes sense for it to be git .. not because it is tracking the tip of
master all the time.

What *actual* functionality are we getting from this ? How was it tested ?

Bruce



>
> This upgrades both cni and plugins repos.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-networking/cni/cni_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/
> cni_git.bb
> index 06b37a4..60c39f1 100644
> --- a/recipes-networking/cni/cni_git.bb
> +++ b/recipes-networking/cni/cni_git.bb
> @@ -1,10 +1,10 @@
>  # This cni version is supposed to track latest upstream.
>  require cni.inc
>
> -SRCREV_cni = "dc71cd2ba60c452c56a0a259f2a23d2afe42b688"
> -SRCREV_plugins = "0eddc554c0747200b7b112ce5322dcfa525298cf"
> +SRCREV_cni = "8c6c47d1c7fcf51c8d0c939d2af06dd108f876da"
> +SRCREV_plugins = "2d6d4b260a98973a206fde18bdde4f2511c72c60"
>  SRC_URI = "\
>         git://github.com/containernetworking/cni.git;nobranch=1;name=cni \
>          git://
> github.com/containernetworking/plugins.git;nobranch=1;destsuffix=plugins;name=plugins
> \
>         "
> -PV = "0.7.0+git${SRCREV_cni}"
> +PV = "0.7.1+git${SRCREV_cni}"
> --
> 2.17.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c12736058ffecd3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Aug 13, 2019 at 3:51 AM Chen Qi &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Upgrade the git vers=
ion to latest master to make the recipe<br>
truly serve its purpose.<br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">That&#39;s=C2=A0 not a good reason=
 to do the uprev, this is a git recipe because it makes sense for it to be =
git .. not because it is tracking the tip of master all the time.</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">What *actual* functionality are we=
 getting from this ? How was it tested ?</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
This upgrades both cni and plugins repos.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a> | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"no=
referrer" target=3D"_blank">cni_git.bb</a> b/recipes-networking/cni/<a href=
=3D"http://cni_git.bb" rel=3D"noreferrer" target=3D"_blank">cni_git.bb</a><=
br>
index 06b37a4..60c39f1 100644<br>
--- a/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a><br>
+++ b/recipes-networking/cni/<a href=3D"http://cni_git.bb" rel=3D"noreferre=
r" target=3D"_blank">cni_git.bb</a><br>
@@ -1,10 +1,10 @@<br>
=C2=A0# This cni version is supposed to track latest upstream.<br>
=C2=A0require cni.inc<br>
<br>
-SRCREV_cni =3D &quot;dc71cd2ba60c452c56a0a259f2a23d2afe42b688&quot;<br>
-SRCREV_plugins =3D &quot;0eddc554c0747200b7b112ce5322dcfa525298cf&quot;<br=
>
+SRCREV_cni =3D &quot;8c6c47d1c7fcf51c8d0c939d2af06dd108f876da&quot;<br>
+SRCREV_plugins =3D &quot;2d6d4b260a98973a206fde18bdde4f2511c72c60&quot;<br=
>
=C2=A0SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.com/containernet=
working/cni.git;nobranch=3D1;name=3Dcni" rel=3D"noreferrer" target=3D"_blan=
k">github.com/containernetworking/cni.git;nobranch=3D1;name=3Dcni</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/contai=
nernetworking/plugins.git;nobranch=3D1;destsuffix=3Dplugins;name=3Dplugins"=
 rel=3D"noreferrer" target=3D"_blank">github.com/containernetworking/plugin=
s.git;nobranch=3D1;destsuffix=3Dplugins;name=3Dplugins</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-PV =3D &quot;0.7.0+git${SRCREV_cni}&quot;<br>
+PV =3D &quot;0.7.1+git${SRCREV_cni}&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000c12736058ffecd3a--
