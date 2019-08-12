Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02F1BE00961; Mon, 12 Aug 2019 08:05:01 -0700 (PDT)
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
	*      [209.85.167.46 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D08EBE0090E
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 08:04:59 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id c19so74467097lfm.10
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Aug 2019 08:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oyMDb7NLL090PUz34QknesXjrOXeFgjkmyiawOl5cR0=;
	b=IkirTJpsOQ2j7qfkP+gGR/1CMAR3EL8kWYbrrxIwfyzooLLdmEx2DoZVRK7I65QKb5
	ZP7HEmsVBXgUSxnR7rLvxumU5W3ye38lW/FlSf4aGD4k1bGzxJ7NdTD72kAveqI5KScj
	WjoSR+GFfZoEBJDLqTcA81YyASAc80JedRscvRCx2KF6XdrHaxA/nobP2aR0ahDPWQ6J
	0iVzFmWEfuUh+Q3bniliX9R1a4kRpzu5u4Z8LlibU3/O+pbdrSLMArQ5wP0WHK0PJhIY
	/uxqh6Th4iDGazgz9ce6rZvkBQKtaHFSDg+vpeuCMwy0kNChW1yy0NyTmlq8+wAO5WlA
	3qVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oyMDb7NLL090PUz34QknesXjrOXeFgjkmyiawOl5cR0=;
	b=XBGOrDSy+6eUeZ50nTWxDXMNN/c31w2qF6D9zkQhnWSSasbv6cEhpidVG7L8KnvgPi
	L7VL08ESs9p3LBHK5Dpyogkd84qcSil/QI4df1uG15Aa1E5vQPr+SKvxxe2bOKJwrqBU
	8FylIkOW1yNnW5R0/XUduOlXGPpZK9PRh+Em2N+0kCvaDudNcXu7LDipDFl+Zej7mVX4
	lz6UI0zU47XJVCwBa7dD+VSEDNBQtkhQM8EP0t9mG/5OiBjZMt16BUAocZ6YBMCNgkAu
	b1aOhkqFhHsJqCpXxbIHpyaWg5HeePJcWjb1dyzaX1RjMc1GlcNlQonrxppNTsmF9rQO
	J2bg==
X-Gm-Message-State: APjAAAXnMzCg50alyj/uNfQeodKcuEZ0OS3azL1SERwt+aMHn3IkPwZl
	c9gPIY5yTTxfR5H9nOVE6ifkC3SgL/30oTZ9mWfcbd1aKu8=
X-Google-Smtp-Source: APXvYqzHJ6ZKyhZtNFpLiOniWE1TpQKjKEndEHAXxBzgpVBgeK5t6XjvZBdeqCLndwMuJv9bzNF1B3t4nLdwrkHmmw8=
X-Received: by 2002:ac2:545b:: with SMTP id d27mr20405209lfn.36.1565622298742; 
	Mon, 12 Aug 2019 08:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190809072416.30288-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190809072416.30288-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Aug 2019 11:04:46 -0400
Message-ID: <CADkTA4PjghdiOwSOaHYYdurPvcC+gY5Rwd8DBQcP2tFjv2O5EA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] criu: upgrade 3.11 -> 3.12
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
X-List-Received-Date: Mon, 12 Aug 2019 15:05:01 -0000
Content-Type: multipart/alternative; boundary="000000000000f8196a058fecd886"

--000000000000f8196a058fecd886
Content-Type: text/plain; charset="UTF-8"

staged in master-next

Bruce

On Fri, Aug 9, 2019 at 3:25 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
>
> Refresh patch: 0001-criu-Fix-toolchain-hardcode.patch
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  recipes-containers/criu/criu_git.bb                          |  4 ++--
>  .../criu/files/0001-criu-Fix-toolchain-hardcode.patch        | 12
> +++++++-----
>  2 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/recipes-containers/criu/criu_git.bb
> b/recipes-containers/criu/criu_git.bb
> index 6fb60db..c1ddb49 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -13,8 +13,8 @@ EXCLUDE_FROM_WORLD = "1"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=412de458544c1cb6a2b512cd399286e2"
>
> -SRCREV = "c74b83cd49c00589c0c0468ba5fe685b67fdbd0a"
> -PV = "3.11+git${SRCPV}"
> +SRCREV = "437561d2bbc09d734ae276dbfca337569f454d54"
> +PV = "3.12+git${SRCPV}"
>
>  SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
>             file://0001-criu-Fix-toolchain-hardcode.patch \
> diff --git
> a/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
> b/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
> index 838cbdc..bd7a6c5 100644
> --- a/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
> +++ b/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch
> @@ -46,17 +46,20 @@ diff --git a/scripts/nmk/scripts/tools.mk
> b/scripts/nmk/scripts/tools.mk
>  index 56dba84..1698821 100644
>  --- a/scripts/nmk/scripts/tools.mk
>  +++ b/scripts/nmk/scripts/tools.mk
> -@@ -2,31 +2,31 @@ ifndef ____nmk_defined__tools
> +@@ -2,35 +2,35 @@ ifndef ____nmk_defined__tools
>
>   #
>   # System tools shorthands
>  -RM            := rm -f
>  +RM            ?= rm -f
>   HOSTLD                ?= ld
> --LD            := $(CROSS_COMPILE)$(HOSTLD)
> -+LD            ?= $(CROSS_COMPILE)$(HOSTLD)
> + ifeq ($(origin LD), default)
> + LD            := $(CROSS_COMPILE)$(HOSTLD)
> + endif
>   HOSTCC                ?= gcc
> --CC            := $(CROSS_COMPILE)$(HOSTCC)
> + ifeq ($(origin CC), default)
> + CC            := $(CROSS_COMPILE)$(HOSTCC)
> + endif
>  -CPP           := $(CC) -E
>  -AS            := $(CROSS_COMPILE)as
>  -AR            := $(CROSS_COMPILE)ar
> @@ -69,7 +72,6 @@ index 56dba84..1698821 100644
>  -AWK           := awk
>  -PERL          := perl
>  -FULL_PYTHON   := $(shell which python2 2>/dev/null || which python3
> 2>/dev/null)
> -+CC            ?= $(CROSS_COMPILE)$(HOSTCC)
>  +CPP           ?= $(CC) -E
>  +AS            ?= $(CROSS_COMPILE)as
>  +AR            ?= $(CROSS_COMPILE)ar
> --
> 2.7.4
>
>
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

--000000000000f8196a058fecd886
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">sta=
ged in master-next</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Fri, Aug 9, 2019 at 3:25 AM Zang Ruochen &lt;<a href=3D"mailto:zang=
rc.fnst@cn.fujitsu.com">zangrc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">From: Yuan Chao &lt;<a hr=
ef=3D"mailto:yuanc.fnst@cn.fujitsu.com" target=3D"_blank">yuanc.fnst@cn.fuj=
itsu.com</a>&gt;<br>
<br>
Refresh patch: 0001-criu-Fix-toolchain-hardcode.patch<br>
<br>
Signed-off-by: Yuan Chao &lt;<a href=3D"mailto:yuanc.fnst@cn.fujitsu.com" t=
arget=3D"_blank">yuanc.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0.../criu/files/0001-criu-Fix-toolchain-hardcode.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 12 +++++++-----<br>
=C2=A02 files changed, 9 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"=
noreferrer" target=3D"_blank">criu_git.bb</a> b/recipes-containers/criu/<a =
href=3D"http://criu_git.bb" rel=3D"noreferrer" target=3D"_blank">criu_git.b=
b</a><br>
index 6fb60db..c1ddb49 100644<br>
--- a/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu_git.bb</a><br>
+++ b/recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu_git.bb</a><br>
@@ -13,8 +13,8 @@ EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D412de458544c1cb6a2b51=
2cd399286e2&quot;<br>
<br>
-SRCREV =3D &quot;c74b83cd49c00589c0c0468ba5fe685b67fdbd0a&quot;<br>
-PV =3D &quot;3.11+git${SRCPV}&quot;<br>
+SRCREV =3D &quot;437561d2bbc09d734ae276dbfca337569f454d54&quot;<br>
+PV =3D &quot;3.12+git${SRCPV}&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/xemul/criu.git;p=
rotocol=3Dgit" rel=3D"noreferrer" target=3D"_blank">github.com/xemul/criu.g=
it;protocol=3Dgit</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-criu-Fix-toolchain-ha=
rdcode.patch \<br>
diff --git a/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode=
.patch b/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.pat=
ch<br>
index 838cbdc..bd7a6c5 100644<br>
--- a/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch<=
br>
+++ b/recipes-containers/criu/files/0001-criu-Fix-toolchain-hardcode.patch<=
br>
@@ -46,17 +46,20 @@ diff --git a/scripts/nmk/scripts/<a href=3D"http://tool=
s.mk" rel=3D"noreferrer" target=3D"_blank">tools.mk</a> b/scripts/nmk/scrip=
ts/<a href=3D"http://tools.mk" rel=3D"noreferrer" target=3D"_blank">tools.m=
k</a><br>
=C2=A0index 56dba84..1698821 100644<br>
=C2=A0--- a/scripts/nmk/scripts/<a href=3D"http://tools.mk" rel=3D"noreferr=
er" target=3D"_blank">tools.mk</a><br>
=C2=A0+++ b/scripts/nmk/scripts/<a href=3D"http://tools.mk" rel=3D"noreferr=
er" target=3D"_blank">tools.mk</a><br>
-@@ -2,31 +2,31 @@ ifndef ____nmk_defined__tools<br>
+@@ -2,35 +2,35 @@ ifndef ____nmk_defined__tools<br>
<br>
=C2=A0 #<br>
=C2=A0 # System tools shorthands<br>
=C2=A0-RM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D rm -f<br>
=C2=A0+RM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D rm -f<br>
=C2=A0 HOSTLD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D l=
d<br>
--LD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(CROSS_COMPILE)$(HOSTLD=
)<br>
-+LD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D $(CROSS_COMPILE)$(HOSTLD=
)<br>
+ ifeq ($(origin LD), default)<br>
+ LD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(CROSS_COMPILE)$(HOSTLD=
)<br>
+ endif<br>
=C2=A0 HOSTCC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D g=
cc<br>
--CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(CROSS_COMPILE)$(HOSTCC=
)<br>
+ ifeq ($(origin CC), default)<br>
+ CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(CROSS_COMPILE)$(HOSTCC=
)<br>
+ endif<br>
=C2=A0-CPP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D $(CC) -E<br>
=C2=A0-AS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(CROSS_COMPILE)as<=
br>
=C2=A0-AR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D $(CROSS_COMPILE)ar<=
br>
@@ -69,7 +72,6 @@ index 56dba84..1698821 100644<br>
=C2=A0-AWK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D awk<br>
=C2=A0-PERL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D perl<br>
=C2=A0-FULL_PYTHON=C2=A0 =C2=A0:=3D $(shell which python2 2&gt;/dev/null ||=
 which python3 2&gt;/dev/null)<br>
-+CC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D $(CROSS_COMPILE)$(HOSTCC=
)<br>
=C2=A0+CPP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D $(CC) -E<br>
=C2=A0+AS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D $(CROSS_COMPILE)as<=
br>
=C2=A0+AR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D $(CROSS_COMPILE)ar<=
br>
-- <br>
2.7.4<br>
<br>
<br>
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
- Gandalf, Star Trek II<br><br></div>

--000000000000f8196a058fecd886--
