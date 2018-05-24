Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96538E007AD; Thu, 24 May 2018 13:09:32 -0700 (PDT)
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
	*      [209.85.128.181 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2514E006B4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 May 2018 13:09:31 -0700 (PDT)
Received: by mail-wr0-f181.google.com with SMTP id i14-v6so5320924wre.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 May 2018 13:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yxDCpNaIBRDWhISF8IS/OoH1SxR3cqmxxfg52dCRP9c=;
	b=DLMFID5fBRjDfa/EzltrhJaL6oWGrTrWjAAFP2VGBXnQST7Qza9hnvnzP4eudC3Odx
	1J0cGAz/S9QdebyajhEotrcMPELr1aJgMZOepshRoSe6o8XfYdiM45QfGkQPpBkNaG3F
	nOPawpn0WT3I0XUY6xIQVwU4AHvYjMYx8I+ivB+g6Quzk/X5yBOmFKOFUFK9q/0nTQJF
	t6jQYQtrdYN2nBBDP013PmRABTugHeTsz/Bo8fyQShS6c+ejPnYeURCjyYHLDhoWnMpZ
	7+6Q/P4c4VvafMhf/AialhSMjiAvYn2RiP7dx+VszB/UTpL5LvuH2AWPDbAXgPD4PYHz
	LY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yxDCpNaIBRDWhISF8IS/OoH1SxR3cqmxxfg52dCRP9c=;
	b=Y92w/sa3HVucAPXQY1V1AQ3hr5jHyxIKRjsnnbqVEFFDQwDkvj7HjxVh1UQ+UNdfCS
	nRBLH6zyn0A6m8+CAhcsMBOoM421idDwBtndHzZ/7FLQa2LCoYPMbi1dM0R6dOTgvIVI
	+VRvHAjx8AK9M7lIDzs/26Isa4fMY9iFMJMYK2gtow7L6GdWGjpI71ffI7hJFDcIxjdb
	cf1fIDMSoERTHBlGdR9qn1jHTMaBcRHE0AK8SqYQZFk714rplS8bsPzDTnqNDTemRb3b
	Nh2Ml1daJwA4BYoxL2cKYkdwpkCIJnY5MFIBskgrQvViaoct4k8xRgNtcxvHzDhb+6dD
	N0Sw==
X-Gm-Message-State: ALKqPweii93UxuVu146WSf8O+WhpAFx032aw8FJxdyeNZkxwIjGq+K0R
	D8cgx7NLHYuXlPwYAl01AoY+rkhx0BoxVzArhFlR1Q==
X-Google-Smtp-Source: AB8JxZpmBR/bspjMiHAIKauvmOxnIvaJjWF7EKz2CjltniVaSwmQd2cQpfBJG2xqm0mQ8eaVAnQqJdiskEtxZFoRCVk=
X-Received: by 2002:a19:d763:: with SMTP id
	o96-v6mr5127081lfg.89.1527192570673; 
	Thu, 24 May 2018 13:09:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.51.7 with HTTP; Thu, 24 May 2018 13:09:30 -0700 (PDT)
In-Reply-To: <1527188574-8890-1-git-send-email-mark.asselstine@windriver.com>
References: <1527188574-8890-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 24 May 2018 16:09:30 -0400
Message-ID: <CADkTA4Pw1x21T5bBCFPthS0Rp82ZibC4eWjybxaK_mg3Uk=vzw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] cgroup-lite: uprev to v1.15
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
X-List-Received-Date: Thu, 24 May 2018 20:09:32 -0000
Content-Type: multipart/alternative; boundary="000000000000adc463056cf93a16"

--000000000000adc463056cf93a16
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, May 24, 2018 at 3:02 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> Upgrade and make the recipe more systemd "friendly". For the most part
> nobody is going to use this with systemd but in case they do they will
> get a masked and empty services file, as they do with Debian or
> Ubuntu. Otherwise this is a minor update from v1.11.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../{cgroup-lite_1.11.bb => cgroup-lite_1.15.bb}   | 25
> ++++++++++++++++------
>  1 file changed, 18 insertions(+), 7 deletions(-)
>  rename recipes-containers/cgroup-lite/{cgroup-lite_1.11.bb =>
> cgroup-lite_1.15.bb} (54%)
>
> diff --git a/recipes-containers/cgroup-lite/cgroup-lite_1.11.bb
> b/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
> similarity index 54%
> rename from recipes-containers/cgroup-lite/cgroup-lite_1.11.bb
> rename to recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
> index 065d0ea..7b48c3a 100644
> --- a/recipes-containers/cgroup-lite/cgroup-lite_1.11.bb
> +++ b/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
> @@ -1,23 +1,34 @@
>  SECTION = "devel"
>  SUMMARY = "Light-weight package to set up cgroups at system boot."
>  DESCRIPTION =  "Light-weight package to set up cgroups at system boot."
> -HOMEPAGE = "http://packages.ubuntu.com/source/precise/cgroup-lite"
> +HOMEPAGE = "http://packages.ubuntu.com/source/artful/cgroup-lite"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://debian/copyright;md5=
> 5d5da4e0867cf06014f87102154d0102"
> -SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/
> cgroup-lite_1.11.tar.xz"
> +SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/
> cgroup-lite_1.15.tar.xz"
>  SRC_URI += "file://cgroups-init"
> -SRC_URI[md5sum] = "b20976194ee8fdb61e6b55281fb6ead4"
> -SRC_URI[sha256sum] = "a79ab9ae6fb3ff3ce0aa5539b055c0
> 379eaffdc6c5f003af4010fcea683c1a45"
> +SRC_URI[md5sum] = "1438c1f4a7227c0dedfce5f86f02591d"
> +SRC_URI[sha256sum] = "02f44c70ed3cf27b9e89e5266492fd
> df4b455336ab4e03abc85e92297537201f"
>
> -inherit allarch
> -inherit update-rc.d
> +inherit allarch update-rc.d systemd
>
>  INITSCRIPT_NAME = "cgroups-init"
>  INITSCRIPT_PARAMS = "start 8 2 3 4 5 . stop 20 0 1 6 ."
> +
> +# Keeps the sysvinit scripts out of the image if building
> +# where systemd is in use.
> +SYSTEMD_PACKAGES = "${PN}"
> +SYSTEMD_SERVICE_${PN} = "cgroups-init.service"
> +SYSTEMD_AUTO_ENABLE_${PN} = "mask"
> +
> +
>  do_install() {
>         install -d ${D}/bin
> -       install -d ${D}${sysconfdir}/init.d
>         install -m 0755 ${S}/scripts/cgroups-mount ${D}/bin
>         install -m 0755 ${S}/scripts/cgroups-umount ${D}/bin
> +
> +       install -d ${D}${sysconfdir}/init.d
>         install -m 0755 ${WORKDIR}/cgroups-init ${D}${sysconfdir}/init.d/
> cgroups-init
> +
> +       install -d ${D}${systemd_unitdir}/system
> +       ln -sf /dev/null ${D}${systemd_unitdir}/system/
> cgroups-init.service
>  }
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

--000000000000adc463056cf93a16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Thu, May 24, 2018 at 3:02 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Upgrade and make the recipe more=
 systemd &quot;friendly&quot;. For the most part<br>
nobody is going to use this with systemd but in case they do they will<br>
get a masked and empty services file, as they do with Debian or<br>
Ubuntu. Otherwise this is a minor update from v1.11.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://cgroup-lite_1.11.bb" rel=3D"noreferrer" target=
=3D"_blank">cgroup-lite_1.11.bb</a> =3D&gt; <a href=3D"http://cgroup-lite_1=
.15.bb" rel=3D"noreferrer" target=3D"_blank">cgroup-lite_1.15.bb</a>}=C2=A0=
 =C2=A0| 25 ++++++++++++++++------<br>
=C2=A01 file changed, 18 insertions(+), 7 deletions(-)<br>
=C2=A0rename recipes-containers/cgroup-<wbr>lite/{<a href=3D"http://cgroup-=
lite_1.11.bb" rel=3D"noreferrer" target=3D"_blank">cgroup-lite_1.11.bb</a> =
=3D&gt; <a href=3D"http://cgroup-lite_1.15.bb" rel=3D"noreferrer" target=3D=
"_blank">cgroup-lite_1.15.bb</a>} (54%)<br>
<br>
diff --git a/recipes-containers/cgroup-<wbr>lite/<a href=3D"http://cgroup-l=
ite_1.11.bb" rel=3D"noreferrer" target=3D"_blank">cgroup-lite_1.11.bb</a> b=
/recipes-containers/cgroup-<wbr>lite/<a href=3D"http://cgroup-lite_1.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">cgroup-lite_1.15.bb</a><br>
similarity index 54%<br>
rename from recipes-containers/cgroup-<wbr>lite/<a href=3D"http://cgroup-li=
te_1.11.bb" rel=3D"noreferrer" target=3D"_blank">cgroup-lite_1.11.bb</a><br=
>
rename to recipes-containers/cgroup-<wbr>lite/<a href=3D"http://cgroup-lite=
_1.15.bb" rel=3D"noreferrer" target=3D"_blank">cgroup-lite_1.15.bb</a><br>
index 065d0ea..7b48c3a 100644<br>
--- a/recipes-containers/cgroup-<wbr>lite/<a href=3D"http://cgroup-lite_1.1=
1.bb" rel=3D"noreferrer" target=3D"_blank">cgroup-lite_1.11.bb</a><br>
+++ b/recipes-containers/cgroup-<wbr>lite/<a href=3D"http://cgroup-lite_1.1=
5.bb" rel=3D"noreferrer" target=3D"_blank">cgroup-lite_1.15.bb</a><br>
@@ -1,23 +1,34 @@<br>
=C2=A0SECTION =3D &quot;devel&quot;<br>
=C2=A0SUMMARY =3D &quot;Light-weight package to set up cgroups at system bo=
ot.&quot;<br>
=C2=A0DESCRIPTION =3D=C2=A0 &quot;Light-weight package to set up cgroups at=
 system boot.&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://packages.ubuntu.com/source/precise/cg=
roup-lite" rel=3D"noreferrer" target=3D"_blank">http://packages.ubuntu.com/=
<wbr>source/precise/cgroup-lite</a>&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://packages.ubuntu.com/source/artful/cgr=
oup-lite" rel=3D"noreferrer" target=3D"_blank">http://packages.ubuntu.com/<=
wbr>source/artful/cgroup-lite</a>&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://debian/copyright;md5=3D<wbr>5d5da4e=
0867cf06014f87102154d01<wbr>02&quot;<br>
-SRC_URI =3D &quot;<a href=3D"https://launchpad.net/ubuntu/+archive/primary=
/+files/cgroup-lite_1.11.tar.xz" rel=3D"noreferrer" target=3D"_blank">https=
://launchpad.net/ubuntu/<wbr>+archive/primary/+files/<wbr>cgroup-lite_1.11.=
tar.xz</a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://launchpad.net/ubuntu/+archive/primary=
/+files/cgroup-lite_1.15.tar.xz" rel=3D"noreferrer" target=3D"_blank">https=
://launchpad.net/ubuntu/<wbr>+archive/primary/+files/<wbr>cgroup-lite_1.15.=
tar.xz</a>&quot;<br>
=C2=A0SRC_URI +=3D &quot;file://cgroups-init&quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>b20976194ee8fdb61e6b55281fb6ea<wbr>d4&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>a79ab9ae6fb3ff3ce0aa5539b055c0<wbr>379ea=
ffdc6c5f003af4010fcea683c<wbr>1a45&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>1438c1f4a7227c0dedfce5f86f0259<wbr>1d&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>02f44c70ed3cf27b9e89e5266492fd<wbr>df4b4=
55336ab4e03abc85e92297537<wbr>201f&quot;<br>
<br>
-inherit allarch<br>
-inherit update-rc.d<br>
+inherit allarch update-rc.d systemd<br>
<br>
=C2=A0INITSCRIPT_NAME =3D &quot;cgroups-init&quot;<br>
=C2=A0INITSCRIPT_PARAMS =3D &quot;start 8 2 3 4 5 . stop 20 0 1 6 .&quot;<b=
r>
+<br>
+# Keeps the sysvinit scripts out of the image if building<br>
+# where systemd is in use.<br>
+SYSTEMD_PACKAGES =3D &quot;${PN}&quot;<br>
+SYSTEMD_SERVICE_${PN} =3D &quot;cgroups-init.service&quot;<br>
+SYSTEMD_AUTO_ENABLE_${PN} =3D &quot;mask&quot;<br>
+<br>
+<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/bin<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/init.d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${S}/scripts/cgroups-mount ${D}=
/bin<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${S}/scripts/cgroups-umount ${D=
}/bin<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/init.d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/cgroups-init ${D}${s=
ysconfdir}/init.d/<wbr>cgroups-init<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${systemd_unitdir}/system<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf /dev/null ${D}${systemd_unitdir}/system/=
<wbr>cgroups-init.service<br>
=C2=A0}<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">-- <br>
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
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--000000000000adc463056cf93a16--
