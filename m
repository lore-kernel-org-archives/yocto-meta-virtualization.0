Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF408E00BA2; Mon, 19 Jun 2017 05:37:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1795E00B27
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Jun 2017 05:37:40 -0700 (PDT)
Received: by mail-qt0-f196.google.com with SMTP id s33so19125681qtg.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Jun 2017 05:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oBBKe7/LLrvaQrVAcA1BTVxTWuAZ7tDQ1Euq4JKTges=;
	b=TZUMgwqttiWCrP2V26+61h/KuTFMxGSdaOmaC87CMnZGyso0/St+Ukvf2vbGTbrBCL
	6Y433cRJC1i/dbB39JGR+NxjN+PGJv4on+rXc57vjpS+IE0rfzZTmVxmmb+ZEbR804Y1
	SYHPfb8i+/iQY1aFm3fH3Bxl/ejJdnYbaO6/CvG+EC64VQKw+Sv6IrfFdkkXm7JK621Z
	tGjzSiufTBFFdeiBUXrLxcSrTdYG2hHBZQk+m3HOGiQCCnT1hyBkMrDPqgSkQjcpLWso
	VeI7QkH4yZulEBdKm2xOf5AFaTuCnp/LRhEVs38O7Ldb6O4wbit5qR4QM3kksQY+M8dX
	r9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oBBKe7/LLrvaQrVAcA1BTVxTWuAZ7tDQ1Euq4JKTges=;
	b=dg1kBEbbQ5pFJNyBZB8TATOK68PD8on8sqB8J3FL/Oh9DKgIUdZxCy2HAIePcr8PUW
	w/9Lv5RslKLLJ3CPuTjtVebyXQ8LMSEV14Ju4dXBLnBsAHtL/UM27qI79WGfZDplHEYP
	EhSTv1t1bEKYW3a+cSrww8eqg8msUbpnU9DxgvIDVlF/c9Z2QEvHxrdfL0h4lDLbAPyI
	P9rY0FC7hMSzC482qjNWCXGhkS38mqfLsjBGqPFaRny2a7J0ne/4pjNunBD4rETCsWv4
	YpDVYYgdEbEW0xX7Tu0obEZ6LFi9QuhwYF+4zHld4yLEicVCgZP1sgL+Qu5EVMwIPYzZ
	wbTQ==
X-Gm-Message-State: AKS2vOxYOZkYbHxnW4/N4TiZPQsLwXpUxFvXU8PTIrPK3Q9TA31PzGGz
	dSi/boxa1ghdxoT+7erIHF0vehV6nQ==
X-Received: by 10.237.48.130 with SMTP id 2mr20713504qtf.17.1497875859924;
	Mon, 19 Jun 2017 05:37:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.209.28 with HTTP; Mon, 19 Jun 2017 05:37:39 -0700 (PDT)
In-Reply-To: <1497554661-10173-1-git-send-email-mark.asselstine@windriver.com>
References: <1497554661-10173-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 19 Jun 2017 08:37:39 -0400
Message-ID: <CADkTA4MfBsan3yCV9avZNVQA9KAG9hZZ55o6Z1h7hjynjEByBg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: temporary workaround for gcc 7 issue
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
X-List-Received-Date: Mon, 19 Jun 2017 12:37:42 -0000
Content-Type: multipart/alternative; boundary="94eb2c0c7b148c6d2005524f66c0"

--94eb2c0c7b148c6d2005524f66c0
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Jun 15, 2017 at 3:24 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> gcc 7 has a bug:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=11672
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=78969
>
> In order to avoid the build failure that this causes we reduce the
> range by one. Better to have a slight reduction in the range than
> having nobody to be able to build and use lxc.
>
> Once gcc is fixed this can be reverted.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../files/cgroups-work-around-issue-in-gcc-7.patch | 34
> ++++++++++++++++++++++
>  recipes-containers/lxc/lxc_2.0.8.bb                |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/
> cgroups-work-around-issue-in-gcc-7.patch
>
> diff --git a/recipes-containers/lxc/files/cgroups-work-around-issue-in-gcc-7.patch
> b/recipes-containers/lxc/files/cgroups-work-around-issue-in-gcc-7.patch
> new file mode 100644
> index 0000000..90740fb
> --- /dev/null
> +++ b/recipes-containers/lxc/files/cgroups-work-around-
> issue-in-gcc-7.patch
> @@ -0,0 +1,34 @@
> +From 58a2d817a82100d287c60c63315d81445cdba3f9 Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Thu, 15 Jun 2017 15:12:08 -0400
> +Subject: [PATCH] cgroups: work around issue in gcc 7
> +
> +This works around
> +https://bugzilla.yoctoproject.org/show_bug.cgi?id=11672
> +https://gcc.gnu.org/bugzilla/show_bug.cgi?id=78969
> +
> +By removing a single cgroup entry. For the majority of usecases this
> +loss of a single entry should not be an issue and once gcc 7 is fixed
> +we can revert this.
> +
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + src/lxc/cgroups/cgfsng.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/lxc/cgroups/cgfsng.c b/src/lxc/cgroups/cgfsng.c
> +index ebd548b..c520abd 100644
> +--- a/src/lxc/cgroups/cgfsng.c
> ++++ b/src/lxc/cgroups/cgfsng.c
> +@@ -1373,7 +1373,7 @@ static inline bool cgfsng_create(void *hdata)
> +       offset = cgname + len - 5;
> +
> + again:
> +-      if (idx == 1000) {
> ++      if (idx == 999) {
> +               ERROR("Too many conflicting cgroup names");
> +               goto out_free;
> +       }
> +--
> +2.7.4
> +
> diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/
> lxc_2.0.8.bb
> index 80c8da7..3dd9f63 100644
> --- a/recipes-containers/lxc/lxc_2.0.8.bb
> +++ b/recipes-containers/lxc/lxc_2.0.8.bb
> @@ -28,6 +28,7 @@ SRC_URI = "http://linuxcontainers.org/
> downloads/${BPN}-${PV}.tar.gz \
>         file://lxc-fix-B-S.patch \
>         file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
>         file://logs-optionally-use-base-filenames-to-report-src-fil.patch
> \
> +       file://cgroups-work-around-issue-in-gcc-7.patch \
>         "
>
>  SRC_URI[md5sum] = "7bfd95280522d7936c0979dfea92cdb5"
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

--94eb2c0c7b148c6d2005524f66c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, Jun 15, 2017 at 3:24 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">gcc 7 has a bug:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11672" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.<wbr>org/sh=
ow_bug.cgi?id=3D11672</a><br>
<a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D78969" rel=3D"nor=
eferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/<wbr>show_bug.cgi?i=
d=3D78969</a><br>
<br>
In order to avoid the build failure that this causes we reduce the<br>
range by one. Better to have a slight reduction in the range than<br>
having nobody to be able to build and use lxc.<br>
<br>
Once gcc is fixed this can be reverted.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0.../files/cgroups-work-around-<wbr>issue-in-gcc-7.patch | 34 ++++++++=
++++++++++++++<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.<wbr>0.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 35 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/lxc/files/<wbr>cgroups-work-aro=
und-issue-in-<wbr>gcc-7.patch<br>
<br>
diff --git a/recipes-containers/lxc/<wbr>files/cgroups-work-around-<wbr>iss=
ue-in-gcc-7.patch b/recipes-containers/lxc/<wbr>files/cgroups-work-around-<=
wbr>issue-in-gcc-7.patch<br>
new file mode 100644<br>
index 0000000..90740fb<br>
--- /dev/null<br>
+++ b/recipes-containers/lxc/<wbr>files/cgroups-work-around-<wbr>issue-in-g=
cc-7.patch<br>
@@ -0,0 +1,34 @@<br>
+From 58a2d817a82100d287c60c63315d81<wbr>445cdba3f9 Mon Sep 17 00:00:00 200=
1<br>
+From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver.com"=
>mark.asselstine@windriver.com</a><wbr>&gt;<br>
+Date: Thu, 15 Jun 2017 15:12:08 -0400<br>
+Subject: [PATCH] cgroups: work around issue in gcc 7<br>
+<br>
+This works around<br>
+<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11672" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.<wbr>yoctoproject.org/sh=
ow_bug.cgi?<wbr>id=3D11672</a><br>
+<a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D78969" rel=3D"no=
referrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/<wbr>show_bug.cgi?=
id=3D78969</a><br>
+<br>
+By removing a single cgroup entry. For the majority of usecases this<br>
+loss of a single entry should not be an issue and once gcc 7 is fixed<br>
+we can revert this.<br>
+<br>
+Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windr=
iver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
+---<br>
+ src/lxc/cgroups/cgfsng.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/lxc/cgroups/cgfsng.c b/src/lxc/cgroups/cgfsng.c<br>
+index ebd548b..c520abd 100644<br>
+--- a/src/lxc/cgroups/cgfsng.c<br>
++++ b/src/lxc/cgroups/cgfsng.c<br>
+@@ -1373,7 +1373,7 @@ static inline bool cgfsng_create(void *hdata)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D cgname + len - 5;<br>
+<br>
+ again:<br>
+-=C2=A0 =C2=A0 =C2=A0 if (idx =3D=3D 1000) {<br>
++=C2=A0 =C2=A0 =C2=A0 if (idx =3D=3D 999) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ERROR(&quot;Too man=
y conflicting cgroup names&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_free;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a> b/recipes-containers/lx=
c/<a href=3D"http://lxc_2.0.8.bb" rel=3D"noreferrer" target=3D"_blank">lxc_=
<wbr>2.0.8.bb</a><br>
index 80c8da7..3dd9f63 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_2.0.8.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.8.bb</a><br>
@@ -28,6 +28,7 @@ SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org/d=
ownloads/${BPN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://l=
inuxcontainers.org/<wbr>downloads/${BPN}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-fix-B-S.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-doc-upgrade-to-use-<wbr>docbook-3.1-=
DTD.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://logs-optionally-use-<wbr>base-filenames-=
to-report-src-<wbr>fil.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0file://cgroups-work-around-<wbr>issue-in-gcc-7.=
patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>7bfd95280522d7936c0979dfea92cd<wbr>b5&=
quot;<br>
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

--94eb2c0c7b148c6d2005524f66c0--
