Return-Path: <yan.yankovskyi@globallogic.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3D2EE00D17; Mon,  6 Nov 2017 06:24:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.68 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03827E00D03
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Nov 2017 06:24:06 -0800 (PST)
Received: by mail-wm0-f68.google.com with SMTP id p75so14161985wmg.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 Nov 2017 06:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=fsWlOY64UH+vifa0gVovZBQZRz9WNGcw0wZt/UVBP2c=;
	b=Ieo/ifbSMYMOD/UDbSL7TaDHhRWA+UMKNKoyOqwagPLDemmwmPEc+KxJwbvHjuI3ZT
	tUyp44XMiWdzBPORhJfSZf3NfIOvHCCxtCsBED4XOLG4Jib9nxnmare++RmufgMk6xtR
	ncyZzcWJCzamSCj3qquB4i/d5GEU4YlHH1Evo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=fsWlOY64UH+vifa0gVovZBQZRz9WNGcw0wZt/UVBP2c=;
	b=Y/VgQSpW6PTsmYvN32aQnW5O6xYMoHaUcWgXfnK6ejVrOGl7Kbi23XAssRhzS8qUdJ
	AesK1jEuPweoP2VGAndx+oImi6NU+LhGykLuzFUuUZK7iUtF0RrNtd3RNGmxFT/DO3iH
	cm5L454Aeak+5o0eep5t9vP0bX+OdDOoi+HPKbqLvkxUxdULNHPnieqUR9LjJFTADA9p
	s/iYdTdvM2FjOKpTJZgLaq0rzp3GKpKYs9QMIVqhi5ctYS7JyvN7M21gXn+fI56JFgUw
	EasIOoTp5R8zcjLhzg7NO7STJt6YPFFmIID0n5V/0nNenOaz4rzjDvyyagtQOhfyL8tB
	a+bA==
X-Gm-Message-State: AJaThX74XVk8OG5js/yf3drZJtDw5hKHBY60UECrf2QGXGwUYCKZh55q
	2xHoXqoiVop1ghnyw3Nnf7B1QJd8Ztapdl4UCB+bxyLF
X-Google-Smtp-Source: ABhQp+TGcs2uI9ElDNOtd1GpQqgzBDfRSI8SKFP+jREUkIe8X0nj+tf5XcgomQegJQOIfYV6X25+UReJQa0JWYbm3a4=
X-Received: by 10.28.153.3 with SMTP id b3mr6224298wme.60.1509978245226; Mon,
	06 Nov 2017 06:24:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.182.139 with HTTP; Mon, 6 Nov 2017 06:24:04 -0800 (PST)
From: Yan Yankovskyi <yan.yankovskyi@globallogic.com>
Date: Mon, 6 Nov 2017 15:24:04 +0100
Message-ID: <CAPaNuAsAX0tZORrXY+PGRoPa2g=_Mwou_64PExf9sE8xNw7ybg@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: [PATCH] xen: delete references to xenstored.socket and xenstored_ro.socket in xen.inc
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
X-List-Received-Date: Mon, 06 Nov 2017 14:24:08 -0000
Content-Type: multipart/alternative; boundary="001a114b3d14ed0c38055d51345c"

--001a114b3d14ed0c38055d51345c
Content-Type: text/plain; charset="UTF-8"

These files were removed since the followine patch
http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=976ce01e103fc03bb3336cdbc6c951a709e285fe
and are absent in xen 4.8.0 and further, which leads to
the following error during the Xen build process:
do_package: SYSTEMD_SERVICE_xen-xencommons value xenstored.socket does not
exist

Signed-off-by: Yan Yankovskyi <yan.yankovskyi@globallogic.com>
---
 recipes-extended/xen/xen.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index cb314f8..4d56de9 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -739,8 +739,6 @@ FILES_${PN}-xencommons += "\
     ${systemd_unitdir}/system/xenconsoled.service \
     ${systemd_unitdir}/system/xen-init-dom0.service \
     ${systemd_unitdir}/system/xenstored.service \
-    ${systemd_unitdir}/system/xenstored.socket \
-    ${systemd_unitdir}/system/xenstored_ro.socket \
     ${systemd_unitdir}/system/var-lib-xenstored.mount \
     "

@@ -780,8 +778,6 @@ SYSTEMD_SERVICE_${PN}-xencommons = " \
     xenconsoled.service \
     xen-init-dom0.service \
     xenstored.service \
-    xenstored.socket \
-    xenstored_ro.socket \
     "
 SYSTEMD_SERVICE_${PN}-xendomains = "xendomains.service"

-- 
2.7.4

-- 
Best regards,

Yan Yankovskyi | Associate Software Engineer, Ukraine
GlobalLogic
M  +380.95.049.64.73 <+380950496473>   Skype huandesale

www.globallogic.com

http://www.globallogic.com/email_disclaimer.txt

--001a114b3d14ed0c38055d51345c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">These files were removed since the followine patch<br><a h=
ref=3D"http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;h=3D976ce01e10=
3fc03bb3336cdbc6c951a709e285fe">http://xenbits.xen.org/gitweb/?p=3Dxen.git;=
a=3Dcommit;h=3D976ce01e103fc03bb3336cdbc6c951a709e285fe</a><br>and are abse=
nt in xen 4.8.0 and further, which leads to<br>the following error during t=
he Xen build process:<br>do_package: SYSTEMD_SERVICE_xen-xencommons value x=
enstored.socket does not exist<br><br>Signed-off-by: Yan Yankovskyi &lt;<a =
href=3D"mailto:yan.yankovskyi@globallogic.com">yan.yankovskyi@globallogic.c=
om</a>&gt;<br>---<br>=C2=A0recipes-extended/xen/xen.inc | 4 ----<br>=C2=A01=
 file changed, 4 deletions(-)<br><br>diff --git a/recipes-extended/xen/xen.=
inc b/recipes-extended/xen/xen.inc<br>index cb314f8..4d56de9 100644<br>--- =
a/recipes-extended/xen/xen.inc<br>+++ b/recipes-extended/xen/xen.inc<br>@@ =
-739,8 +739,6 @@ FILES_${PN}-xencommons +=3D &quot;\<br>=C2=A0=C2=A0=C2=A0=
=C2=A0 ${systemd_unitdir}/system/xenconsoled.service \<br>=C2=A0=C2=A0=C2=
=A0=C2=A0 ${systemd_unitdir}/system/xen-init-dom0.service \<br>=C2=A0=C2=A0=
=C2=A0=C2=A0 ${systemd_unitdir}/system/xenstored.service \<br>-=C2=A0=C2=A0=
=C2=A0 ${systemd_unitdir}/system/xenstored.socket \<br>-=C2=A0=C2=A0=C2=A0 =
${systemd_unitdir}/system/xenstored_ro.socket \<br>=C2=A0=C2=A0=C2=A0=C2=A0=
 ${systemd_unitdir}/system/var-lib-xenstored.mount \<br>=C2=A0=C2=A0=C2=A0=
=C2=A0 &quot;<br><br>@@ -780,8 +778,6 @@ SYSTEMD_SERVICE_${PN}-xencommons =
=3D &quot; \<br>=C2=A0=C2=A0=C2=A0=C2=A0 xenconsoled.service \<br>=C2=A0=C2=
=A0=C2=A0=C2=A0 xen-init-dom0.service \<br>=C2=A0=C2=A0=C2=A0=C2=A0 xenstor=
ed.service \<br>-=C2=A0=C2=A0=C2=A0 xenstored.socket \<br>-=C2=A0=C2=A0=C2=
=A0 xenstored_ro.socket \<br>=C2=A0=C2=A0=C2=A0=C2=A0 &quot;<br>=C2=A0SYSTE=
MD_SERVICE_${PN}-xendomains =3D &quot;xendomains.service&quot;<br><br>-- <b=
r>2.7.4<br clear=3D"all"><br>-- <br><div class=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><span><font color=3D"#888888"><div><font siz=
e=3D"-1"><span style=3D"vertical-align:baseline;font-variant:normal;font-st=
yle:normal;font-size:12px;background-color:transparent;text-decoration:none=
;font-family:Arial;font-weight:bold">Best regards,<br></span></font></div><=
div><font size=3D"-1"><span style=3D"vertical-align:baseline;font-variant:n=
ormal;font-style:normal;font-size:12px;background-color:transparent;text-de=
coration:none;font-family:Arial;font-weight:bold"><br></span></font></div><=
div><font size=3D"-1"><span style=3D"vertical-align:baseline;font-variant:n=
ormal;font-style:normal;font-size:12px;background-color:transparent;text-de=
coration:none;font-family:Arial;font-weight:bold">Yan Yankovskyi | Associat=
e Software Engineer</span></font><font size=3D"-1"><span style=3D"vertical-=
align:baseline;font-variant:normal;font-style:normal;font-size:12px;backgro=
und-color:transparent;text-decoration:none;font-family:Arial;font-weight:bo=
ld">, Ukraine</span></font></div><div><font size=3D"-1"><span style=3D"vert=
ical-align:baseline;font-variant:normal;font-style:normal;font-size:12px;ba=
ckground-color:transparent;text-decoration:none;font-family:Arial;font-weig=
ht:normal">GlobalLogic</span><br></font></div><div><font size=3D"-1"></font=
></div><div><font size=3D"-1"><span style=3D"vertical-align:baseline;font-v=
ariant:normal;font-style:normal;font-size:12px;background-color:transparent=
;text-decoration:none;font-family:Arial;font-weight:normal">M=C2=A0 </span>=
</font><font size=3D"-1"><span style=3D"vertical-align:baseline;font-varian=
t:normal;font-style:normal;font-size:12px;background-color:transparent;text=
-decoration:none;font-family:Arial;font-weight:normal"><span><span style=3D=
"vertical-align:baseline;background-color:transparent"><font face=3D"Arial"=
><span style=3D"font-size:12px"><a href=3D"tel:+380950496473" value=3D"+380=
672382740" target=3D"_blank">+380.95.049.64.73</a></span></font></span></sp=
an>=C2=A0=C2=A0 Skype </span></font><span><span style=3D"vertical-align:bas=
eline;background-color:transparent"><font face=3D"Arial"><span style=3D"fon=
t-size:12px"><a>huandesale</a></span></font></span></span></div><div><font =
size=3D"-1"><span style=3D"font-size:12px;font-family:Arial;color:rgb(17,85=
,204);background-color:transparent;font-weight:normal;font-style:normal;fon=
t-variant:normal;text-decoration:underline;vertical-align:baseline"><br></s=
pan></font></div><div><font size=3D"-1"><a href=3D"http://www.globallogic.c=
om/" target=3D"_blank"><span style=3D"font-size:12px;font-family:Arial;colo=
r:rgb(17,85,204);background-color:transparent;font-weight:normal;font-style=
:normal;font-variant:normal;text-decoration:underline;vertical-align:baseli=
ne">www.globallogic.com</span></a><br></font></div><font size=3D"-1"><br><a=
 href=3D"http://www.globallogic.com/email_disclaimer.txt" target=3D"_blank"=
><span style=3D"font-size:11px;font-family:Arial;color:rgb(17,85,204);backg=
round-color:transparent;font-weight:normal;font-style:normal;font-variant:n=
ormal;text-decoration:underline;vertical-align:baseline">http://www.globall=
ogic.com/email_disclaimer.txt</span></a></font></font></span></div></div></=
div></div>
</div>

--001a114b3d14ed0c38055d51345c--
