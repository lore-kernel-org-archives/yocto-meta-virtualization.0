Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05A11E008CA; Wed, 23 Nov 2016 11:24:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, 
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.196 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC7BBE0050B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Nov 2016 11:24:35 -0800 (PST)
Received: by mail-qk0-f196.google.com with SMTP id x190so1668473qkb.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Nov 2016 11:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E9xXkcpieZVbjp+v2rpqd/S0czXpmFW3KpfE5QpFT+c=;
	b=SEds3JTczlWWL36+SLPKWY73C9dkyMTT4IbnwNlTT8YjMWpXA+Y5pZxUeyTMlg4G1M
	fNBmUsnUN1fVeXJk8lhq2Xv/IHma+hsWUrbZ5SSIO4Mhi/ACAsGn7i4xhIliblgqjxaz
	8Pa40IrJFbWiWUC4cpPZbxpbOWUvimnDdGI0E0jNfiVZeVQ7Phoac/dNly/yv336wwcg
	9SUE1GuEXAcIMaF0hurtDQxIaYsEGCwl+OXzStNAZIhWeTcrW4OuwGeT9/zud34ie1TP
	aKXsi0z3sCOwyd2vP2H04qV6VlTsynlt1P1BXYpxFO5YHw1jLaA/BCFCjUZ+98dyk2t2
	RD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E9xXkcpieZVbjp+v2rpqd/S0czXpmFW3KpfE5QpFT+c=;
	b=Pf4BJVs12czJno+Scm5KBQbiDZn9o4psQ/b/s3EbO/HLoRYFgyrvGDyHSeQjcX6vYY
	wITkniB3k4gQwUHItewS6XoA2Gv1ipBy2BlebpQM5RXFNyIsGeBLACTnmfnFa+XGWB5R
	KSfyOvEf0VyH7qE498F9dgyo2HqQp8lrmuriRQolWDEjI2UDgv/jdogQUpP6wAvkxPvn
	gvtFJWHN45QqnB8g20sObptpey2hiNj/0nLeQuVcEI1pVDwrCtAKx/JOpObNlJXmQ3hp
	7N2gn/hzqK01WGiM9rjPBwHyoGe4fID1QPDeu5uPnRRXcWaZPw8W+r0K+bMwnZ7BygOm
	0wwA==
X-Gm-Message-State: AKaTC000ZeGpmQPPqyz41nMnrvEacXsJf5t2kv/FvDaomodpjJLpoH4bEPD0BOekU0UZ/yG5c5AppsRi0WDNLw==
X-Received: by 10.55.15.152 with SMTP id 24mr4385454qkp.45.1479929074660; Wed,
	23 Nov 2016 11:24:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.45.220 with HTTP; Wed, 23 Nov 2016 11:24:33 -0800 (PST)
In-Reply-To: <1479840976-10540-4-git-send-email-mark.asselstine@windriver.com>
References: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
	<1479840976-10540-4-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Nov 2016 14:24:33 -0500
Message-ID: <CADkTA4P335iwDjNTQrw=22YaLYQnpx+fD7zB4giKGSqi5CPxdg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 3/4] libvirt: change how we make updates to the dnsmasq configuration
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
X-List-Received-Date: Wed, 23 Nov 2016 19:24:38 -0000
Content-Type: multipart/alternative; boundary=001a114750b0c9bb890541fcd642

--001a114750b0c9bb890541fcd642
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 22, 2016 at 1:56 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> Our old approach of making the default configuration of dnsmasq use
> 'bind-dynamic' has some negative side effects. ie. by making this
> change when meta-virtualization is used but when libvirtd is not
> installed in the rootfs we prevent dnsmasq from binding to all
> interfaces (which is the expected/builtin default behavior of
> dnsmasq). The results can also be non-deterministic when multiple
> instances of dnsmasq are being run (which instance configured with
> bind-dynamic should attend to new network interfaces?)
>
> Additionally our approach modifies the default dnsmasq configuration
> file which ideally should have now changes, allowing dnsmasq to be
> configured using its builtin configuration values and also allowing
> for other instances of dnsmasq to better reuse the default
> configuration file.
>
> These changes allow for better coexistence of libvirt with packages
> like lxc which run their own instances of dnsmasq.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt/dnsmasq.libvirt-daemon | 2 ++
>  recipes-extended/libvirt/libvirt_1.3.5.bb               | 6 ++++++
>  2 files changed, 8 insertions(+)
>  create mode 100644 recipes-extended/libvirt/
> libvirt/dnsmasq.libvirt-daemon
>
> diff --git a/recipes-extended/libvirt/libvirt/dnsmasq.libvirt-daemon
> b/recipes-extended/libvirt/libvirt/dnsmasq.libvirt-daemon
> new file mode 100644
> index 0000000..a7c3059
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/dnsmasq.libvirt-daemon
> @@ -0,0 +1,2 @@
> +bind-interfaces
> +except-interface=virbr0
> diff --git a/recipes-extended/libvirt/libvirt_1.3.5.bb
> b/recipes-extended/libvirt/libvirt_1.3.5.bb
> index c848c99..b8e8159 100644
> --- a/recipes-extended/libvirt/libvirt_1.3.5.bb
> +++ b/recipes-extended/libvirt/libvirt_1.3.5.bb
> @@ -37,6 +37,7 @@ SRC_URI = "http://libvirt.org/sources/
> libvirt-${PV}.tar.gz;name=libvirt \
>             file://0001-qemu-Let-empty-default-VNC-password-work-as-document.patch
> \
>             file://0001-ptest-add-missing-test_helper-files.patch \
>             file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch
> \
> +           file://dnsmasq.libvirt-daemon \
>            "
>
>  SRC_URI[libvirt.md5sum] = "f9dc1e63d559eca50ae0ee798a4c6c6d"
> @@ -112,6 +113,7 @@ FILES_${PN}-libvirtd = " \
>         ${sbindir}/libvirtd \
>         ${systemd_unitdir}/system/* \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '',
> '${libexecdir}/libvirt-guests.sh', d)} \
> +       ${sysconfdir}/dnsmasq.d/libvirt-daemon \
>

I'm not a packaging expert .. but should one package be installing config
files for another ?
Wouldn't this imply that libvirt really needs to be a distro feature, and
then we can make all
the behaviour changes trigger off a single variable ?

My point is .. from the libvirt package, I'm not aware of how dnsmasq sees
this file "libvirt-daemon".. what exactly does it do ? Does it match on the
executable
name ? Are all the files in dnsmasq.d always processed on startup of
dnsmasq ?
.. what if there are competing settings from other packages ?

Bruce


>          "
>
>  FILES_${PN}-virsh = "${bindir}/virsh"
> @@ -258,6 +260,10 @@ do_install_append() {
>         for i in `find ${D}${libdir} -type f -name *.la`; do
>             sed -i -e 's#-L${B}/src/.libs##g' $i
>         done
> +
> +       # ensure dnsmasq doesn't default to listenning on all interfaces
> +       install -d ${D}/${sysconfdir}/dnsmasq.d
> +       install -m 644 ${WORKDIR}/dnsmasq.libvirt-daemon
> ${D}/${sysconfdir}/dnsmasq.d/libvirt-daemon
>  }
>
>  EXTRA_OECONF += " \
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

--001a114750b0c9bb890541fcd642
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Nov 22, 2016 at 1:56 PM, Mark Asselstine <span dir=3D"ltr">&lt;=
<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.ass=
elstine@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">Our old approach of making the default configuration of dnsmasq use<br>
&#39;bind-dynamic&#39; has some negative side effects. ie. by making this<b=
r>
change when meta-virtualization is used but when libvirtd is not<br>
installed in the rootfs we prevent dnsmasq from binding to all<br>
interfaces (which is the expected/builtin default behavior of<br>
dnsmasq). The results can also be non-deterministic when multiple<br>
instances of dnsmasq are being run (which instance configured with<br>
bind-dynamic should attend to new network interfaces?)<br>
<br>
Additionally our approach modifies the default dnsmasq configuration<br>
file which ideally should have now changes, allowing dnsmasq to be<br>
configured using its builtin configuration values and also allowing<br>
for other instances of dnsmasq to better reuse the default<br>
configuration file.<br>
<br>
These changes allow for better coexistence of libvirt with packages<br>
like lxc which run their own instances of dnsmasq.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/<wbr>libvirt/dnsmasq.libvirt-daemon | 2 ++<b=
r>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvi<wbr>rt_1.3.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ++++++<br>
=C2=A02 files changed, 8 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/libvirt/<wbr>libvirt/dnsmasq.libv=
irt-daemon<br>
<br>
diff --git a/recipes-extended/libvirt/<wbr>libvirt/dnsmasq.libvirt-daemon b=
/recipes-extended/libvirt/<wbr>libvirt/dnsmasq.libvirt-daemon<br>
new file mode 100644<br>
index 0000000..a7c3059<br>
--- /dev/null<br>
+++ b/recipes-extended/libvirt/<wbr>libvirt/dnsmasq.libvirt-daemon<br>
@@ -0,0 +1,2 @@<br>
+bind-interfaces<br>
+except-interface=3Dvirbr0<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" r=
el=3D"noreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a> b/recipes-ext=
ended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"noreferrer" target=
=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
index c848c99..b8e8159 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>virt_1.3.5.bb</a><br>
@@ -37,6 +37,7 @@ SRC_URI =3D &quot;<a href=3D"http://libvirt.org/sources/l=
ibvirt-${PV}.tar.gz;name=3Dlibvirt" rel=3D"noreferrer" target=3D"_blank">ht=
tp://libvirt.org/sources/<wbr>libvirt-${PV}.tar.gz;name=3D<wbr>libvirt</a> =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-qemu-Let-empty-<wbr>d=
efault-VNC-password-work-as-<wbr>document.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ptest-add-missing-<wb=
r>test_helper-files.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ptest-Remove-<wbr>Win=
dows-1252-check-from-<wbr>esxutilstest.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dnsmasq.libvirt-daemon \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[libvirt.md5sum] =3D &quot;<wbr>f9dc1e63d559eca50ae0ee798a4c6c=
<wbr>6d&quot;<br>
@@ -112,6 +113,7 @@ FILES_${PN}-libvirtd =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sbindir}/libvirtd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${systemd_unitdir}/system/* \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&=
#39;, &#39;sysvinit&#39;, &#39;&#39;, &#39;${libexecdir}/libvirt-guests.<wb=
r>sh&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}/dnsmasq.d/<wbr>libvirt-daemon \<b=
r></blockquote><div><br></div><div>I&#39;m not a packaging expert .. but sh=
ould one package be installing config files for another ?</div><div>Wouldn&=
#39;t this imply that libvirt really needs to be a distro feature, and then=
 we can make all</div><div>the behaviour changes trigger off a single varia=
ble ?</div><div><br></div><div>My point is .. from the libvirt package, I&#=
39;m not aware of how dnsmasq sees</div><div>this file &quot;libvirt-daemon=
&quot;.. what exactly does it do ? Does it match on the executable</div><di=
v>name ? Are all the files in dnsmasq.d always processed on startup of dnsm=
asq ?=C2=A0</div><div>.. what if there are competing settings from other pa=
ckages ?</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-virsh =3D &quot;${bindir}/virsh&quot;<br>
@@ -258,6 +260,10 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in `find ${D}${libdir} -type f -name *.la=
`; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s#-L${B}/src/.libs=
##g&#39; $i<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# ensure dnsmasq doesn&#39;t default to listenn=
ing on all interfaces<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/${sysconfdir}/dnsmasq.d<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${WORKDIR}/dnsmasq.libvirt-<wbr>=
daemon ${D}/${sysconfdir}/dnsmasq.d/<wbr>libvirt-daemon<br>
=C2=A0}<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot; \<br>
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
</div></div>

--001a114750b0c9bb890541fcd642--
