Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3CF8BE008CA; Wed, 23 Nov 2016 11:20:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.176 listed in dnsbl.sorbs.net]
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F102CE0050B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Nov 2016 11:20:33 -0800 (PST)
Received: by mail-qk0-f176.google.com with SMTP id n204so26295098qke.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Nov 2016 11:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0bLz7o7JMIAJUyhWSp1w77p9xyudecguVl0v2H4+JwY=;
	b=DpQ2PXEPoNhnk3eD39iiMDEuG5CAEg6Py/9Xly4YzUOs0PtXidh8DhYzeRz6pMVBgU
	/ruycQrNiPonZAkg6EaPOy/Ziy+0gKpyEGur1MuJBZHWwta0IFbdOYRhpVfRa6b06tdG
	CQeWqWf/xIKfpL2k+PMyDR5WxKEEbN+zCId91c2Rlu0S2luJapvCm+3A5fvyoh+wMu8z
	C8w5f+uLxqzPfwHnvyPrgYPCIUWNdq7BebVeYejRmQmH+ps7L614bPXLma51zFWwpntF
	AjTeQ1CDF86teuhSdHwuE+Gfqp3NHUiwOXEFfZ/Mq7Ne3VC8o1JQ2S7gTh7DSIN+QOsk
	maiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0bLz7o7JMIAJUyhWSp1w77p9xyudecguVl0v2H4+JwY=;
	b=fGpN+CNPBlLL2xhP9gTeUcQQiXxDUwJLB3Vd0Fjusm2SA/NBOjEOQvWOcrHMlX4ifR
	/3DmHNZXDbB/kImheyf+T48SVkTmL2Usrnz7Hvdzcy4B64n1rjlt1/UFIbeWXcgGw1n9
	EKXztqCPlHMO3t8RkbsaX3bm3cJcWnVbTEHUIlWAqurGyhGO6RbUwePgyu5OARf/Ywxu
	PPf/PIZjUXBPiu+CQ2p8HZP8H4Sl4sdmqy/ACxzUk5XXHyWCnAW9WX4QHxgYBcrSxbiJ
	5RrBaBaYps7l6tEPvE0y0wqcYY1nvDlsDYwLL4Y8Y+KYa58YHxPyoJ5/CQyogZLTvQAX
	E9aw==
X-Gm-Message-State: AKaTC02JzkE/NELAqXHzgf4sz1rJuFRWMokc/i/q8MNupMUY+JvHhVuz1GdBWxlK7Ay68aONveN4wvltq/HP7w==
X-Received: by 10.55.166.77 with SMTP id p74mr4251338qke.113.1479928832861;
	Wed, 23 Nov 2016 11:20:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.45.220 with HTTP; Wed, 23 Nov 2016 11:20:31 -0800 (PST)
In-Reply-To: <1479840976-10540-5-git-send-email-mark.asselstine@windriver.com>
References: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
	<1479840976-10540-5-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Nov 2016 14:20:31 -0500
Message-ID: <CADkTA4P7dbu+vP_ss1Xcf=MBjT9o-N5k5fo8x2bN1BYS0hrADQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 4/4] dnsmasq: allow net interfaces to config their own dnsmasq instance
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
X-List-Received-Date: Wed, 23 Nov 2016 19:20:37 -0000
Content-Type: multipart/alternative; boundary=94eb2c06ed9a602a370541fcc87f

--94eb2c06ed9a602a370541fcc87f
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 22, 2016 at 1:56 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> This addition to dnsmasq allows an interface to define a dnsmasq
> configuration file as /var/lib/dnsmasq/%i/dnsmasq.conf and have their
> dnsmasq instance controlled via systemctl dnsmasq@%i.service (where
> '%i' is the interface name).
>
> To use this simply create the dnsmasq.conf file as above and enable
> the systemd service like:
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-support/dnsmasq/dnsmasq/dnsmasq@.service | 12 ++++++++++++
>  recipes-support/dnsmasq/dnsmasq_2.%.bbappend     | 16 ++++++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 recipes-support/dnsmasq/dnsmasq/dnsmasq@.service
>  create mode 100644 recipes-support/dnsmasq/dnsmasq_2.%.bbappend
>
> diff --git a/recipes-support/dnsmasq/dnsmasq/dnsmasq@.service
> b/recipes-support/dnsmasq/dnsmasq/dnsmasq@.service
> new file mode 100644
> index 0000000..9e36a36
> --- /dev/null
> +++ b/recipes-support/dnsmasq/dnsmasq/dnsmasq@.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +Description=DHCP and DNS caching server for %i.
> +After=network.target
> +
> +[Service]
> +ExecStart=/usr/bin/dnsmasq -k --conf-file=/var/lib/dnsmasq/%
> i/dnsmasq.conf
> +ExecReload=/bin/kill -HUP $MAINPID
> +Restart=on-failure
> +RestartSec=5
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
> b/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
> new file mode 100644
> index 0000000..2acfd0c
> --- /dev/null
> +++ b/recipes-support/dnsmasq/dnsmasq_2.%.bbappend
> @@ -0,0 +1,16 @@
> +# Allow individual network interfaces to easily configure
> +# their own dnsmasq instance.
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += " \
> +    file://dnsmasq@.service \
> +    "
> +
>

Let me see if I properly understand this .. since this is bbappend, we are
going to
enable this service no matter what if dnsmasq is in an image ?

Like the lxc networking, is there an option to put this into a separate
package
"dnsmasq-extra" .. or something better than that ? So that when someone
wants
this capability, they have to install the extra package ?

Otherwise, I don't see a way to opt out.

Bruce


> +do_install_append() {
> +    install -d ${D}/${sysconfdir}/systemd
> +    install -d ${D}/${sysconfdir}/systemd/system
> +    install -m 644 ${WORKDIR}/dnsmasq@.service
> ${D}/${sysconfdir}/systemd/system/.
> +}
> +
> +FILES_${PN} += "${sysconfdir}/systemd/system/dnsmasq@.service"
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

--94eb2c06ed9a602a370541fcc87f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Nov 22, 2016 at 1:56 PM, Mark Asselstine <span dir=3D"ltr">&lt;=
<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.ass=
elstine@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">This addition to dnsmasq allows an interface to define a dnsmasq<br>
configuration file as /var/lib/dnsmasq/%i/dnsmasq.<wbr>conf and have their<=
br>
dnsmasq instance controlled via systemctl dnsmasq@%i.service (where<br>
&#39;%i&#39; is the interface name).<br>
<br>
To use this simply create the dnsmasq.conf file as above and enable<br>
the systemd service like:<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0recipes-support/dnsmasq/<wbr>dnsmasq/dnsmasq@.service | 12 ++++++++++=
++<br>
=C2=A0recipes-support/dnsmasq/<wbr>dnsmasq_2.%.bbappend=C2=A0 =C2=A0 =C2=A0=
| 16 ++++++++++++++++<br>
=C2=A02 files changed, 28 insertions(+)<br>
=C2=A0create mode 100644 recipes-support/dnsmasq/<wbr>dnsmasq/dnsmasq@.serv=
ice<br>
=C2=A0create mode 100644 recipes-support/dnsmasq/<wbr>dnsmasq_2.%.bbappend<=
br>
<br>
diff --git a/recipes-support/dnsmasq/<wbr>dnsmasq/dnsmasq@.service b/recipe=
s-support/dnsmasq/<wbr>dnsmasq/dnsmasq@.service<br>
new file mode 100644<br>
index 0000000..9e36a36<br>
--- /dev/null<br>
+++ b/recipes-support/dnsmasq/<wbr>dnsmasq/dnsmasq@.service<br>
@@ -0,0 +1,12 @@<br>
+[Unit]<br>
+Description=3DDHCP and DNS caching server for %i.<br>
+After=3Dnetwork.target<br>
+<br>
+[Service]<br>
+ExecStart=3D/usr/bin/dnsmasq -k --conf-file=3D/var/lib/dnsmasq/%<wbr>i/dns=
masq.conf<br>
+ExecReload=3D/bin/kill -HUP $MAINPID<br>
+Restart=3Don-failure<br>
+RestartSec=3D5<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br>
diff --git a/recipes-support/dnsmasq/<wbr>dnsmasq_2.%.bbappend b/recipes-su=
pport/dnsmasq/<wbr>dnsmasq_2.%.bbappend<br>
new file mode 100644<br>
index 0000000..2acfd0c<br>
--- /dev/null<br>
+++ b/recipes-support/dnsmasq/<wbr>dnsmasq_2.%.bbappend<br>
@@ -0,0 +1,16 @@<br>
+# Allow individual network interfaces to easily configure<br>
+# their own dnsmasq instance.<br>
+<br>
+FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
+<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 file://dnsmasq@.service \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br></blockquote><div><br></div><div>Let me see if I properly understand t=
his .. since this is bbappend, we are going to</div><div>enable this servic=
e no matter what if dnsmasq is in an image ?</div><div><br></div><div>Like =
the lxc networking, is there an option to put this into a separate package<=
/div><div>&quot;dnsmasq-extra&quot; .. or something better than that ? So t=
hat when someone wants</div><div>this capability, they have to install the =
extra package ?</div><div><br></div><div>Otherwise, I don&#39;t see a way t=
o opt out.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">
+do_install_append() {<br>
+=C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/systemd<br>
+=C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/systemd/<wbr>system<br>
+=C2=A0 =C2=A0 install -m 644 ${WORKDIR}/dnsmasq@.service ${D}/${sysconfdir=
}/systemd/<wbr>system/.<br>
+}<br>
+<br>
+FILES_${PN} +=3D &quot;${sysconfdir}/systemd/system/<wbr>dnsmasq@.service&=
quot;<br>
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

--94eb2c06ed9a602a370541fcc87f--
