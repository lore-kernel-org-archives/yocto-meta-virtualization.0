Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BB1BE00BD5; Thu, 25 Jul 2019 19:40:59 -0700 (PDT)
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
	*      [209.85.128.66 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAE4FE00961
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 19:40:57 -0700 (PDT)
Received: by mail-wm1-f66.google.com with SMTP id f17so46334337wme.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 19:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6pJOVdixBtmW8RUYJQz2olhevhlgb1SB20R6SjnVu/w=;
	b=ndSvTtfHA1IJxjoq8WanOwSjBlcH04rgtsezC/sk4LftSOQ47CFPFFZHRAkIdL7MTB
	++x35KPzhrNk3HP9DVqGrsT5kg/FLLJYKKX8g3Yz95BC9YvufheGEKXu3Svq1bWIkw+q
	FbWObB10fcQ0PLda0EhJMVfUzuT3rfq5RpTgZVXTXt2IeHWDw0YD1H8Pxpt/DBg91WS2
	tWN519/vFnRFkfXRosBO8ZHK4hx0YdqsVTViFlkVJQZ6AMfoCq6vE+JVWsxoRa1j02bP
	A00LkVphhdvimo+Sq2B0IR5TLN69AWimmMycSdOQNiU/CR7mOBDf7e6QVdNdy5ICryT+
	0ePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6pJOVdixBtmW8RUYJQz2olhevhlgb1SB20R6SjnVu/w=;
	b=AULKCj2Y5NWBa7ET3apD9yLa6fvvRv2HofUhQt6DAh5jXge2qUamWEUt9LTXrTzUBe
	lmVlUhUOopfgAemzfhRwq7w6kIeAdMvhLx6LXyN9kQfxmTGwMBCcrMCPT4Xh/6leZuiU
	Mv8Lpn3YdOHXxz6Fb7E1A2N/K352u6/wPv12Hlmlh4Gft3f7GRgS8YRElOssSORbFqo2
	RoPlFcaqDVqPwQZkNTA39TfR/wWwJvutUKViHmjxn41zfz52LHdkyWsgfWVCv0FB0Ds2
	za3q0nNUvkiY4GWzB26nlUYx00sRTegMoTObi+OkzFgCqjL7MA+TRKKbmPLPufGOgp1F
	suvQ==
X-Gm-Message-State: APjAAAUQ7R08zx7m6W+8SehDXp9h77vEz5BJpxCs2RhAPJ229+SwDEgy
	XadaqsIWCWca16jvrdZjQPU/N2+fAiP3LHaxT2DHZo9E
X-Google-Smtp-Source: APXvYqxqyErOZU5KCcj5l1XaBHHoRi6YwW1oBO3EKIRDyRxLPZTJcN/ECkYfsBy0Q25crf7RE0UNMj3LdbFhGOG3BQI=
X-Received: by 2002:a1c:200a:: with SMTP id g10mr76541112wmg.160.1564108856873;
	Thu, 25 Jul 2019 19:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <1564032628-397256-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1564032628-397256-1-git-send-email-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Jul 2019 22:40:45 -0400
Message-ID: <CADkTA4P7mEgjGRgm_7wq-ZbZkQkF-n1oy=dcqhEn7GxSm9zY1g@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH 1/3] packagegroup-cloud-compute: remove postgresql-setup
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
X-List-Received-Date: Fri, 26 Jul 2019 02:40:59 -0000
Content-Type: multipart/alternative; boundary="000000000000cdd90c058e8c78c8"

--000000000000cdd90c058e8c78c8
Content-Type: text/plain; charset="UTF-8"

All three postgresql patches are merged.

Bruce

On Thu, Jul 25, 2019 at 1:30 AM <mingli.yu@windriver.com> wrote:

> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Package postgresql provides postgresql-setup file
> and packagegroup-cloud-compute already rdepends on
> postgresql, so remove postgresql-setup to avoid below
> error when run yocto compliance check against meta-openstack
> layer.
> ERROR: Nothing RPROVIDES 'postgresql-setup' (but
> /mybuild/layers/meta-cloud-services/meta-openstack/recipes-extended/packagegroups/
> packagegroup-cloud-compute.bb,
> /mybuild/layers/meta-cloud-services/meta-openstack/recipes-devtools/python/
> python-glance_git.bb,
> /mybuild/layers/meta-cloud-services/meta-openstack/recipes-extended/packagegroups/
> packagegroup-cloud-controller.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'postgresql-setup' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['postgresql-setup']
> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'packagegroup-cloud-compute', 'postgresql-setup']
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  .../recipes-extended/packagegroups/packagegroup-cloud-compute.bb
>  | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-extended/packagegroups/
> packagegroup-cloud-compute.bb
> b/meta-openstack/recipes-extended/packagegroups/
> packagegroup-cloud-compute.bb
> index 2e9446d..e884af0 100644
> --- a/meta-openstack/recipes-extended/packagegroups/
> packagegroup-cloud-compute.bb
> +++ b/meta-openstack/recipes-extended/packagegroups/
> packagegroup-cloud-compute.bb
> @@ -8,7 +8,6 @@ inherit packagegroup
>
>  RDEPENDS_${PN} = " \
>      cloud-init \
> -    postgresql-setup \
>      postgresql \
>      qemu \
>      libvirt \
> --
> 2.7.4
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000cdd90c058e8c78c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">All=
 three postgresql patches are merged.</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">Bruce</div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 25, 2019 at 1:30 AM &lt;<a href=3D"mail=
to:mingli.yu@windriver.com">mingli.yu@windriver.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Mingli Yu &lt;<a h=
ref=3D"mailto:Mingli.Yu@windriver.com" target=3D"_blank">Mingli.Yu@windrive=
r.com</a>&gt;<br>
<br>
Package postgresql provides postgresql-setup file<br>
and packagegroup-cloud-compute already rdepends on<br>
postgresql, so remove postgresql-setup to avoid below<br>
error when run yocto compliance check against meta-openstack<br>
layer.<br>
ERROR: Nothing RPROVIDES &#39;postgresql-setup&#39; (but /mybuild/layers/me=
ta-cloud-services/meta-openstack/recipes-extended/packagegroups/<a href=3D"=
http://packagegroup-cloud-compute.bb" rel=3D"noreferrer" target=3D"_blank">=
packagegroup-cloud-compute.bb</a>, /mybuild/layers/meta-cloud-services/meta=
-openstack/recipes-devtools/python/<a href=3D"http://python-glance_git.bb" =
rel=3D"noreferrer" target=3D"_blank">python-glance_git.bb</a>, /mybuild/lay=
ers/meta-cloud-services/meta-openstack/recipes-extended/packagegroups/<a hr=
ef=3D"http://packagegroup-cloud-controller.bb" rel=3D"noreferrer" target=3D=
"_blank">packagegroup-cloud-controller.bb</a> RDEPENDS on or otherwise requ=
ires it)<br>
NOTE: Runtime target &#39;postgresql-setup&#39; is unbuildable, removing...=
<br>
Missing or unbuildable dependency chain was: [&#39;postgresql-setup&#39;]<b=
r>
ERROR: Required build target &#39;meta-world-pkgdata&#39; has no buildable =
providers.<br>
Missing or unbuildable dependency chain was: [&#39;meta-world-pkgdata&#39;,=
 &#39;packagegroup-cloud-compute&#39;, &#39;postgresql-setup&#39;]<br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:Mingli.Yu@windriver.com" tar=
get=3D"_blank">Mingli.Yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-extended/packagegroups/<a href=3D"http://packagegroup-clo=
ud-compute.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-cloud-comp=
ute.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A01 file changed, 1 deletion(-)<br>
<br>
diff --git a/meta-openstack/recipes-extended/packagegroups/<a href=3D"http:=
//packagegroup-cloud-compute.bb" rel=3D"noreferrer" target=3D"_blank">packa=
gegroup-cloud-compute.bb</a> b/meta-openstack/recipes-extended/packagegroup=
s/<a href=3D"http://packagegroup-cloud-compute.bb" rel=3D"noreferrer" targe=
t=3D"_blank">packagegroup-cloud-compute.bb</a><br>
index 2e9446d..e884af0 100644<br>
--- a/meta-openstack/recipes-extended/packagegroups/<a href=3D"http://packa=
gegroup-cloud-compute.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup=
-cloud-compute.bb</a><br>
+++ b/meta-openstack/recipes-extended/packagegroups/<a href=3D"http://packa=
gegroup-cloud-compute.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup=
-cloud-compute.bb</a><br>
@@ -8,7 +8,6 @@ inherit packagegroup<br>
<br>
=C2=A0RDEPENDS_${PN} =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0cloud-init \<br>
-=C2=A0 =C2=A0 postgresql-setup \<br>
=C2=A0 =C2=A0 =C2=A0postgresql \<br>
=C2=A0 =C2=A0 =C2=A0qemu \<br>
=C2=A0 =C2=A0 =C2=A0libvirt \<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--000000000000cdd90c058e8c78c8--
