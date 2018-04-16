Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33E37E00948; Mon, 16 Apr 2018 13:17:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 000A6E00A0C
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Apr 2018 13:17:25 -0700 (PDT)
Received: by mail-lf0-f42.google.com with SMTP id m14-v6so11998592lfc.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Apr 2018 13:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y1eOkO57EbwVATpRQ9MTHvnEk7bylE9fJB31bdtTHtI=;
	b=FLR4aZkj0IeleGNJ6VBuWmzU6RJPUEBg6u1t8cC8N4BBm8Hz3Ao1sHTFokyc745/FM
	90je7ED3tJyQYeu+gIrj/kJ7I8dQeD31TfqSAKhj6orHT7BM0rCCDJVwsmSr18qovO4I
	RtZnTJdXLtzi8edyXDT+uwn9N2jcX5EwCqRy7x2SRmkeuIlY3EIFur216LgopF7NuSbW
	Guf/2FDNk/69pi+urCvSdSinGBUVmLwXQzcVi3IP3U8QWc0J5444eTLw3CHKDeQZRDn/
	BwYrxdhStDlVIb7JHQ+BJYbICaTgpDbdPrYqzISvJKG/RNUmXELXEmd1qjDu/HiANSoj
	27lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y1eOkO57EbwVATpRQ9MTHvnEk7bylE9fJB31bdtTHtI=;
	b=gxka+piKGFRx6rhma2A06UIHWmzD2wjMg6moIAfUfBGJ2F1AG6oiETYiYqkKqqlOcQ
	Q9VY6jv/tSPWYBf0Zci7o95grHW88UbTjCsr/v9A7HR4Hfyv1ZDdfvJWv2s7ODUtLFK2
	x1SLlbUSC6xpBE+Kxf5rkohqJ3kkNoL3Q2JqnmNui4h3SxBsKTyiTE/DtDSp8QtuCTey
	Vaeanw3SiTtnClOdVDyOXfM3vQlSjAXMu28U8KDokM7fWMGbWZ7wBwERQGswnu4k6shy
	+c8j1aprtBtrpsjmHkMnn0nykwkFphzZnoUMgc+qmnEMGHjFbw7MqxJBZrmZjUigNOxc
	33qg==
X-Gm-Message-State: ALQs6tAx3UsEiRiaVUEqbxk+pbh4Hq4z/RLl7dM37hyva8UlWwqyHW/b
	WXJRhzDATacg4Qnh08X441koYIMAUhhsOEIemUs=
X-Google-Smtp-Source: AIpwx4+3QxOGWMh06+jwRlhMkRXnUB7DrJ65KFiWAlEo1fuopom5eUrVwXIigyElRdE6DSqPxby43DvFcuiX++AQhdA=
X-Received: by 10.46.148.75 with SMTP id o11mr7336106ljh.39.1523909844902;
	Mon, 16 Apr 2018 13:17:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.133.216 with HTTP; Mon, 16 Apr 2018 13:17:24 -0700 (PDT)
In-Reply-To: <CACMJ4GZUZhaVj3u2tP_HE_n21_MnGjot1reSpTrsuTQ2ZMwSvw@mail.gmail.com>
References: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
	<CACMJ4GZUZhaVj3u2tP_HE_n21_MnGjot1reSpTrsuTQ2ZMwSvw@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 16 Apr 2018 13:17:24 -0700
Message-ID: <CACMJ4GbGRod1n6fy-hsRcMLk3_XzOUNjbA4=yprhXPiHjYaxGw@mail.gmail.com>
To: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH v2 0/8] xen: Xen vTPM stubdomains
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
X-List-Received-Date: Mon, 16 Apr 2018 20:17:39 -0000
Content-Type: multipart/alternative; boundary="f4f5e80c5900f9a8df0569fce883"

--f4f5e80c5900f9a8df0569fce883
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 9, 2018 at 4:56 PM, Christopher Clark <
christopher.w.clark@gmail.com> wrote:

> Kurt,
>
> I've reviewed the patches today and all the improvements look good.
>
> Unfortunately, in performing a build with the patches applied to rocko, I
> encountered a link error when attempting:
>   bitbake xen-vtpm
>


This build breakage turned out to be a simple case of /bin/sh pointing to
dash: in that configuration, "echo -e" is broken by dash's builtin
implementation. Adding sed to inject the newlines makes it all work, as per
this patch below, and then it successfully builds to completion.

Christopher


diff --git a/recipes-extended/xen/xen-vtpm.inc
b/recipes-extended/xen/xen-vtpm.inc
index c201f25..4e78d16 100644
--- a/recipes-extended/xen/xen-vtpm.inc
+++ b/recipes-extended/xen/xen-vtpm.inc
@@ -52,7 +52,7 @@ do_configure() {
     # 'sort -V' to natural sort version numbers
     # 'head -n1' to capture the first line of output from sort command

-    if [ "${PV}" = `echo -e "${PV}\n4.9.999" | sort -V | head -n1` ]; then
+    if [ "${PV}" = "$(echo "${PV};4.9.999" | sed 's/;/\n/' | sort -V |
head -n1)" ] ; then
         sed -i "s/^inline/static inline/g" ${B}/vtpmmgr/*.h
     fi

--f4f5e80c5900f9a8df0569fce883
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Apr 9, 2018 at 4:56 PM, Christopher Clark <span dir=3D"ltr">&lt;<a href=
=3D"mailto:christopher.w.clark@gmail.com" target=3D"_blank">christopher.w.c=
lark@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div>Kurt,</div><div><br></div><div>I&#39;v=
e reviewed the patches today and all the improvements look good.</div><div>=
<br></div><div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:small;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-d=
ecoration-style:initial;text-decoration-color:initial">Unfortunately, in pe=
rforming a build with the patches applied to rocko, I encountered a link er=
ror when attempting:</div><div style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:norm=
al;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-alig=
n:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing=
:0px;text-decoration-style:initial;text-decoration-color:initial">=C2=A0 bi=
tbake xen-vtpm</div></div></div></blockquote><div><br></div><div><br></div>=
<div>This build breakage turned out to be a simple case of /bin/sh pointing=
 to dash: in that configuration, &quot;echo -e&quot; is broken by dash&#39;=
s builtin implementation. Adding sed to inject the newlines makes it all wo=
rk, as per this patch below, and then it successfully builds to completion.=
</div><div><br></div><div>Christopher</div><div><br></div><div><br></div><d=
iv><div>diff --git a/recipes-extended/xen/xen-vtpm.inc b/recipes-extended/x=
en/xen-vtpm.inc</div><div>index c201f25..4e78d16 100644</div><div>--- a/rec=
ipes-extended/xen/xen-vtpm.inc</div><div>+++ b/recipes-extended/xen/xen-vtp=
m.inc</div><div>@@ -52,7 +52,7 @@ do_configure() {</div><div>=C2=A0 =C2=A0 =
=C2=A0# &#39;sort -V&#39; to natural sort version numbers</div><div>=C2=A0 =
=C2=A0 =C2=A0# &#39;head -n1&#39; to capture the first line of output from =
sort command</div><div>=C2=A0 =C2=A0 =C2=A0</div><div>-=C2=A0 =C2=A0 if [ &=
quot;${PV}&quot; =3D `echo -e &quot;${PV}\n4.9.999&quot; | sort -V | head -=
n1` ]; then</div><div>+=C2=A0 =C2=A0 if [ &quot;${PV}&quot; =3D &quot;$(ech=
o &quot;${PV};4.9.999&quot; | sed &#39;s/;/\n/&#39; | sort -V | head -n1)&q=
uot; ] ; then</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &quot;s/^i=
nline/static inline/g&quot; ${B}/vtpmmgr/*.h</div><div>=C2=A0 =C2=A0 =C2=A0=
fi</div><div>=C2=A0</div></div><div><br></div><div><br></div></div></div></=
div>

--f4f5e80c5900f9a8df0569fce883--
