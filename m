Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4441DE0083D; Tue, 21 Jun 2016 06:40:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA95CE00708
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Jun 2016 06:40:32 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id b136so2999736qkg.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 Jun 2016 06:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Xp6x+FGp1cl0LCcVehWbgW8RTEvQub4ry9Q1yAdFPYE=;
	b=hWc2TT2Na99QC75+BiBxO841nN7AgqFL+EozmWMZeIShYszC6RyyAzrkWPmNjI/cto
	dZmWalKSpsssOd/jo0vhAzcrVXxWDoG/Qy4iSoKIg17qv/sMJH7Qz8JkZNp9oxaQeOh7
	TJrq59voWYiNZiE1WAvMpkEt38DVk+Or0B1qZNZGHvpfN/WjDsb6vu/ma2pqFnL8DWbi
	NcLndQlP+jcVeuRyH85wumhbNsNZKwRiBaN22HEyd+pCfbG+v26FJJm/qHXNo1cm9p/7
	ea2AwumOOdrMvs5Ki6PVQO+QAaxSeQtaQHy0zzGy8EJ3S9PEw/Y4dYZtqnBrCsWRbVUb
	Tstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Xp6x+FGp1cl0LCcVehWbgW8RTEvQub4ry9Q1yAdFPYE=;
	b=E4JIBQGpDF8UQbUyf8l60XlJNI1bJi8QgbzZdCetcCYeSmn7A6VZRNo7edU+uNttvo
	IJ0qrWyUwvgl6JC7Sem4qLz+cgfvHfMyGzluOFRg8cc0zPHDwKuEFZAwugm7Kko+jVT1
	3CyEFAgcFeGCGfQyYon0kp2Zb5o2sENdqEhmH09QHP7RWBtn9vKlZfraj9jAqYEpJgUo
	Z37hNPEXjCdzwiyjclvOhcdfDYzANH7+Fe0lgL3r0G803Hf+z2zNjS8gv3Og4A1tEqPb
	6hfPY5gquqeaGmavmm2+EGJdsZVE1N3KaJ8HB81yRO4ZxQGJt3ier9JCXEjwfaAVNyxt
	gqrw==
X-Gm-Message-State: ALyK8tLA7oFQhGDorUnAApPW6LF6f9OUmSntnFkpQGw9TTA/ZZQiwtk85mXTySLUAtodylQ/X1f8Wbk0/moW/g==
X-Received: by 10.200.48.147 with SMTP id v19mr30300067qta.68.1466516432293;
	Tue, 21 Jun 2016 06:40:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.52.184 with HTTP; Tue, 21 Jun 2016 06:40:31 -0700 (PDT)
In-Reply-To: <1466461316-23791-1-git-send-email-collin.richards@ni.com>
References: <1466461316-23791-1-git-send-email-collin.richards@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 21 Jun 2016 09:40:31 -0400
Message-ID: <CADkTA4MGKCABesGiMNSjZYy4-bRoKY7X95T3qBDBgg3QwP-FhA@mail.gmail.com>
To: Collin Richards <collin.richards@ni.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] python-salttesting: initial version
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
X-List-Received-Date: Tue, 21 Jun 2016 13:40:35 -0000
Content-Type: multipart/alternative; boundary=001a1143a83e0115450535c9f7a6

--001a1143a83e0115450535c9f7a6
Content-Type: text/plain; charset=UTF-8

merged both patches in the series.

Bruce

On Mon, Jun 20, 2016 at 6:21 PM, Collin Richards <collin.richards@ni.com>
wrote:

> This package provides testing tools used by the salt project.
>
> Signed-off-by: Collin Richards <collin.richards@ni.com>
> Natinst-ReviewBoard-ID: 142234
> ---
>  .../python/python-salttesting_2015.2.16.bb           | 20
> ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-openstack/recipes-devtools/python/
> python-salttesting_2015.2.16.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/
> python-salttesting_2015.2.16.bb b/meta-openstack/recipes-devtools/python/
> python-salttesting_2015.2.16.bb
> new file mode 100644
> index 0000000..78ad879
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/
> python-salttesting_2015.2.16.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Common testing tools used in the Salt Stack projects"
> +HOMEPAGE = "https://github.com/saltstack/salt-testing"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f36f1e9e3e30f90180efdf7e40d943e5"
> +SRCNAME = "salt-testing"
> +
> +SRC_URI = "
> https://github.com/saltstack/salt-testing/archive/v${PV}.tar.gz;downloadfilename=salt-testing-v${PV}.tar.gz
> "
> +SRC_URI[md5sum] = "8ca55a796e9ad7ba72bc143043753ccf"
> +SRC_URI[sha256sum] =
> "0ef4be6a8a9b505ae1c328394dfad50493674af6100c7e2c220f374533d86edc"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +RDEPENDS_${PN} = "\
> +                  python-mock \
> +                  python-unittest \
> +"
> +
> +inherit setuptools
> +
> --
> 1.9.1
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

--001a1143a83e0115450535c9f7a6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged both patches in the series.<div><br></div><div>Bruc=
e</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On M=
on, Jun 20, 2016 at 6:21 PM, Collin Richards <span dir=3D"ltr">&lt;<a href=
=3D"mailto:collin.richards@ni.com" target=3D"_blank">collin.richards@ni.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This package provi=
des testing tools used by the salt project.<br>
<br>
Signed-off-by: Collin Richards &lt;<a href=3D"mailto:collin.richards@ni.com=
">collin.richards@ni.com</a>&gt;<br>
Natinst-ReviewBoard-ID: 142234<br>
---<br>
=C2=A0.../python/<a href=3D"http://python-salttesting_2015.2.16.bb" rel=3D"=
noreferrer" target=3D"_blank">python-salttesting_2015.2.16.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 ++++++++++++++++++++<br>
=C2=A01 file changed, 20 insertions(+)<br>
=C2=A0create mode 100644 meta-openstack/recipes-devtools/python/<a href=3D"=
http://python-salttesting_2015.2.16.bb" rel=3D"noreferrer" target=3D"_blank=
">python-salttesting_2015.2.16.bb</a><br>
<br>
diff --git a/meta-openstack/recipes-devtools/python/<a href=3D"http://pytho=
n-salttesting_2015.2.16.bb" rel=3D"noreferrer" target=3D"_blank">python-sal=
ttesting_2015.2.16.bb</a> b/meta-openstack/recipes-devtools/python/<a href=
=3D"http://python-salttesting_2015.2.16.bb" rel=3D"noreferrer" target=3D"_b=
lank">python-salttesting_2015.2.16.bb</a><br>
new file mode 100644<br>
index 0000000..78ad879<br>
--- /dev/null<br>
+++ b/meta-openstack/recipes-devtools/python/<a href=3D"http://python-saltt=
esting_2015.2.16.bb" rel=3D"noreferrer" target=3D"_blank">python-salttestin=
g_2015.2.16.bb</a><br>
@@ -0,0 +1,20 @@<br>
+SUMMARY =3D &quot;Common testing tools used in the Salt Stack projects&quo=
t;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/saltstack/salt-testing" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/saltstack/salt-testi=
ng</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Df36f1e9e3e30f90180efdf7e40=
d943e5&quot;<br>
+SRCNAME =3D &quot;salt-testing&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/saltstack/salt-testing/arc=
hive/v${PV}.tar.gz;downloadfilename=3Dsalt-testing-v${PV}.tar.gz" rel=3D"no=
referrer" target=3D"_blank">https://github.com/saltstack/salt-testing/archi=
ve/v${PV}.tar.gz;downloadfilename=3Dsalt-testing-v${PV}.tar.gz</a>&quot;<br=
>
+SRC_URI[md5sum] =3D &quot;8ca55a796e9ad7ba72bc143043753ccf&quot;<br>
+SRC_URI[sha256sum] =3D &quot;0ef4be6a8a9b505ae1c328394dfad50493674af6100c7=
e2c220f374533d86edc&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/${SRCNAME}-${PV}&quot;<br>
+<br>
+RDEPENDS_${PN} =3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-mock=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python-unit=
test \<br>
+&quot;<br>
+<br>
+inherit setuptools<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a1143a83e0115450535c9f7a6--
