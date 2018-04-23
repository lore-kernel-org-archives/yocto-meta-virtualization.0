Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2BD6E00948; Mon, 23 Apr 2018 09:37:09 -0700 (PDT)
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
	*      [209.85.128.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 514D8E008BF
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Apr 2018 09:37:07 -0700 (PDT)
Received: by mail-wr0-f172.google.com with SMTP id w3-v6so43052639wrg.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Apr 2018 09:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5Hi59lfn1mMAjZz/YEl9sHsLfV3ZKsQ/vOcj+uhmAJs=;
	b=WTsZvv5MOKnNbvyVmRlY+zxgAoVe13KjvQu55hOlerbO4BJAdn53+3steSJ1Snr6mk
	igRuTaBOWU3oQiVUHVYb+pZOf0rXf6Ss2JdSeMT/3NVzXyh/ZAnEdf8pE8+7RodVBugT
	1+KKqr/kDmfSTH2pgNky7R8fCytWnUbTZn7cYwdQ0X1pxUcwCkWklV5N4XPgs9XZAInX
	PbmOpaNgzLYLmL03lSy36NF5PBVv8NJtgeIWwOnwnzwh0qgwmVDnwDGRIE1Kz6PhKWu3
	P1vDpOzaCkUTqLnYkbvfPSX6qP+mVzX6xsRe3o4ymFF9UceBKxpXXBCLCppjAfsCXjgk
	bSjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5Hi59lfn1mMAjZz/YEl9sHsLfV3ZKsQ/vOcj+uhmAJs=;
	b=YzVGvMzhVQEPC07EZ3xSJIADfvap/a5JUOsIbhLjbOnrjByVooaPWyIXT3xuND2zwm
	AS8Lu1d4bcM4p7q/KzVT1dRI7SxniOemVhrnor9/V7qIU63x1ATTrNZQ0zkrdmEj6Dpl
	eY7qpyRU3lY7yE8u5K6CtHCbIzYmpowGcP7+h7/4udyLpiFdizKpek7iZWyhZS086qq0
	w/eDn6UTyBPkno7n/wTrd9KDQWVLZw+3k96WpbEi+r3XrNGSHIVG/G1DertToNTX73QZ
	zcIgdi57D0TUkMwif9XP7PulTTPZ+5igWl/TgMzdSRdzVuADquzjMI8CahF2YRGYm3tt
	DhlA==
X-Gm-Message-State: ALQs6tCSECbNHoA90N964ZEFE+vXJqOYl84IhwHUcOiZ+5LgNpfsF+Es
	xk/lzINGvHrh8MQrPM9UQTQMw0e6xKN++Zz/Dgs=
X-Google-Smtp-Source: AIpwx49j0YIDf9yJNvTDacegJ2Bz1A+rSTUpkn075PCTyXSxeUyOs4NUYwGp2j6z3kADkCoCTTcHziU+oQIfFy0l0W4=
X-Received: by 2002:adf:ad46:: with SMTP id
	p64-v6mr16372033wrc.44.1524501427139; 
	Mon, 23 Apr 2018 09:37:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.129.206 with HTTP; Mon, 23 Apr 2018 09:37:06 -0700 (PDT)
In-Reply-To: <20180420143456.31128-1-akuster808@gmail.com>
References: <20180420143456.31128-1-akuster808@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 23 Apr 2018 12:37:06 -0400
Message-ID: <CADkTA4OOaHoBwvi7sAbE8cRvMQKKtmF=LRV10oLgETGm2wH7Gw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] Refactor to conform to YP Compat requirements
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
X-List-Received-Date: Mon, 23 Apr 2018 16:37:09 -0000
Content-Type: multipart/alternative; boundary="000000000000063a90056a86a6a2"

--000000000000063a90056a86a6a2
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Apr 20, 2018 at 10:34 AM, Armin Kuster <akuster808@gmail.com> wrote:

> This prevents the signature from being modified
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  recipes-core/busybox/busybox_%.bbappend              | 11 +----------
>  recipes-core/busybox/busybox_virtualization.inc      | 10 ++++++++++
>  .../iptables/iptables-meta-virtualization.inc        | 19
> +++++++++++++++++++
>  recipes-extended/iptables/iptables_1.%.bbappend      | 20
> +-------------------
>  4 files changed, 31 insertions(+), 29 deletions(-)
>  create mode 100644 recipes-core/busybox/busybox_virtualization.inc
>  create mode 100644 recipes-extended/iptables/
> iptables-meta-virtualization.inc
>
> diff --git a/recipes-core/busybox/busybox_%.bbappend
> b/recipes-core/busybox/busybox_%.bbappend
> index 8369a03..617cacc 100644
> --- a/recipes-core/busybox/busybox_%.bbappend
> +++ b/recipes-core/busybox/busybox_%.bbappend
> @@ -1,10 +1 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -SRC_URI += " \
> -           file://lspci.cfg \
> -           file://lsusb.cfg \
> -           file://mdev.cfg \
> -           file://mount-cifs.cfg \
> -           file://ps-extras.cfg \
> -           file://getopt.cfg \
> -           "
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',
> '${BPN}_virtualization.inc', '', d)}
> diff --git a/recipes-core/busybox/busybox_virtualization.inc
> b/recipes-core/busybox/busybox_virtualization.inc
> new file mode 100644
> index 0000000..d9c4e67
> --- /dev/null
> +++ b/recipes-core/busybox/busybox_virtualization.inc
> @@ -0,0 +1,10 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/busybox:"
> +
> +SRC_URI += " \
> +           file://lspci.cfg \
> +           file://lsusb.cfg \
> +           file://mdev.cfg \
> +           file://mount-cifs.cfg \
> +           file://ps-extras.cfg \
> +           file://getopt.cfg \
> +           "
> diff --git a/recipes-extended/iptables/iptables-meta-virtualization.inc
> b/recipes-extended/iptables/iptables-meta-virtualization.inc
> new file mode 100644
> index 0000000..8fd521c
> --- /dev/null
> +++ b/recipes-extended/iptables/iptables-meta-virtualization.inc
> @@ -0,0 +1,19 @@
> +RRECOMMENDS_${PN} += "kernel-module-ip6-tables \
> +                      kernel-module-ip-tables \
> +                      kernel-module-ip6table-filter \
> +                      kernel-module-iptable-filter \
> +                      kernel-module-ip6table-raw \
> +                      kernel-module-iptable-raw \
> +                      kernel-module-ip6table-nat \
> +                      kernel-module-iptable-nat \
> +                      kernel-module-ip6table-mangle \
> +                      kernel-module-iptable-magle \
> +                      kernel-module-ip6table-security \
> +                      kernel-module-iptable-security \
> +                      kernel-module-ipt-reject \
> +                      kernel-module-iptable-mangle \
> +                      kernel-module-xt-checksum \
> +                      kernel-module-xt-conntrack \
> +                      kernel-module-xt-state \
> +                      kernel-module-xt-tcpudp \
> +                      "
> diff --git a/recipes-extended/iptables/iptables_1.%.bbappend
> b/recipes-extended/iptables/iptables_1.%.bbappend
> index 8fd521c..9a15e60 100644
> --- a/recipes-extended/iptables/iptables_1.%.bbappend
> +++ b/recipes-extended/iptables/iptables_1.%.bbappend
> @@ -1,19 +1 @@
> -RRECOMMENDS_${PN} += "kernel-module-ip6-tables \
> -                      kernel-module-ip-tables \
> -                      kernel-module-ip6table-filter \
> -                      kernel-module-iptable-filter \
> -                      kernel-module-ip6table-raw \
> -                      kernel-module-iptable-raw \
> -                      kernel-module-ip6table-nat \
> -                      kernel-module-iptable-nat \
> -                      kernel-module-ip6table-mangle \
> -                      kernel-module-iptable-magle \
> -                      kernel-module-ip6table-security \
> -                      kernel-module-iptable-security \
> -                      kernel-module-ipt-reject \
> -                      kernel-module-iptable-mangle \
> -                      kernel-module-xt-checksum \
> -                      kernel-module-xt-conntrack \
> -                      kernel-module-xt-state \
> -                      kernel-module-xt-tcpudp \
> -                      "
> +require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',
> '${BPN}-meta-virtualization.inc', '', d)}
> --
> 2.14.1
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

--000000000000063a90056a86a6a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged<div><br></div><div>Bruce</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Fri, Apr 20, 2018 at 10:34 AM=
, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mailto:akuster808@gmail.com=
" target=3D"_blank">akuster808@gmail.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">This prevents the signature from being modified<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com">aku=
ster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-core/busybox/busybox_%<wbr>.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 11 +----------<br>
=C2=A0recipes-core/busybox/busybox_<wbr>virtualization.inc=C2=A0 =C2=A0 =C2=
=A0 | 10 ++++++++++<br>
=C2=A0.../iptables/iptables-meta-<wbr>virtualization.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 19 +++++++++++++++++++<br>
=C2=A0recipes-extended/iptables/<wbr>iptables_1.%.bbappend=C2=A0 =C2=A0 =C2=
=A0 | 20 +-------------------<br>
=C2=A04 files changed, 31 insertions(+), 29 deletions(-)<br>
=C2=A0create mode 100644 recipes-core/busybox/busybox_<wbr>virtualization.i=
nc<br>
=C2=A0create mode 100644 recipes-extended/iptables/<wbr>iptables-meta-virtu=
alization.<wbr>inc<br>
<br>
diff --git a/recipes-core/busybox/<wbr>busybox_%.bbappend b/recipes-core/bu=
sybox/<wbr>busybox_%.bbappend<br>
index 8369a03..617cacc 100644<br>
--- a/recipes-core/busybox/<wbr>busybox_%.bbappend<br>
+++ b/recipes-core/busybox/<wbr>busybox_%.bbappend<br>
@@ -1,10 +1 @@<br>
-FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
-<br>
-SRC_URI +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lspci.cfg \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lsusb.cfg \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://mdev.cfg \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://mount-cifs.cfg \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ps-extras.cfg \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://getopt.cfg \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+require ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;virtuali=
zation&#39;, &#39;${BPN}_virtualization.inc&#39;, &#39;&#39;, d)}<br>
diff --git a/recipes-core/busybox/<wbr>busybox_virtualization.inc b/recipes=
-core/busybox/<wbr>busybox_virtualization.inc<br>
new file mode 100644<br>
index 0000000..d9c4e67<br>
--- /dev/null<br>
+++ b/recipes-core/busybox/<wbr>busybox_virtualization.inc<br>
@@ -0,0 +1,10 @@<br>
+FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/busybox:&quot;<br>
+<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lspci.cfg \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://lsusb.cfg \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://mdev.cfg \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://mount-cifs.cfg \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ps-extras.cfg \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://getopt.cfg \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
diff --git a/recipes-extended/iptables/<wbr>iptables-meta-virtualization.<w=
br>inc b/recipes-extended/iptables/<wbr>iptables-meta-virtualization.<wbr>i=
nc<br>
new file mode 100644<br>
index 0000000..8fd521c<br>
--- /dev/null<br>
+++ b/recipes-extended/iptables/<wbr>iptables-meta-virtualization.<wbr>inc<=
br>
@@ -0,0 +1,19 @@<br>
+RRECOMMENDS_${PN} +=3D &quot;kernel-module-ip6-tables \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-ip-tables \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-ip6table-filter \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-iptable-filter \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-ip6table-raw \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-iptable-raw \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-ip6table-nat \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-iptable-nat \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-ip6table-mangle \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-iptable-magle \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-ip6table-<wbr>security \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-iptable-security \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-ipt-reject \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-iptable-mangle \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-xt-checksum \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-xt-conntrack \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-xt-state \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-xt-tcpudp \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;<br>
diff --git a/recipes-extended/iptables/<wbr>iptables_1.%.bbappend b/recipes=
-extended/iptables/<wbr>iptables_1.%.bbappend<br>
index 8fd521c..9a15e60 100644<br>
--- a/recipes-extended/iptables/<wbr>iptables_1.%.bbappend<br>
+++ b/recipes-extended/iptables/<wbr>iptables_1.%.bbappend<br>
@@ -1,19 +1 @@<br>
-RRECOMMENDS_${PN} +=3D &quot;kernel-module-ip6-tables \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-ip-tables \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-ip6table-filter \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-iptable-filter \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-ip6table-raw \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-iptable-raw \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-ip6table-nat \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-iptable-nat \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-ip6table-mangle \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-iptable-magle \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-ip6table-<wbr>security \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-iptable-security \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-ipt-reject \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-iptable-mangle \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-xt-checksum \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-xt-conntrack \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-xt-state \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernel-module-xt-tcpudp \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;<br>
+require ${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;virtuali=
zation&#39;, &#39;${BPN}-meta-virtualization.<wbr>inc&#39;, &#39;&#39;, d)}=
<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.14.1<br>
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

--000000000000063a90056a86a6a2--
