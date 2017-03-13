Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D1F2E00AA5; Mon, 13 Mar 2017 06:28:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.195 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A8DBE00ADB
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Mar 2017 06:28:03 -0700 (PDT)
Received: by mail-qt0-f195.google.com with SMTP id n37so6135580qtb.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Mar 2017 06:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xwbGTCjIrYL2ECIDQkdrhdAuQwpcD5IruCNRlXzn5TY=;
	b=Pe+v+5r0p0XjNfj0lNgi7MOkmrtZpYP0o90+Zw7L4kR6i9XHIPe4waJZw+2jMj+iUo
	o5Hp9Jk+ZEXisQd2EMtCL9zdCKOM/vhuMY4RhQP+p04KoxjpnuHtnr2JGKtKqoHooEwv
	kMqwdHZPWV6EmJOI1xN4x/DWgFwdI3aZyVXbAuq/9fb+NgAk0l2nnDRqXcYqCC247a3g
	YoK1a7hz3S4sjt0bsvaorolIjE0L1vH2H550dy2ug70IcCLcum1E+peK14BJaqwTzBn7
	v5cNwKAzxozO0wGk3ZnbxRLb8Ila6E5v7EzAnm8TYbFXI0hRp6Lq3UoNZZhrGzOWPRyO
	UhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xwbGTCjIrYL2ECIDQkdrhdAuQwpcD5IruCNRlXzn5TY=;
	b=d3FtqHtvna3TlYxL6CKdGSxoHPswnjAWqgBWJHSVn13mPHJ6C0h0TKbp8vc2qS6pWu
	WVWL+UXVeqJU1WYbYOCsyAbsyCEd4zBeClxV4adhseXIrGxigcAfu8HSdpRkx2BGhp8N
	l2JMun0Tj+k6TfpXK/XWbstsbGUYMggpAvxAyJI0D71iRaqsaKOzuDt+7QzoElmbkTks
	RUfV56/qNfgINN/oUKZVxMANzoRswG3Qy7L3nBL5icmveDBGogK6hiecHxUg1GvQyHEw
	eRfZyj8Enf+eYYFsKJNb2/AxwuoSlHwViP1Udg2TLH/x0efp2GqZxlv8JecCkiAUeXGO
	qZFg==
X-Gm-Message-State: AMke39lKy7D0kyKm+JHhREkueD5LJ8Xsu+ah0sgqeGYED2T/l/5ftnxz1Mq9SUqfZmgYMJddcjIV6o3a288HbA==
X-Received: by 10.237.49.36 with SMTP id 33mr31909609qtg.117.1489411682369;
	Mon, 13 Mar 2017 06:28:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.132.68 with HTTP; Mon, 13 Mar 2017 06:28:01 -0700 (PDT)
In-Reply-To: <20170313073917.348626-1-fupan.li@windriver.com>
References: <20170313073917.348626-1-fupan.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 13 Mar 2017 09:28:01 -0400
Message-ID: <CADkTA4PEh5P7YgsdgVMJQMH2oFOE7OB+EMfbRTaMoFp7BGiHtQ@mail.gmail.com>
To: fupan <fupan.li@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] qpid: fix the wrong python dir issue
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
X-List-Received-Date: Mon, 13 Mar 2017 13:28:15 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c7a104089b1054a9cae15

--94eb2c0c7a104089b1054a9cae15
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Mon, Mar 13, 2017 at 3:39 AM, <fupan.li@windriver.com> wrote:

> From: fli <fupan.li@windriver.com>
>
> qpid used the wrong python path and thus cannot
> package the files installed. This commit will fix
> the following warning issue:
>
> WARNING: QA Issue: qpid: Files/directories were installed but not shipped
> in any package:
>   /usr/lib/python2.7/site-packages/qmfengine.py
>   /usr/lib/python2.7/site-packages/qmf.py
>   /usr/lib/python2.7/site-packages/_qmfengine.so
>   /usr/lib/python2.7/site-packages/_qmfengine.la
>   /usr/lib/python2.7/site-packages/qmfengine.pyo
>   /usr/lib/python2.7/site-packages/qmf.pyo
>   /usr/lib/python2.7/site-packages/cqpid.py
>   /usr/lib/python2.7/site-packages/_cqpid.so
>   /usr/lib/python2.7/site-packages/_cqpid.la
>   /usr/lib/python2.7/site-packages/cqpid.pyo
>   /usr/lib/python2.7/site-packages/qmf2.py
>   /usr/lib/python2.7/site-packages/cqmf2.py
>   /usr/lib/python2.7/site-packages/_cqmf2.so
>   /usr/lib/python2.7/site-packages/_cqmf2.la
>   /usr/lib/python2.7/site-packages/qmf2.pyo
>   /usr/lib/python2.7/site-packages/cqmf2.pyo
>   /usr/lib/python2.7/site-packages/qmfgen
>   /usr/lib/python2.7/site-packages/qmfgen/__init__.py
>   /usr/lib/python2.7/site-packages/qmfgen/generate.py
>   /usr/lib/python2.7/site-packages/qmfgen/schema.py
>   /usr/lib/python2.7/site-packages/qmfgen/management-types.xml
>   /usr/lib/python2.7/site-packages/qmfgen/__init__.pyo
>   /usr/lib/python2.7/site-packages/qmfgen/generate.pyo
>   /usr/lib/python2.7/site-packages/qmfgen/schema.pyo
>   /usr/lib/python2.7/site-packages/qmfgen/templates
>   /usr/lib/python2.7/site-packages/qmfgen/templates/Args.h
>   /usr/lib/python2.7/site-packages/qmfgen/templates/Class.cpp
>   /usr/lib/python2.7/site-packages/qmfgen/templates/Class.h
>   /usr/lib/python2.7/site-packages/qmfgen/templates/CMakeLists.cmake
>   /usr/lib/python2.7/site-packages/qmfgen/templates/Event.cpp
>   /usr/lib/python2.7/site-packages/qmfgen/templates/Event.h
>   /usr/lib/python2.7/site-packages/qmfgen/templates/Makefile.mk
>   /usr/lib/python2.7/site-packages/qmfgen/templates/Package.cpp
>   /usr/lib/python2.7/site-packages/qmfgen/templates/Package.h
>   /usr/lib/python2.7/site-packages/qmfgen/templates/V2Package.cpp
>   /usr/lib/python2.7/site-packages/qmfgen/templates/V2Package.h
> Please set FILES such that these items are packaged. Alternatively if they
> are unneeded, avoid installing them or delete them within do_install.
> qpid: 36 installed and not shipped files. [installed-vs-shipped]
>
> Signed-off-by: fli <fupan.li@windriver.com>
> ---
>  meta-openstack/recipes-extended/qpid/qpid_0.20.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
> b/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
> index 5e6ae2d..b76f76d 100644
> --- a/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
> +++ b/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
> @@ -27,7 +27,10 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_
> DIR}/perl/${@get_perl_version
>  export PERL="${STAGING_BINDIR}/perl"
>
>  EXTRA_OECONF += " --without-help2man SASL_PASSWD=/usr/sbin/saslpasswd2"
> -EXTRA_OEMAKE += " CPPFLAGS=-Wno-unused-function "
> +EXTRA_OEMAKE += " CPPFLAGS=-Wno-unused-function \
> +        pyexecdir=${PYTHON_SITEPACKAGES_DIR} \
> +        pythondir=${PYTHON_SITEPACKAGES_DIR} \
> +"
>
>  do_install_append() {
>       install -d ${D}${sysconfdir}/init.d
> --
> 2.11.0
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

--94eb2c0c7a104089b1054a9cae15
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>merged.<br><br></div>Bruce<br></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Mon, Mar 13, 2017 at 3:39 AM,  =
<span dir=3D"ltr">&lt;<a href=3D"mailto:fupan.li@windriver.com" target=3D"_=
blank">fupan.li@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">From: fli &lt;<a href=3D"mailto:fupan.li@windriver.com">fupan.li=
@windriver.com</a>&gt;<br>
<br>
qpid used the wrong python path and thus cannot<br>
package the files installed. This commit will fix<br>
the following warning issue:<br>
<br>
WARNING: QA Issue: qpid: Files/directories were installed but not shipped i=
n any package:<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfengine.py<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmf.py<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/_qmfengine.so<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/_<a href=3D"http://qmfengine.l=
a" rel=3D"noreferrer" target=3D"_blank">qmfengine.la</a><br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfengine.pyo<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmf.pyo<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/cqpid.py<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/_cqpid.so<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/_<a href=3D"http://cqpid.la" r=
el=3D"noreferrer" target=3D"_blank">cqpid.la</a><br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/cqpid.pyo<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmf2.py<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/cqmf2.py<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/_cqmf2.so<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/_<a href=3D"http://cqmf2.la" r=
el=3D"noreferrer" target=3D"_blank">cqmf2.la</a><br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmf2.pyo<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/cqmf2.pyo<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/__init__.py<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/generate.py<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/schema.py<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/management-<wbr>types.x=
ml<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/__init__.pyo<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/generate.pyo<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/schema.pyo<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/templates<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/templates/<wbr>Args.h<b=
r>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/templates/<wbr>Class.cp=
p<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/templates/<wbr>Class.h<=
br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/templates/<wbr>CMakeLis=
ts.cmake<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/templates/<wbr>Event.cp=
p<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/templates/<wbr>Event.h<=
br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/templates/<wbr>Makefile=
.mk<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/templates/<wbr>Package.=
cpp<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/templates/<wbr>Package.=
h<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/templates/<wbr>V2Packag=
e.cpp<br>
=C2=A0 /usr/lib/python2.7/site-<wbr>packages/qmfgen/templates/<wbr>V2Packag=
e.h<br>
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.<br>
qpid: 36 installed and not shipped files. [installed-vs-shipped]<br>
<br>
Signed-off-by: fli &lt;<a href=3D"mailto:fupan.li@windriver.com">fupan.li@w=
indriver.com</a>&gt;<br>
---<br>
=C2=A0meta-openstack/recipes-<wbr>extended/qpid/<a href=3D"http://qpid_0.20=
.bb" rel=3D"noreferrer" target=3D"_blank">qpid_0.20.bb</a> | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-openstack/recipes-<wbr>extended/qpid/<a href=3D"http://qp=
id_0.20.bb" rel=3D"noreferrer" target=3D"_blank">qpid_0.20.bb</a> b/meta-op=
enstack/recipes-<wbr>extended/qpid/<a href=3D"http://qpid_0.20.bb" rel=3D"n=
oreferrer" target=3D"_blank">qpid_0.20.bb</a><br>
index 5e6ae2d..b76f76d 100644<br>
--- a/meta-openstack/recipes-<wbr>extended/qpid/<a href=3D"http://qpid_0.20=
.bb" rel=3D"noreferrer" target=3D"_blank">qpid_0.20.bb</a><br>
+++ b/meta-openstack/recipes-<wbr>extended/qpid/<a href=3D"http://qpid_0.20=
.bb" rel=3D"noreferrer" target=3D"_blank">qpid_0.20.bb</a><br>
@@ -27,7 +27,10 @@ export PERL_ARCHLIB =3D &quot;${STAGING_LIBDIR}${PERL_OW=
N_<wbr>DIR}/perl/${@get_perl_version<br>
=C2=A0export PERL=3D&quot;${STAGING_BINDIR}/perl&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot; --without-help2man SASL_PASSWD=3D/usr/sbin/<=
wbr>saslpasswd2&quot;<br>
-EXTRA_OEMAKE +=3D &quot; CPPFLAGS=3D-Wno-unused-function &quot;<br>
+EXTRA_OEMAKE +=3D &quot; CPPFLAGS=3D-Wno-unused-function \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pyexecdir=3D${PYTHON_<wbr>SITEPACKAGES_DIR} \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pythondir=3D${PYTHON_<wbr>SITEPACKAGES_DIR} \<=
br>
+&quot;<br>
<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/init.d<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
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

--94eb2c0c7a104089b1054a9cae15--
