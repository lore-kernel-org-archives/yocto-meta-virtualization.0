Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CDC57E00A9C; Tue, 21 Nov 2017 12:08:45 -0800 (PST)
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
	*      [209.85.220.169 listed in list.dnswl.org]
	* 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 105A5E006CA
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Nov 2017 12:08:44 -0800 (PST)
Received: by mail-qk0-f169.google.com with SMTP id j202so13784150qke.10
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Nov 2017 12:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y2uIoBnt5zlwh+hxWqcUgQQYrDV3gRvCk9c8xO8eeA4=;
	b=mZVnJJDf3gK6D7XnzCHcH0NiXaG1vis/TnSk0dIXIzZVIqWCDGEkHvf2Z5+JMw4852
	jVCKicJHylUDc4hSatYrLEBiUOEEjLaCOJ0osoCevxjajZqj0dQHDgCZFruIgVeukUfc
	DGVfeBfaEtAPitWd2s5351C5KTPLKhEaSOxYVczaF5JkHyX5i3ytAwUnlN6evu/rOkuX
	BDYj65jZk15HhQXFj5nh0SLOrC8mFVcigwQWjEFN3oerlzLRinBzCVgK5DoI+4GOIbs7
	lRI3VVXWeRcF0fqlTFqEtCFSRJus5zlpE5z/pS5+gHZHHrgd44uu0L9Y4yJBrh1tCuZZ
	FpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y2uIoBnt5zlwh+hxWqcUgQQYrDV3gRvCk9c8xO8eeA4=;
	b=rYReH/+3JH98ewnTDAEIH+vwVMbppZcN6FFl2c+QihBqOXBxtduazpC+bRQLuLAce3
	ykzdXin/EBSHSz1TF6wd+pe4L8CQFYNIMsTsQVtt9Um2G3gtolpPcx8eJVJGVXVFNjON
	Q1Czus89/c1XEPTc2lgBYsRC6/As5wse/xA6uNvZEigqAwNa82J1WGib4pIqF9WqjKOk
	CaciSLBZygSRKMrwKzqkQMacoTCGWmxNpqOua/KMipeKEksGi/ZN6JeDvkEG9xku1R61
	8dxydihKkKPj13I0Of7vRMbUse1snjEsoq2E798SUL/W/x0+kX7owHbGuhhJ+Cklv+bq
	ENSQ==
X-Gm-Message-State: AJaThX6lQKq3d4aur6ufx9BaQP5XmFyJ6mgEuwPj3fFswdDvPPNMJj6+
	wBMImJ72kQ1ERwS/hqoGe/L9odNSRXpoAE1KP6g=
X-Google-Smtp-Source: AGs4zMbU8KDeGhbvDdVjqWWKP6i0W2Y3bCjlniIUPNFRwavy607HQAcz5fgWc+X3CGJcEYjz3m0QSiI0edff9XwCWTM=
X-Received: by 10.55.82.86 with SMTP id g83mr333496qkb.103.1511294924252; Tue,
	21 Nov 2017 12:08:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Tue, 21 Nov 2017 12:08:43 -0800 (PST)
In-Reply-To: <1511194629-31245-1-git-send-email-mark.asselstine@windriver.com>
References: <1511194629-31245-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Nov 2017 15:08:43 -0500
Message-ID: <CADkTA4Okdj45N3hwXWqprZJgJWL=FHRFpZ-sboMNmz3rWUkMpw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH] python-enum-compat: initial version v0.0.2
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
X-List-Received-Date: Tue, 21 Nov 2017 20:08:45 -0000
Content-Type: multipart/alternative; boundary="001a114a7db61c6a7b055e83c5b9"

--001a114a7db61c6a7b055e83c5b9
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Nov 20, 2017 at 11:17 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> This will allow packages with 'enum-compat' in their requirements.txt
> to not complain/error, even though the real dependency is on 'enum34'.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../recipes-devtools/python/python-enum-compat_0.0.2.bb        | 10
> ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-enum-
> compat_0.0.2.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-enum-
> compat_0.0.2.bb b/meta-openstack/recipes-devtools/python/python-enum-
> compat_0.0.2.bb
> new file mode 100644
> index 0000000..3ae7bb4
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-enum-compat_0.0.2.bb
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "Python enum/enum34 compatibility package"
> +HOMEPAGE = "https://github.com/jstasiak/enum-compat"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=
> 0835ade698e0bcf8506ecda2f7b4f302"
> +
> +SRC_URI[md5sum] = "3002940b6620837d0fbc86ec72509be3"
> +SRC_URI[sha256sum] = "939ceff18186a5762ae4db9fa7bfe0
> 17edbd03b66526b798dd8245394c8a4192"
> +
> +inherit setuptools pypi
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

--001a114a7db61c6a7b055e83c5b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Mon, Nov 20, 2017 at 11:17 A=
M, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@=
windriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">This will allow packages with &=
#39;enum-compat&#39; in their requirements.txt<br>
to not complain/error, even though the real dependency is on &#39;enum34&#3=
9;.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python/<a href=3D"http://python-enum-compat_0.0.=
2.bb" rel=3D"noreferrer" target=3D"_blank">py<wbr>thon-enum-compat_0.0.2.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
=C2=A0create mode 100644 meta-openstack/recipes-<wbr>devtools/python/<a hre=
f=3D"http://python-enum-compat_0.0.2.bb" rel=3D"noreferrer" target=3D"_blan=
k">python-enum-<wbr>compat_0.0.2.bb</a><br>
<br>
diff --git a/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://=
python-enum-compat_0.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python-en=
um-<wbr>compat_0.0.2.bb</a> b/meta-openstack/recipes-<wbr>devtools/python/<=
a href=3D"http://python-enum-compat_0.0.2.bb" rel=3D"noreferrer" target=3D"=
_blank">python-enum-<wbr>compat_0.0.2.bb</a><br>
new file mode 100644<br>
index 0000000..3ae7bb4<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-<wbr>devtools/python/<a href=3D"http://python-=
enum-compat_0.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python-enum-<wbr=
>compat_0.0.2.bb</a><br>
@@ -0,0 +1,10 @@<br>
+DESCRIPTION =3D &quot;Python enum/enum34 compatibility package&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/jstasiak/enum-compat" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/jstasiak/<wbr>enum-com=
pat</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/<wbr>MIT;md5=3D<wb=
r>0835ade698e0bcf8506ecda2f7b4f3<wbr>02&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>3002940b6620837d0fbc86ec72509b<wbr>e3&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>939ceff18186a5762ae4db9fa7bfe0<wbr>17edb=
d03b66526b798dd8245394c8a<wbr>4192&quot;<br>
+<br>
+inherit setuptools pypi<br>
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

--001a114a7db61c6a7b055e83c5b9--
