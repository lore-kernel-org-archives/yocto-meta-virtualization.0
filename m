Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E4724E00A62; Tue, 21 Nov 2017 12:07:22 -0800 (PST)
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
	*      [209.85.216.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B7F8E006CA
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Nov 2017 12:07:21 -0800 (PST)
Received: by mail-qt0-f172.google.com with SMTP id r39so20814229qtr.13
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Nov 2017 12:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2IBZDHafTGR178mi6HWZcDlrsIT9OplYzju2xxl/+lo=;
	b=ofscUrbB+axLgDwH1gLl/xHLahUfldPQkq86OIUDV1y8fir9Ib2dMgyfa1WHpZwfDi
	meQXG5b60VdcQ4ElLHPQwMieSO9ecuVb2P7wO5mYZO/eHgdzAzbwRaF2mhb+fnQvhVhX
	N7FcJP+9wLxa48tBIY0yd+nrihs/mE3s3KuOe3fabECGIyv17ab9897Bk4/Q29j6qPXh
	f0VIGVxG+0XmjCSp50r4i6GXNnAfTm6/me0WIuH6VXuW8RvApc7dmw5teAo8dJjPv/jg
	WjCNK56aiFkWA90z0Riog5lGo74J6XfU6hJELUMhy1HGYH60Jx6k0BX+18QJVrCypjZn
	udiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2IBZDHafTGR178mi6HWZcDlrsIT9OplYzju2xxl/+lo=;
	b=DSTlX1qbYMZ16zkRimfa8Hxwcm2MGuVI7WjLO1+sN9j+Nj8dtDR1iS7VjZqcq1eqro
	xYlxODp3IpJw1n+h1sNa3D2qOPv/ZYr0aHpYYTYiWRgqyz6EftVoExbdAAehErsf/SZ8
	p92lC4aq907xHqTHwYPCX9qtnFECQB02nMuYoHzOQOJu3vARg4j+s6KkZuW/5P7hNIHm
	aZgUekPSvKzrzlysKtWK+hmnOSrRnwN38skrSs8H4m/6wqLQ6jpVVvykxI54tyZUUh93
	50BvZL7kLQPI2xCHc/nVWwB9rxzkV3hmjDclKCTJ28XjUe4JlXY/ezxDxOIe+rJXrmqh
	Uumg==
X-Gm-Message-State: AJaThX6iQrVJnnbaUv0Dtixu2RpSMhN5MpEUVXhAfLmB96qs5i0loIIo
	+LYLASGtV8v6xz/6l4mmeqvvvOzdfDDZy+/v88dz1w==
X-Google-Smtp-Source: AGs4zMYUJE5AaTdDSTzBRhOgVV//THf6I/itavfaKRDB82Owqdo6LbNDAQv3pKHbNyJt7MPG9m0eCqW/0ot1tnhX6kg=
X-Received: by 10.237.55.74 with SMTP id i68mr9109499qtb.237.1511294841060;
	Tue, 21 Nov 2017 12:07:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Tue, 21 Nov 2017 12:07:20 -0800 (PST)
In-Reply-To: <20171116224123.28383-1-alistair.francis@xilinx.com>
References: <20171116224123.28383-1-alistair.francis@xilinx.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Nov 2017 15:07:20 -0500
Message-ID: <CADkTA4PjjqEU-wj7qJnEnn2B-WpGpVVTqU1c-wD3A-Z-uxjNzw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [RFC] xen: Enable compilation with external source
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
X-List-Received-Date: Tue, 21 Nov 2017 20:07:23 -0000
Content-Type: multipart/alternative; boundary="001a11359c962708e0055e83c05b"

--001a11359c962708e0055e83c05b
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 16, 2017 at 5:41 PM, Alistair Francis <
alistair.francis@xilinx.com> wrote:

> When building Xen from an external source the compile step fails as
> there is no Makefile (or anything else) copied into the Yocto
> build directories.
>

I can't say that I have an opinion on this, since I'm not up to speed on all
the moving parts.

I haven't seen any replies from the Xen folks, so replying in the hopes that
they'll see this and notice the thread.

One question though. When you say 'external source' are you talking about
the oe-core "externalsrc" concept, or some Xen specific thing ?

Bruce


>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
> This seems really nasty, but it's the only way I can get external
> source build working.
>
>  recipes-extended/xen/xen.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index cb314f8..7a54416 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -901,7 +901,6 @@ EXTRA_OEMAKE += "XEN_CONFIG_EXPERT=y"
>  EXTRA_OEMAKE += "debug=n"
>
>  do_configure() {
> -
>      #./configure --enable-xsmpolicy does not set XSM_ENABLE must be done
> manually
>      if [ "${XSM_ENABLED}" = "1" ]; then
>          echo "XSM_ENABLE := y" > ${S}/.config
> @@ -920,6 +919,9 @@ do_configure() {
>  }
>
>  do_compile() {
> +    # If using external source we need to copy the code in
> +    cp -rf ${S}/* ${B}/
> +
>      # workaround for build bug when CFLAGS is exported
>      # https://www.mail-archive.com/xen-devel@lists.xen.org/msg67822.html
>      unset CFLAGS
> --
> 2.14.1
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

--001a11359c962708e0055e83c05b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Nov 16, 2017 at 5:41 PM, Alistair Francis <span dir=3D"ltr">&lt=
;<a href=3D"mailto:alistair.francis@xilinx.com" target=3D"_blank">alistair.=
francis@xilinx.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
When building Xen from an external source the compile step fails as<br>
there is no Makefile (or anything else) copied into the Yocto<br>
build directories.<br></blockquote><div><br></div><div>I can&#39;t say that=
 I have an opinion on this, since I&#39;m not up to speed on all</div><div>=
the moving parts.</div><div><br></div><div>I haven&#39;t seen any replies f=
rom the Xen folks, so replying in the hopes that</div><div>they&#39;ll see =
this and notice the thread.</div><div><br></div><div>One question though. W=
hen you say &#39;external source&#39; are you talking about</div><div>the o=
e-core &quot;externalsrc&quot; concept, or some Xen specific thing ?</div><=
div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@xili=
nx.com">alistair.francis@xilinx.com</a>&gt;<br>
---<br>
This seems really nasty, but it&#39;s the only way I can get external<br>
source build working.<br>
<br>
=C2=A0recipes-extended/xen/xen.inc | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc<br=
>
index cb314f8..7a54416 100644<br>
--- a/recipes-extended/xen/xen.inc<br>
+++ b/recipes-extended/xen/xen.inc<br>
@@ -901,7 +901,6 @@ EXTRA_OEMAKE +=3D &quot;XEN_CONFIG_EXPERT=3Dy&quot;<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;debug=3Dn&quot;<br>
<br>
=C2=A0do_configure() {<br>
-<br>
=C2=A0 =C2=A0 =C2=A0#./configure --enable-xsmpolicy does not set XSM_ENABLE=
 must be done manually<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;${XSM_ENABLED}&quot; =3D &quot;1&quot; ]; th=
en<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;XSM_ENABLE :=3D y&quot; &gt; $=
{S}/.config<br>
@@ -920,6 +919,9 @@ do_configure() {<br>
=C2=A0}<br>
<br>
=C2=A0do_compile() {<br>
+=C2=A0 =C2=A0 # If using external source we need to copy the code in<br>
+=C2=A0 =C2=A0 cp -rf ${S}/* ${B}/<br>
+<br>
=C2=A0 =C2=A0 =C2=A0# workaround for build bug when CFLAGS is exported<br>
=C2=A0 =C2=A0 =C2=A0# <a href=3D"https://www.mail-archive.com/xen-devel@lis=
ts.xen.org/msg67822.html" rel=3D"noreferrer" target=3D"_blank">https://www.=
mail-archive.com/<wbr>xen-devel@lists.xen.org/<wbr>msg67822.html</a><br>
=C2=A0 =C2=A0 =C2=A0unset CFLAGS<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.1<br>
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
</div></div>

--001a11359c962708e0055e83c05b--
