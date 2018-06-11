Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C0BDE02240; Mon, 11 Jun 2018 09:07:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8EB3FE01462
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Jun 2018 09:07:08 -0700 (PDT)
Received: by mail-lf0-f42.google.com with SMTP id y20-v6so31429092lfy.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Jun 2018 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M8Ljw3+3B3Ir3YwgctFzD/sTb4KKWWfJwXRMVtc5iJ4=;
	b=lONuAtv91dnspN29nG7XPDMjO72rZbK6L0nrL/nTJE9uCiWp+ERsZZv2bCPiDW7kPZ
	yVBgWSZVk3DDFOlz+kSZ86wKaMlE97++MFtlQjGt7Z4uJv2KLvvrKoNIGKAaUBlacFeE
	zbZoe4ZbwCUJFb/a6CeyakFzZ6OnkdIyBjYLwVpHNezhWl7W/sz+k+NGqObh59BldxJR
	9Bpt8qukclNULh40nRrTwGKXFktztfuy0/4jydI4dcrnE/Ujx7Myr4LLVDD8PrPgkt/P
	QHOO/Fklurvbh2pPH6guZvKSTcE9pBTKFU/uVs3lzUaGzz2f7OpyqiphDjrpyz42AesG
	zihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M8Ljw3+3B3Ir3YwgctFzD/sTb4KKWWfJwXRMVtc5iJ4=;
	b=K8gTOaIYJ8NgJLU0CBWpbh4CAI3lKy7G6l6Tsu1G+PZxKfnD12HRIG2vdkwe//i2ZL
	+NB+gNcgo70arH2x66FTs/goIHZYNM2DA4KH3tXqmWYBE4FEOLJZ7wBlcG8Ufj7SkQQr
	LZ6JG6qTXoxMbE3/jLsUUD/lxEndnS7GqVbswLlw4xMJAYGN2uUuPoXCmB/SjP7q3drd
	q1G7khCNH4JVEDox/eIpMzYEIqpAfxAM5ki4UqP58iu5Ffg6yEn/odg+lusB6cz+8xVv
	55iXe3jMKYGevRb3igucPpawfGT82EzZh7iRsxqYipvyeXtk4lyjVTtk4Ox7qKNQmH+A
	DGSg==
X-Gm-Message-State: APt69E3IdiCrS+tTvjqwEcfT/7uEqoYQ3JLrLPe8SmXqueb923JMDMAn
	EmK69tcGS4EgSzfuDnG10InJaaBkL2tK1ckiwaI=
X-Google-Smtp-Source: ADUXVKIX3a7gijVgLR1vubCvX1oz6kkyfCaDQ+JXiWaOHmkawBc+hhbjwmp7ugRTw31o3CjKhLBag8Oe6v3InLoxbW4=
X-Received: by 2002:a19:2101:: with SMTP id
	h1-v6mr11189748lfh.135.1528733227391; 
	Mon, 11 Jun 2018 09:07:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 09:07:06
	-0700 (PDT)
In-Reply-To: <1528499291-7920-1-git-send-email-jpuhlman@mvista.com>
References: <1528499291-7920-1-git-send-email-jpuhlman@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Jun 2018 12:07:06 -0400
Message-ID: <CADkTA4OM+tgcPO=3yPv6FU7p4oYzWC+0vw0jLwXNobR2j9bxGw@mail.gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] lxc: uprev 3.0.1
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
X-List-Received-Date: Mon, 11 Jun 2018 16:07:10 -0000
Content-Type: multipart/alternative; boundary="000000000000f99fdf056e5ff007"

--000000000000f99fdf056e5ff007
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Jun 8, 2018 at 7:08 PM, Jeremy Puhlman <jpuhlman@mvista.com> wrote:

> - Bug fix release
> - Fixes gcc8 build failures
> - Update patch for fuzz issues.
> - remove --disable-python and --disable-lua as they have been removed
>
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>  .../templates-actually-create-DOWNLOAD_TEMP-directory.patch    | 10
> +++++-----
>  recipes-containers/lxc/{lxc_3.0.0.bb => lxc_3.0.1.bb}          |  6
> ++----
>  2 files changed, 7 insertions(+), 9 deletions(-)
>  rename recipes-containers/lxc/{lxc_3.0.0.bb => lxc_3.0.1.bb} (96%)
>
> diff --git a/recipes-containers/lxc/files/templates-actually-
> create-DOWNLOAD_TEMP-directory.patch b/recipes-containers/lxc/
> files/templates-actually-create-DOWNLOAD_TEMP-directory.patch
> index 359f662..44959db 100644
> --- a/recipes-containers/lxc/files/templates-actually-
> create-DOWNLOAD_TEMP-directory.patch
> +++ b/recipes-containers/lxc/files/templates-actually-
> create-DOWNLOAD_TEMP-directory.patch
> @@ -22,12 +22,12 @@ Signed-off-by: Mark Asselstine <
> mark.asselstine@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/templates/lxc-download.in b/templates/lxc-download.in
> -index f875183..5f1138c 100644
> +index 973783b..015a679 100644
>  --- a/templates/lxc-download.in
>  +++ b/templates/lxc-download.in
> -@@ -320,7 +320,7 @@ fi
> - if ! command -V mktemp >/dev/null 2>&1; then
> -   DOWNLOAD_TEMP="${DOWNLOAD_TEMP}/tmp/lxc-download.$$"
> +@@ -323,7 +323,7 @@ elif [ -n "${DOWNLOAD_TEMP}" ]; then
> +   mkdir -p "${DOWNLOAD_TEMP}"
> +   DOWNLOAD_TEMP="$(mktemp -p ${DOWNLOAD_TEMP} -d)"
>   else
>  -  DOWNLOAD_TEMP="${DOWNLOAD_TEMP}$(mktemp -d)"
>  +  DOWNLOAD_TEMP="$(mktemp -p ${DOWNLOAD_TEMP} -d)"
> @@ -35,5 +35,5 @@ index f875183..5f1138c 100644
>
>   # Simply list images
>  --
> -2.7.4
> +2.11.1
>
> diff --git a/recipes-containers/lxc/lxc_3.0.0.bb b/recipes-containers/lxc/
> lxc_3.0.1.bb
> similarity index 96%
> rename from recipes-containers/lxc/lxc_3.0.0.bb
> rename to recipes-containers/lxc/lxc_3.0.1.bb
> index 4f7526b..a77dd09 100644
> --- a/recipes-containers/lxc/lxc_3.0.0.bb
> +++ b/recipes-containers/lxc/lxc_3.0.1.bb
> @@ -47,8 +47,8 @@ SRC_URI = "http://linuxcontainers.org/
> downloads/${BPN}-${PV}.tar.gz \
>         file://lxc-net \
>         "
>
> -SRC_URI[md5sum] = "ca1db4f9dc35df9203a58ab606cdfb7a"
> -SRC_URI[sha256sum] = "6230224c27f050201b372b18a9f39c
> d220ed584899c5f0cf73c6b313dabc8d8a"
> +SRC_URI[md5sum] = "8eb396dde561e5832ba2d505513a1935"
> +SRC_URI[sha256sum] = "45986c49be1c048fa127bd3e7ea1bd
> 3347e25765c008a09a2e4c233151a2d5db"
>
>  S = "${WORKDIR}/${BPN}-${PV}"
>
> @@ -76,8 +76,6 @@ PACKAGECONFIG[templates] = ",,, ${PN}-templates"
>  PACKAGECONFIG[selinux] = "--enable-selinux,--disable-
> selinux,libselinux,libselinux"
>  PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-
> seccomp,libseccomp,libseccomp"
>  PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=$
> {systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
> -PACKAGECONFIG[python] = "--enable-python,--disable-
> python,python3,python3-core"
> -PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua,lua"
>
>  # required by python3 to run setup.py
>  export BUILD_SYS
> --
> 2.6.2
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

--000000000000f99fdf056e5ff007
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged<div><br></div><div>Bruce</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Fri, Jun 8, 2018 at 7:08 PM, =
Jeremy Puhlman <span dir=3D"ltr">&lt;<a href=3D"mailto:jpuhlman@mvista.com"=
 target=3D"_blank">jpuhlman@mvista.com</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">- Bug fix release<br>
- Fixes gcc8 build failures<br>
- Update patch for fuzz issues.<br>
- remove --disable-python and --disable-lua as they have been removed<br>
<br>
Signed-off-by: Jeremy Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista.com">jp=
uhlman@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../templates-actually-create-<wbr>DOWNLOAD_TEMP-directory.patch=C2=
=A0 =C2=A0 | 10 +++++-----<br>
=C2=A0recipes-containers/lxc/{<a href=3D"http://lxc_3.0.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">lxc_3.<wbr>0.0.bb</a> =3D&gt; <a href=3D"http://lxc=
_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">lxc_3.0.1.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++----<br>
=C2=A02 files changed, 7 insertions(+), 9 deletions(-)<br>
=C2=A0rename recipes-containers/lxc/{<a href=3D"http://lxc_3.0.0.bb" rel=3D=
"noreferrer" target=3D"_blank">lxc_3.<wbr>0.0.bb</a> =3D&gt; <a href=3D"htt=
p://lxc_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">lxc_3.0.1.bb</a>} (9=
6%)<br>
<br>
diff --git a/recipes-containers/lxc/<wbr>files/templates-actually-<wbr>crea=
te-DOWNLOAD_TEMP-<wbr>directory.patch b/recipes-containers/lxc/<wbr>files/t=
emplates-actually-<wbr>create-DOWNLOAD_TEMP-<wbr>directory.patch<br>
index 359f662..44959db 100644<br>
--- a/recipes-containers/lxc/<wbr>files/templates-actually-<wbr>create-DOWN=
LOAD_TEMP-<wbr>directory.patch<br>
+++ b/recipes-containers/lxc/<wbr>files/templates-actually-<wbr>create-DOWN=
LOAD_TEMP-<wbr>directory.patch<br>
@@ -22,12 +22,12 @@ Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:ma=
rk.asselstine@windriver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/templates/<a href=3D"http://lxc-download.in" rel=3D"nore=
ferrer" target=3D"_blank">lxc-download.in</a> b/templates/<a href=3D"http:/=
/lxc-download.in" rel=3D"noreferrer" target=3D"_blank">lxc-download.in</a><=
br>
-index f875183..5f1138c 100644<br>
+index 973783b..015a679 100644<br>
=C2=A0--- a/templates/<a href=3D"http://lxc-download.in" rel=3D"noreferrer"=
 target=3D"_blank">lxc-download.in</a><br>
=C2=A0+++ b/templates/<a href=3D"http://lxc-download.in" rel=3D"noreferrer"=
 target=3D"_blank">lxc-download.in</a><br>
-@@ -320,7 +320,7 @@ fi<br>
- if ! command -V mktemp &gt;/dev/null 2&gt;&amp;1; then<br>
-=C2=A0 =C2=A0DOWNLOAD_TEMP=3D&quot;${DOWNLOAD_<wbr>TEMP}/tmp/lxc-download.=
$$&quot;<br>
+@@ -323,7 +323,7 @@ elif [ -n &quot;${DOWNLOAD_TEMP}&quot; ]; then<br>
+=C2=A0 =C2=A0mkdir -p &quot;${DOWNLOAD_TEMP}&quot;<br>
+=C2=A0 =C2=A0DOWNLOAD_TEMP=3D&quot;$(mktemp -p ${DOWNLOAD_TEMP} -d)&quot;<=
br>
=C2=A0 else<br>
=C2=A0-=C2=A0 DOWNLOAD_TEMP=3D&quot;${DOWNLOAD_<wbr>TEMP}$(mktemp -d)&quot;=
<br>
=C2=A0+=C2=A0 DOWNLOAD_TEMP=3D&quot;$(mktemp -p ${DOWNLOAD_TEMP} -d)&quot;<=
br>
@@ -35,5 +35,5 @@ index f875183..5f1138c 100644<br>
<br>
=C2=A0 # Simply list images<br>
=C2=A0-- <br>
-2.7.4<br>
+2.11.1<br>
<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_3.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_<wbr>3.0.0.bb</a> b/recipes-containers/lx=
c/<a href=3D"http://lxc_3.0.1.bb" rel=3D"noreferrer" target=3D"_blank">lxc_=
<wbr>3.0.1.bb</a><br>
similarity index 96%<br>
rename from recipes-containers/lxc/<a href=3D"http://lxc_3.0.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">lxc_3.<wbr>0.0.bb</a><br>
rename to recipes-containers/lxc/<a href=3D"http://lxc_3.0.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">lxc_3.<wbr>0.1.bb</a><br>
index 4f7526b..a77dd09 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_3.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>3.0.0.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_3.0.1.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>3.0.1.bb</a><br>
@@ -47,8 +47,8 @@ SRC_URI =3D &quot;<a href=3D"http://linuxcontainers.org/d=
ownloads/${BPN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://l=
inuxcontainers.org/<wbr>downloads/${BPN}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc-net \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>ca1db4f9dc35df9203a58ab606cdfb<wbr>7a&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>6230224c27f050201b372b18a9f39c<wbr>d220e=
d584899c5f0cf73c6b313dabc<wbr>8d8a&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>8eb396dde561e5832ba2d505513a19<wbr>35&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>45986c49be1c048fa127bd3e7ea1bd<wbr>3347e=
25765c008a09a2e4c233151a2<wbr>d5db&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
<br>
@@ -76,8 +76,6 @@ PACKAGECONFIG[templates] =3D &quot;,,, ${PN}-templates&qu=
ot;<br>
=C2=A0PACKAGECONFIG[selinux] =3D &quot;--enable-selinux,--disable-<wbr>seli=
nux,libselinux,libselinux&quot;<br>
=C2=A0PACKAGECONFIG[seccomp] =3D&quot;--enable-seccomp,--disable-<wbr>secco=
mp,libseccomp,libseccomp&quot;<br>
=C2=A0PACKAGECONFIG[systemd] =3D &quot;--with-systemdsystemunitdir=3D$<wbr>=
{systemd_unitdir}/system/,--<wbr>without-systemdsystemunitdir,<wbr>systemd,=
&quot;<br>
-PACKAGECONFIG[python] =3D &quot;--enable-python,--disable-<wbr>python,pyth=
on3,python3-core&quot;<br>
-PACKAGECONFIG[lua] =3D &quot;--enable-lua,--disable-lua,<wbr>lua,lua&quot;=
<br>
<br>
=C2=A0# required by python3 to run setup.py<br>
=C2=A0export BUILD_SYS<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.6.2<br>
<br>
-- <br>
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

--000000000000f99fdf056e5ff007--
