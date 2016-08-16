Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA890E00EBD; Tue, 16 Aug 2016 12:04:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46348E00EB6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Aug 2016 12:04:26 -0700 (PDT)
Received: by mail-qt0-f196.google.com with SMTP id q11so3569034qtb.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Aug 2016 12:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GIf3BIAmjxkKNAQ7sPFxPa/xf4X2o0agEoIm2+aYdKg=;
	b=wPWgX7yDMF/BT8hPoJvU/mnbhOlPFvT0pTMZuBI+jzI7KWsUjHLqPhNjSZNmctbwD4
	3Dz5H1puzeQNnba426PI7kW+sAG+gUPmR9AF9RnfpyH7k55tisEfcRtbfkvgR4Lz49It
	h2AwuxtMb24Qlxte0y/zbJtmyRIpVQ2waeXq6JpOVzipA6qo7SmEjmCezWaAH7ApjoKd
	OqHqyt0lQSkZ3GMAGmH/ZQNYfuAgCFNN4hcbkNENAMax86B9rQwhELae2fnvgdqoDVxB
	f4Q3iHq+JoSZZRLR0He10FQUO1QIleB6WJ0m7pUbpe2NlsH5Tg7YbABcA125RkXA5/L7
	BF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GIf3BIAmjxkKNAQ7sPFxPa/xf4X2o0agEoIm2+aYdKg=;
	b=S7OEbV4lB2uREM9GU5qQedS5MVaZPHlSR9iXIOPVz/AngmGmlbNEvU22In0mLN667l
	zfeC0RShw/gx1dl0+6DlsxAp4aR9nY5vRQtpkfFylvMQAjsXa/gDqw/0tfv8wkvI3tFj
	qUk7NRMRXaT0bmpC1SB+hpdXA72xlqjiuxUXYpbkynCudztJJOGP5uRNXLs9poPMfLnP
	d08VEXN4XfAUiuGKXvyph1PYcWzZGizx1twZBQ4HmRB9JABC/qo7Q5V2WZ2OZ3l19R9h
	ClLhKVfenBfEHiHy+fExjQVGZ5iS4AuSPoRWC+7/NttxUXT7fSm8D0zvrHmDgAFBP/jS
	Avkw==
X-Gm-Message-State: AEkoouuxjMilY8bmhLtsnaXahWstx9J6mDjTcx3izkfBr5jwFMv2HM5QtQUqe+NyoVf8gMSk65hXkLI7z+8yrw==
X-Received: by 10.237.52.101 with SMTP id w92mr40970260qtd.51.1471374265999;
	Tue, 16 Aug 2016 12:04:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Tue, 16 Aug 2016 12:04:25 -0700 (PDT)
In-Reply-To: <1470765477-29723-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1470765477-29723-1-git-send-email-jkrishnanjanappa@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 16 Aug 2016 15:04:25 -0400
Message-ID: <CADkTA4OxWsXMZuBL9aCwmH2Y_NrMrMJAXdpMYNHTFDDj9SRdvg@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: add missing python modules to execute ovs-test program
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
X-List-Received-Date: Tue, 16 Aug 2016 19:04:28 -0000
Content-Type: multipart/alternative; boundary=94eb2c124a5c74e7e8053a35049a

--94eb2c124a5c74e7e8053a35049a
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Aug 9, 2016 at 1:57 PM, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> ovs-test program requires python-twisted and ovstest python
> modules to execute successfully. The changes fix below
> errors:
>
> -- snip --
> root@qemux86:~# ovs-test
> Traceback (most recent call last):
>   File "/usr/bin/ovs-test", line 31, in <module>
>     import twisted
> ImportError: No module named twisted
> root@qemux86:~# ovs-test
> Traceback (most recent call last):
>   File "/usr/bin/ovs-test", line 33, in <module>
>     import ovstest.args as args
> ImportError: No module named ovstest.args
> root@qemux86:~#
> -- snip --
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  recipes-networking/openvswitch/openvswitch.inc | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch.inc
> b/recipes-networking/openvswitch/openvswitch.inc
> index fc515e9..3c70703 100644
> --- a/recipes-networking/openvswitch/openvswitch.inc
> +++ b/recipes-networking/openvswitch/openvswitch.inc
> @@ -15,7 +15,7 @@ DEPENDS += "bridge-utils openssl python perl"
>
>  RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
>         python perl perl-module-strict ${PN}-switch \
> -        bash"
> +        bash python-twisted"
>  RDEPENDS_${PN}-testcontroller = "${PN} lsb ${PN}-pki"
>  RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
>  RDEPENDS_${PN}-pki = "${PN}"
> @@ -69,7 +69,8 @@ FILES_${PN}-switch = "\
>  FILES_${PN} += "${datadir}/ovsdbmonitor"
>  FILES_${PN} += "/run"
>
> -inherit autotools update-rc.d systemd
> +FILES_${PN} += "${libdir}/python${PYTHON_BASEVERSION}/"
> +inherit autotools update-rc.d systemd python-dir
>
>  SYSTEMD_PACKAGES = "${PN}-switch"
>  SYSTEMD_SERVICE_${PN}-switch = " \
> @@ -102,6 +103,8 @@ do_install_append() {
>                 ${D}/${systemd_unitdir}/system/openvswitch-nonetwork.
> service
>
>         oe_runmake modules_install INSTALL_MOD_PATH=${D}
> +       install -d ${D}${libdir}/python${PYTHON_BASEVERSION}/site-packages
> +       cp -r ${S}/python/ovstest/ ${D}${libdir}/python${PYTHON_
> BASEVERSION}/site-packages/
>  }
>
>  pkg_postinst_${PN}-pki () {
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

--94eb2c124a5c74e7e8053a35049a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, Aug 9, 2016 at 1:57 PM,=
 Jagadeesh Krishnanjanappa <span dir=3D"ltr">&lt;<a href=3D"mailto:jkrishna=
njanappa@mvista.com" target=3D"_blank">jkrishnanjanappa@mvista.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">ovs-test program requires p=
ython-twisted and ovstest python<br>
modules to execute successfully. The changes fix below<br>
errors:<br>
<br>
-- snip --<br>
root@qemux86:~# ovs-test<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/usr/bin/ovs-test&quot;, line 31, in &lt;module&gt;<br>
=C2=A0 =C2=A0 import twisted<br>
ImportError: No module named twisted<br>
root@qemux86:~# ovs-test<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/usr/bin/ovs-test&quot;, line 33, in &lt;module&gt;<br>
=C2=A0 =C2=A0 import ovstest.args as args<br>
ImportError: No module named ovstest.args<br>
root@qemux86:~#<br>
-- snip --<br>
<br>
Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishnanjan=
appa@mvista.com">jkrishnanjanappa@mvista.com</a>&gt;<br>
---<br>
=C2=A0recipes-networking/<wbr>openvswitch/openvswitch.inc | 7 +++++--<br>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-networking/<wbr>openvswitch/openvswitch.inc b/recipes-=
networking/<wbr>openvswitch/openvswitch.inc<br>
index fc515e9..3c70703 100644<br>
--- a/recipes-networking/<wbr>openvswitch/openvswitch.inc<br>
+++ b/recipes-networking/<wbr>openvswitch/openvswitch.inc<br>
@@ -15,7 +15,7 @@ DEPENDS +=3D &quot;bridge-utils openssl python perl&quot;=
<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;util-linux-uuidgen util-linux-libuuid coreu=
tils \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 python perl perl-module-strict ${PN}-switch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bash&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bash python-twisted&quot;<br>
=C2=A0RDEPENDS_${PN}-testcontroller =3D &quot;${PN} lsb ${PN}-pki&quot;<br>
=C2=A0RDEPENDS_${PN}-switch =3D &quot;${PN} openssl procps util-linux-uuidg=
en&quot;<br>
=C2=A0RDEPENDS_${PN}-pki =3D &quot;${PN}&quot;<br>
@@ -69,7 +69,8 @@ FILES_${PN}-switch =3D &quot;\<br>
=C2=A0FILES_${PN} +=3D &quot;${datadir}/ovsdbmonitor&quot;<br>
=C2=A0FILES_${PN} +=3D &quot;/run&quot;<br>
<br>
-inherit autotools update-rc.d systemd<br>
+FILES_${PN} +=3D &quot;${libdir}/python${PYTHON_<wbr>BASEVERSION}/&quot;<b=
r>
+inherit autotools update-rc.d systemd python-dir<br>
<br>
=C2=A0SYSTEMD_PACKAGES =3D &quot;${PN}-switch&quot;<br>
=C2=A0SYSTEMD_SERVICE_${PN}-switch =3D &quot; \<br>
@@ -102,6 +103,8 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}/${systemd_unit=
dir}/<wbr>system/openvswitch-nonetwork.<wbr>service<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake modules_install INSTALL_MOD_PATH=3D$=
{D}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${libdir}/python${PYTHON_<wbr>BA=
SEVERSION}/site-packages<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${S}/python/ovstest/ ${D}${libdir}/python=
${PYTHON_<wbr>BASEVERSION}/site-packages/<br>
=C2=A0}<br>
<br>
=C2=A0pkg_postinst_${PN}-pki () {<br>
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

--94eb2c124a5c74e7e8053a35049a--
