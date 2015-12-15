Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E984DE00AF2; Mon, 14 Dec 2015 20:08:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.51 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A787EE0048C
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Dec 2015 20:08:19 -0800 (PST)
Received: by mail-wm0-f51.google.com with SMTP id p66so91645018wmp.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Dec 2015 20:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=CGRqIAZtBrDcD+xkHXiqBHzrj9pngC/4P573Y3f/Rpw=;
	b=Tn896M5GiN+mN5k6Kq2M38YKPRM8NzJ7NILVoqCxd0Xa/RqF6nwYNq++c/e/9tpNax
	lzwHr/iUtRjEVC0EkNPm4TS3RXrIKDzt+zFoVVElLhLvgPGQXlVvuFw+yTkv7GqyO2xq
	cHMOYtnRURkzpOk54/d79YoV62CLahm6yv68EQ/hpgK5MVUwSZqDgyTrPVeSSYiEGltz
	sr2cuS0W/AYoii8N9FulG84VdI6vmQ/Je/HL6q/3uXdfInexa/SBFcZeg5hTYJmpLnoe
	rmjJlIxnfSOvuWEfh0pvq1O8/TOHtruRByG7yEDeJowKT3QtFVGmXOKbWMKNtMPCQA1F
	J7uw==
MIME-Version: 1.0
X-Received: by 10.28.175.144 with SMTP id y138mr1743673wme.47.1450152498549;
	Mon, 14 Dec 2015 20:08:18 -0800 (PST)
Sender: asselsm@gmail.com
Received: by 10.194.59.176 with HTTP; Mon, 14 Dec 2015 20:08:18 -0800 (PST)
Received: by 10.194.59.176 with HTTP; Mon, 14 Dec 2015 20:08:18 -0800 (PST)
In-Reply-To: <1449871112-12401-4-git-send-email-cardoe@cardoe.com>
References: <1449871112-12401-1-git-send-email-cardoe@cardoe.com>
	<1449871112-12401-4-git-send-email-cardoe@cardoe.com>
Date: Mon, 14 Dec 2015 23:08:18 -0500
X-Google-Sender-Auth: UHfstz_WEXQy30kZu8Ej0YxlcWc
Message-ID: <CAPuovEJZmJNXt4EF168fWeU=g94dhdgaak3k4B3__oH4xZp_ag@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 4/4] xen: move PR variable from include file
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Dec 2015 04:08:23 -0000
Content-Type: multipart/alternative; boundary=001a11444b648bd9ee0526e7f0ea

--001a11444b648bd9ee0526e7f0ea
Content-Type: text/plain; charset=UTF-8

On Dec 11, 2015 4:59 PM, "Doug Goldstein" <cardoe@cardoe.com> wrote:
>
> It appears inapporpriate to have this variable in the include file and
> should live within the bitbake files themselves.

Actually you should drop this completely, the PR server will take care of
this for you.

Mark

>
> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> ---
>  recipes-extended/xen/xen.inc      | 1 -
>  recipes-extended/xen/xen_4.5.0.bb | 1 +
>  recipes-extended/xen/xen_git.bb   | 1 +
>  3 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 1bb0e6a..00f1823 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -2,7 +2,6 @@ DESCRIPTION = "Xen hypervisor"
>  HOMEPAGE = "http://xen.org"
>  LICENSE = "GPLv2"
>  SECTION = "console/tools"
> -PR = "r0"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=e0f0f3ac55608719a82394cc353928df"
>
> diff --git a/recipes-extended/xen/xen_4.5.0.bb b/recipes-extended/xen/
xen_4.5.0.bb
> index 6c17b90..73d01c4 100644
> --- a/recipes-extended/xen/xen_4.5.0.bb
> +++ b/recipes-extended/xen/xen_4.5.0.bb
> @@ -1,4 +1,5 @@
>  require xen.inc
> +PR = "r0"
>
>  SRC_URI = " \
>      http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/
xen_git.bb
> index 88145a3..4def3bf 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -1,4 +1,5 @@
>  require xen.inc
> +PR = "r0"
>
>  SRCREV = "68bd172e6fa565899c846eb72755c8ffd8562c8a"
>
> --
> 2.4.10
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

--001a11444b648bd9ee0526e7f0ea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Dec 11, 2015 4:59 PM, &quot;Doug Goldstein&quot; &lt;<a href=3D"mailto:c=
ardoe@cardoe.com">cardoe@cardoe.com</a>&gt; wrote:<br>
&gt;<br>
&gt; It appears inapporpriate to have this variable in the include file and=
<br>
&gt; should live within the bitbake files themselves.<br></p>
<p dir=3D"ltr">Actually you should drop this completely, the PR server will=
 take care of this for you. </p>
<p dir=3D"ltr">Mark </p>
<p dir=3D"ltr">&gt;<br>
&gt; Signed-off-by: Doug Goldstein &lt;<a href=3D"mailto:cardoe@cardoe.com"=
>cardoe@cardoe.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0recipes-extended/xen/xen.inc=C2=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt; =C2=A0recipes-extended/xen/<a href=3D"http://xen_4.5.0.bb">xen_4.5.0.b=
b</a> | 1 +<br>
&gt; =C2=A0recipes-extended/xen/<a href=3D"http://xen_git.bb">xen_git.bb</a=
>=C2=A0 =C2=A0| 1 +<br>
&gt; =C2=A03 files changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.i=
nc<br>
&gt; index 1bb0e6a..00f1823 100644<br>
&gt; --- a/recipes-extended/xen/xen.inc<br>
&gt; +++ b/recipes-extended/xen/xen.inc<br>
&gt; @@ -2,7 +2,6 @@ DESCRIPTION =3D &quot;Xen hypervisor&quot;<br>
&gt; =C2=A0HOMEPAGE =3D &quot;<a href=3D"http://xen.org">http://xen.org</a>=
&quot;<br>
&gt; =C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
&gt; =C2=A0SECTION =3D &quot;console/tools&quot;<br>
&gt; -PR =3D &quot;r0&quot;<br>
&gt;<br>
&gt; =C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3De0f0f3ac55608719=
a82394cc353928df&quot;<br>
&gt;<br>
&gt; diff --git a/recipes-extended/xen/<a href=3D"http://xen_4.5.0.bb">xen_=
4.5.0.bb</a> b/recipes-extended/xen/<a href=3D"http://xen_4.5.0.bb">xen_4.5=
.0.bb</a><br>
&gt; index 6c17b90..73d01c4 100644<br>
&gt; --- a/recipes-extended/xen/<a href=3D"http://xen_4.5.0.bb">xen_4.5.0.b=
b</a><br>
&gt; +++ b/recipes-extended/xen/<a href=3D"http://xen_4.5.0.bb">xen_4.5.0.b=
b</a><br>
&gt; @@ -1,4 +1,5 @@<br>
&gt; =C2=A0require xen.inc<br>
&gt; +PR =3D &quot;r0&quot;<br>
&gt;<br>
&gt; =C2=A0SRC_URI =3D &quot; \<br>
&gt; =C2=A0 =C2=A0 =C2=A0<a href=3D"http://bits.xensource.com/oss-xen/relea=
se/${PV}/xen-${PV}.tar.gz">http://bits.xensource.com/oss-xen/release/${PV}/=
xen-${PV}.tar.gz</a> \<br>
&gt; diff --git a/recipes-extended/xen/<a href=3D"http://xen_git.bb">xen_gi=
t.bb</a> b/recipes-extended/xen/<a href=3D"http://xen_git.bb">xen_git.bb</a=
><br>
&gt; index 88145a3..4def3bf 100644<br>
&gt; --- a/recipes-extended/xen/<a href=3D"http://xen_git.bb">xen_git.bb</a=
><br>
&gt; +++ b/recipes-extended/xen/<a href=3D"http://xen_git.bb">xen_git.bb</a=
><br>
&gt; @@ -1,4 +1,5 @@<br>
&gt; =C2=A0require xen.inc<br>
&gt; +PR =3D &quot;r0&quot;<br>
&gt;<br>
&gt; =C2=A0SRCREV =3D &quot;68bd172e6fa565899c846eb72755c8ffd8562c8a&quot;<=
br>
&gt;<br>
&gt; --<br>
&gt; 2.4.10<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
</p>

--001a11444b648bd9ee0526e7f0ea--
