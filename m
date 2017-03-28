Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45377E00B01; Tue, 28 Mar 2017 06:10:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.193 listed in list.dnswl.org]
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08E1BE00A51
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Mar 2017 06:10:41 -0700 (PDT)
Received: by mail-qt0-f193.google.com with SMTP id r45so11956431qte.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 Mar 2017 06:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q0AhuMOJQblIu9uTrASgVQN22A3zl6rIk2qn5Y9uT+o=;
	b=WJKzDNT/OhN5i6VtLfB/oUt+hESe+ZvrRqRlhSEHpP8ed/4fRy+gOvIIAfkF5XIvqy
	CAcazA6GGQ12MjqyS1YcKb8akdv2BAZ0UOb4my6Mm8XCKReaA01JIWiwCYEHv8nXqOB4
	gqx+fLnbAR2EN4PJvdzLN0NIQVnYcdnDITV0OHtV9mHCiSYiacwjQSThfXOcvKUeYaRB
	5RhJLQeiQJ5o5In6SDkLwpn722MuMcMibTjSwfC/2DwA0BdpRjY+SQ7ZVhXSpj2rWTph
	LJdeS2MQjfkS/Kw8Ua/hYcOOYQv+CMswiuRLIo9p81JsbqDWBWigm6htLLXCgSpuu3CZ
	ISzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q0AhuMOJQblIu9uTrASgVQN22A3zl6rIk2qn5Y9uT+o=;
	b=QDWfD3x9uuqiJc2lOlE0BC+wjHgtDzey022DYURwzzYw5kBH3Mp0zudAbYCiAfDJmU
	wQRTD1snC192tWGVlYtKIA/moeyuzRJqFv/TRc8ZG/x7in3RShvZc2hZtRcuWRCRdx5A
	7CuddjpR9xV1D9Z0P7mi6Zyi3FKxYyOaLBIRT/QVatWhJ+z1bftp3F+NrLTzGEXLwtF3
	PwdfltSOFLebi5BcphIpxCymq2WGsvd9zPhdjRgxVaTjk4sr4Mr1DgxfsDm3OOYU+7iW
	eNujDSZM9AWs8ya4FLOxWr2s7tKVA8hyAc5mPydevR5ou0LJqF5LdgPZkS1yjPqr/52b
	WMcg==
X-Gm-Message-State: AFeK/H1OHkTkJjXK2TuwHvuaSIFkdZXuypmLA7BLEn2pAHX1l2KJd4/M5R8C5l/LDjTivh/4/wLo8/lZjiDpMg==
X-Received: by 10.200.54.136 with SMTP id a8mr28059627qtc.185.1490706640286;
	Tue, 28 Mar 2017 06:10:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Tue, 28 Mar 2017 06:10:39 -0700 (PDT)
In-Reply-To: <20170327064330.20815-1-jonatan.palsson@pelagicore.com>
References: <20170327064330.20815-1-jonatan.palsson@pelagicore.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Mar 2017 09:10:39 -0400
Message-ID: <CADkTA4M2MhaKTWdd2_JEsjP+F+aqzRYb0BLac-qoEsnCoWLGqw@mail.gmail.com>
To: =?UTF-8?Q?Jonatan_P=C3=A5lsson?= <jonatan.palsson@pelagicore.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: Add lua to PACKAGECONFIG
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
X-List-Received-Date: Tue, 28 Mar 2017 13:10:51 -0000
Content-Type: multipart/alternative; boundary=001a1142833cc289cc054bca2fe3

--001a1142833cc289cc054bca2fe3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

merged.

Bruce

On Mon, Mar 27, 2017 at 2:43 AM, Jonatan P=C3=A5lsson <
jonatan.palsson@pelagicore.com> wrote:

> Lua support is automatically enabled when configuring LXC if lua is
> available in the sysroot. The packaging step will fail since the lua
> related files are not in FILES.
>
> This patch explicitly enables/disables lua support using PACKAGECONFIG,
> and also adds lua-related files to FILES.
>
> Signed-off-by: Jonatan P=C3=A5lsson <jonatan.palsson@pelagicore.com>
> ---
>  recipes-containers/lxc/lxc_2.0.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc=
/
> lxc_2.0.0.bb
> index 250ac4d..c98d1a7 100644
> --- a/recipes-containers/lxc/lxc_2.0.0.bb
> +++ b/recipes-containers/lxc/lxc_2.0.0.bb
> @@ -65,6 +65,7 @@ PACKAGECONFIG[templates] =3D ",,, ${PN}-templates"
>  PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-
> selinux,libselinux,libselinux"
>  PACKAGECONFIG[seccomp] =3D"--enable-seccomp,--disable-
> seccomp,libseccomp,libseccomp"
>  PACKAGECONFIG[python] =3D "--enable-python,--disable-
> python,python3,python3-core"
> +PACKAGECONFIG[lua] =3D "--enable-lua,--disable-lua,lua,lua"
>
>  # required by python3 to run setup.py
>  export BUILD_SYS
> @@ -86,6 +87,9 @@ FILES_${PN}-doc =3D "${mandir} ${infodir}"
>  # For LXC the docdir only contains example configuration files and shoul=
d
> be included in the lxc package
>  FILES_${PN} +=3D "${docdir}"
>  FILES_${PN} +=3D "${libdir}/python3*"
> +FILES_${PN} +=3D "${datadir}/lua/*"
> +FILES_${PN} +=3D "${libdir}/lua/lxc/*"
> +FILES_${PN}-dbg +=3D "${libdir}/lua/lxc/.debug"
>  FILES_${PN}-dbg +=3D "${libexecdir}/lxc/.debug ${libexecdir}/lxc/hooks/.
> debug"
>  PACKAGES =3D+ "${PN}-templates ${PN}-setup ${PN}-networking"
>  FILES_${PN}-templates +=3D "${datadir}/lxc/templates"
> --
> 2.10.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1142833cc289cc054bca2fe3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Mon, Mar 27, 2017 at 2:43 AM, J=
onatan P=C3=A5lsson <span dir=3D"ltr">&lt;<a href=3D"mailto:jonatan.palsson=
@pelagicore.com" target=3D"_blank">jonatan.palsson@pelagicore.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">Lua support is automatically=
 enabled when configuring LXC if lua is<br>
available in the sysroot. The packaging step will fail since the lua<br>
related files are not in FILES.<br>
<br>
This patch explicitly enables/disables lua support using PACKAGECONFIG,<br>
and also adds lua-related files to FILES.<br>
<br>
Signed-off-by: Jonatan P=C3=A5lsson &lt;<a href=3D"mailto:jonatan.palsson@p=
elagicore.com">jonatan.palsson@pelagicore.<wbr>com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.<wbr>0.0.bb</a> | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a> b/recipes-containers/lx=
c/<a href=3D"http://lxc_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">lxc_=
<wbr>2.0.0.bb</a><br>
index 250ac4d..c98d1a7 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_<wbr>2.0.0.bb</a><br>
@@ -65,6 +65,7 @@ PACKAGECONFIG[templates] =3D &quot;,,, ${PN}-templates&qu=
ot;<br>
=C2=A0PACKAGECONFIG[selinux] =3D &quot;--enable-selinux,--disable-<wbr>seli=
nux,libselinux,libselinux&quot;<br>
=C2=A0PACKAGECONFIG[seccomp] =3D&quot;--enable-seccomp,--disable-<wbr>secco=
mp,libseccomp,libseccomp&quot;<br>
=C2=A0PACKAGECONFIG[python] =3D &quot;--enable-python,--disable-<wbr>python=
,python3,python3-core&quot;<br>
+PACKAGECONFIG[lua] =3D &quot;--enable-lua,--disable-lua,<wbr>lua,lua&quot;=
<br>
<br>
=C2=A0# required by python3 to run setup.py<br>
=C2=A0export BUILD_SYS<br>
@@ -86,6 +87,9 @@ FILES_${PN}-doc =3D &quot;${mandir} ${infodir}&quot;<br>
=C2=A0# For LXC the docdir only contains example configuration files and sh=
ould be included in the lxc package<br>
=C2=A0FILES_${PN} +=3D &quot;${docdir}&quot;<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/python3*&quot;<br>
+FILES_${PN} +=3D &quot;${datadir}/lua/*&quot;<br>
+FILES_${PN} +=3D &quot;${libdir}/lua/lxc/*&quot;<br>
+FILES_${PN}-dbg +=3D &quot;${libdir}/lua/lxc/.debug&quot;<br>
=C2=A0FILES_${PN}-dbg +=3D &quot;${libexecdir}/lxc/.debug ${libexecdir}/lxc=
/hooks/.<wbr>debug&quot;<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-templates ${PN}-setup ${PN}-networking&quot=
;<br>
=C2=A0FILES_${PN}-templates +=3D &quot;${datadir}/lxc/templates&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.10.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div>

--001a1142833cc289cc054bca2fe3--
