Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A3F1AE00C6E; Tue, 29 May 2018 07:28:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_05_10, 
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.67 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A11DEE00C62
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:28:49 -0700 (PDT)
Received: by mail-wm0-f67.google.com with SMTP id t11-v6so41244558wmt.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 07:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sVq1Ru6ZRIDZKayOre4b3C6GZgyhzBw1PDyqzdQsfPs=;
	b=hkAnL6+lPgT8A1Mb+Oy4Hh5h1FGgsbduLRzt7/akSq3IS8WIgZQghmRfNYvsWqHkbV
	izjssSO2LudKxyEmYTp+YfbDqckI1TeWFKhxfEhhAHL1kC/PvjJ968X5V7PSarkAbl2W
	MZZl9KWZrNjb1XAGmgmXTVWCvU0PB6QX0/SzIf6FLNkIYfGgSB2jixaTOje8G0cp6rsy
	sHD9u35n/78Nj2oL4jMFBqoW/pnTLs32m13SVoG5+b9HD4x516K1kk2lUMw97Q+6S/YT
	f9UJ8W8L4cFLjbM1S+/AXegF2ITWisol/lUYE2hZUz9qzc3xlXpYOzU7VmvKPbt8Pimz
	dSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sVq1Ru6ZRIDZKayOre4b3C6GZgyhzBw1PDyqzdQsfPs=;
	b=onxpbbi2ZhgoPif77r7HOk4rZbO4DFPfEUPLP8lFaSqwQG7xeYsgCw8xDyR35XjIvs
	ln9wGoTb35YruLN32qoYZBRzd9+Azajnhjfw9GjxJMFSRYJKAN7sbTEHQk0OFvvHqkUh
	/Sn60RKLqKA4oOx2JneApJ/EI3RFuSmPWXwDXaMB81JnhzqC6+PP1+oUpoVVGPPQORiY
	Jxdp5L9HDStXFDEEif7UX5z8vWe03bS040RY2nuM79qU1zTBrNV8DrXYpjoNO9s8zDoz
	kaV8KbFPBYB0eSUn03ihLCnqVWw9gmxewkXOuWo3NwN26iEp/Bjg71tW1iE8/L3IJVFA
	l2fw==
X-Gm-Message-State: ALKqPwcu35I45er9jGz92uexCkAxjkh8MwLhNbjk5GaLp5uJNCe5TkZ4
	C3xrCetd7ucXDTopIuZuiJ3urIBrLLAw4xzP0kbUMg==
X-Google-Smtp-Source: ADUXVKKjMVLl45vIVJG4/4C8BNh45nXqF5hKruDe7kInAIGWfg6AwWk4IjxOru/9zL9QOjTi89xLZ/C4XPCZCItdxP0=
X-Received: by 2002:a2e:8350:: with SMTP id
	l16-v6mr11400614ljh.28.1527604128196; 
	Tue, 29 May 2018 07:28:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:3307:0:0:0:0:0 with HTTP; Tue, 29 May 2018 07:28:47
	-0700 (PDT)
In-Reply-To: <1527531671-31867-1-git-send-email-mark.asselstine@windriver.com>
References: <1527531671-31867-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 29 May 2018 10:28:47 -0400
Message-ID: <CADkTA4O9W1ZvRwFfPvpLGxGcvX0NjkZDSMUPQHS8pO2opxrBTA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [V2][PATCH] kvmtool: uprev to latest version
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
X-List-Received-Date: Tue, 29 May 2018 14:28:50 -0000
Content-Type: multipart/alternative; boundary="0000000000006b2d3e056d590d0f"

--0000000000006b2d3e056d590d0f
Content-Type: text/plain; charset="UTF-8"

v2 is merged

Bruce

On Mon, May 28, 2018 at 2:21 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> Currently on the master branch builds of kvmtool are failing due to
> several missing headers. We need to only use the uapi headers and we
> also need the kvmtool upstream commit 1cc05b24bfe0 [x86/kvm-cpu.c:
> don't include <asm/msr-index.h>] to get the builds to work. So we
> can't do this as a fix and uprev and must do both at once in this
> single commit.
>
> The upstream project does not have releases so using the latest commit
> and setting the version to 4.14.0 to reflect the kernel version we
> currently build and which tests were done with, when using Yocto
> master.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>
> V2:
> * Add changes missed in V1 to set SRCREV and PV
>
>  recipes-extended/kvmtool/kvmtool.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-extended/kvmtool/kvmtool.bb
> b/recipes-extended/kvmtool/kvmtool.bb
> index 33fec31..d487ee2 100644
> --- a/recipes-extended/kvmtool/kvmtool.bb
> +++ b/recipes-extended/kvmtool/kvmtool.bb
> @@ -16,12 +16,12 @@ SRC_URI = "git://git.kernel.org/pub/scm/
> linux/kernel/git/will/kvmtool.git \
>             file://0002-kvmtool-add-EXTRA_CFLAGS-variable.patch \
>             "
>
> -SRCREV = "3fea89a924511f9f8fe05a892098fad77c1eca0d"
> -PV = "3.18.0+git${SRCREV}"
> +SRCREV = "0e1882a49f81cb15d328ef83a78849c0ea26eecc"
> +PV = "4.14.0+git${SRCREV}"
>
>  S = "${WORKDIR}/git"
>
> -EXTRA_OEMAKE='V=1 EXTRA_CFLAGS="-I${STAGING_KERNEL_DIR}/arch/${ARCH}/include
> -I${STAGING_KERNEL_BUILDDIR}/arch/${ARCH}/include/generated/"'
> +EXTRA_OEMAKE='V=1 EXTRA_CFLAGS="-I${STAGING_KERNEL_BUILDDIR}/include/generated
> -I${STAGING_KERNEL_BUILDDIR}/arch/${ARCH}/include/generated"'
>
>  do_install() {
>      install -d ${D}${bindir}
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

--0000000000006b2d3e056d590d0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">v2 is merged<div><br></div><div>Bruce</div></div><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, May 28, 2018 at 2:=
21 PM, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselst=
ine@windriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">Currently =
on the master branch builds of kvmtool are failing due to<br>
several missing headers. We need to only use the uapi headers and we<br>
also need the kvmtool upstream commit 1cc05b24bfe0 [x86/kvm-cpu.c:<br>
don&#39;t include &lt;asm/msr-index.h&gt;] to get the builds to work. So we=
<br>
can&#39;t do this as a fix and uprev and must do both at once in this<br>
single commit.<br>
<br>
The upstream project does not have releases so using the latest commit<br>
and setting the version to 4.14.0 to reflect the kernel version we<br>
currently build and which tests were done with, when using Yocto<br>
master.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
<br>
</span>V2:<br>
* Add changes missed in V1 to set SRCREV and PV<br>
<br>
=C2=A0recipes-extended/kvmtool/<a href=3D"http://kvmtool.bb" rel=3D"norefer=
rer" target=3D"_blank">kvmto<wbr>ol.bb</a> | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-extended/kvmtool/<a href=3D"http://kvmtool.bb" rel=3D"=
noreferrer" target=3D"_blank">kvm<wbr>tool.bb</a> b/recipes-extended/kvmtoo=
l/<a href=3D"http://kvmtool.bb" rel=3D"noreferrer" target=3D"_blank">kvm<wb=
r>tool.bb</a><br>
index 33fec31..d487ee2 100644<br>
--- a/recipes-extended/kvmtool/<a href=3D"http://kvmtool.bb" rel=3D"norefer=
rer" target=3D"_blank">kvm<wbr>tool.bb</a><br>
+++ b/recipes-extended/kvmtool/<a href=3D"http://kvmtool.bb" rel=3D"norefer=
rer" target=3D"_blank">kvm<wbr>tool.bb</a><br>
@@ -16,12 +16,12 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.or=
g/pub/scm/linux/kernel/git/will/kvmtool.git" rel=3D"noreferrer" target=3D"_=
blank">git.kernel.org/pub/scm/<wbr>linux/kernel/git/will/kvmtool.<wbr>git</=
a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-kvmtool-add-EXTRA_<wb=
r>CFLAGS-variable.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRCREV =3D &quot;<wbr>3fea89a924511f9f8fe05a892098fa<wbr>d77c1eca0d&quot;<=
br>
-PV =3D &quot;3.18.0+git${SRCREV}&quot;<br>
+SRCREV =3D &quot;<wbr>0e1882a49f81cb15d328ef83a78849<wbr>c0ea26eecc&quot;<=
br>
+PV =3D &quot;4.14.0+git${SRCREV}&quot;<br>
<div class=3D"HOEnZb"><div class=3D"h5">=C2=A0<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-EXTRA_OEMAKE=3D&#39;V=3D1 EXTRA_CFLAGS=3D&quot;-I${STAGING_<wbr>KERNEL_DIR=
}/arch/${ARCH}/<wbr>include -I${STAGING_KERNEL_BUILDDIR}/<wbr>arch/${ARCH}/=
include/<wbr>generated/&quot;&#39;<br>
+EXTRA_OEMAKE=3D&#39;V=3D1 EXTRA_CFLAGS=3D&quot;-I${STAGING_<wbr>KERNEL_BUI=
LDDIR}/include/<wbr>generated -I${STAGING_KERNEL_BUILDDIR}/<wbr>arch/${ARCH=
}/include/<wbr>generated&quot;&#39;<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}<br>
-- <br>
2.7.4<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div>

--0000000000006b2d3e056d590d0f--
