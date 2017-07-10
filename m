Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8066E00BC2; Mon, 10 Jul 2017 08:41:37 -0700 (PDT)
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
	*      [209.85.215.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11C32E00B8B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 08:41:27 -0700 (PDT)
Received: by mail-lf0-f48.google.com with SMTP id t72so65336116lff.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 08:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4wSipQeSFnThT24wnTaWmYnLfJCudgzx8ITYMFLDEu4=;
	b=YiAtvwsaiqQNYjIeVqGUAGU7+QSlQ14GD33/1fO46XHNMA8lCYensQMN9nWBLhi1Zo
	v7ujw3zkA2jWwRd1dDn7barIlG8sRZiQBvnfFLPWIVUt4izLZS1UG+8C/H18V6toUG88
	B9RfDCpzQxmg4mV962HTF7b3tS9Cd7cTxkivW0a3cx2zhWnbRi3NU8HD4Vjud+bQxmje
	n866ESnPJzHH9KCnnpmEYqbHrBUB5wqLD00xXzLSFUjgbU4A90rOvklKnI6yADwTy3IO
	VaUARycBwEmicD0tPMizp37U1XR8j7UMR4CpCs71eglwcX+mfB8NWhxEiOJnNiyl5+u6
	9HmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4wSipQeSFnThT24wnTaWmYnLfJCudgzx8ITYMFLDEu4=;
	b=D8IRv+LXJILQLRSUla1wXWRY6KFkhO4/wzgr12hTT2eKjJcuTP5NeUvKW3EBtJJxbD
	fQrW7lizPlJkyhOcyBhcF+kJ1/Ft6D5bYWlVx75MeBL4S1Pzr0Nw4TEqat51PPiJ7A6l
	0y73DqjJuziCsCf8iV6bEX7epERhQ0wmOYZNbk3SbNk6Enq+1Gce7lvU8nCT9pqQV7t2
	gviYjzKcBLrghMgIBCxBszjqiHA2OAQxS3ZORzMmifis57/y3em6vi6qkPCkS/C6Bm1I
	T7MCsnttqw1n6yPGk4uBerQnHGZMJcDKphyLaPdB8JI7hMFUcC89/m/sdVWGGQo2JGhy
	cvPQ==
X-Gm-Message-State: AIVw111ZM6BCU2MUS+CN4roGUdufA9M9zUgMC1CeF3giIhzOUaC4xSEW
	XmtwfzbwPNJ12UHn58XDvQtNur4Bqg==
X-Received: by 10.25.67.81 with SMTP id m17mr1678211lfj.147.1499701286240;
	Mon, 10 Jul 2017 08:41:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Mon, 10 Jul 2017 08:41:25 -0700 (PDT)
In-Reply-To: <3CA7AF00-AEB9-46BC-9E5C-CB2586AAEA39@intel.com>
References: <1499470731-26466-1-git-send-email-brian.avery@intel.com>
	<CADkTA4OBvGKf5zaNxOu00s01QThL0DmhVUtLTr-nx9K69BpM5w@mail.gmail.com>
	<3CA7AF00-AEB9-46BC-9E5C-CB2586AAEA39@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Jul 2017 11:41:25 -0400
Message-ID: <CADkTA4MdvjbV7u1y3VkKJusZqN1A6q9oiog4Mdcoi5mDtUbijQ@mail.gmail.com>
To: "Avery, Brian" <brian.avery@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] docker: add NETFILTER_XT_MATCH_ADDRTYPE=m
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
X-List-Received-Date: Mon, 10 Jul 2017 15:41:37 -0000
Content-Type: multipart/alternative; boundary="f403045e9e0e6f86f30553f86ab3"

--f403045e9e0e6f86f30553f86ab3
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 10, 2017 at 11:37 AM, Avery, Brian <brian.avery@intel.com>
wrote:

> Works for me.
>
> ty :)
>
> -b
>
>
>
> p.s. working on this did hit bug https://bugzilla.yoctoproject.
> org/show_bug.cgi?id=8191 when I tried to use linux-intel instead of
> linux-yocto.
>

Indeed. The requirement is still that linux-yocto's class is inherited. The
new implementation
removes that requirement but still has some issues.

Bruce


>
>
>
>
> *From: *Bruce Ashfield <bruce.ashfield@gmail.com>
> *Date: *Monday, July 10, 2017 at 8:24 AM
> *To: *"Avery, Brian" <brian.avery@intel.com>
> *Cc: *"meta-virtualization@yoctoproject.org" <meta-virtualization@
> yoctoproject.org>
> *Subject: *Re: [meta-virtualization] [PATCH] docker: add
> NETFILTER_XT_MATCH_ADDRTYPE=m
>
>
>
>
>
>
>
> On Fri, Jul 7, 2017 at 7:38 PM, brian avery <brian.avery@intel.com> wrote:
>
> Docker needs ths _NETFILTER_XT_MATCH_ADDRTYPE module in order to start
> up successfully. This patch adds it to the supported kernels.
>
> Signed-off-by: brian avery <brian.avery@intel.com>
> ---
>  recipes-kernel/linux/linux-yocto/docker.cfg    | 1 +
>  recipes-kernel/linux/linux-yocto/docker.scc    | 4 ++++
>  recipes-kernel/linux/linux-yocto_4.1.bbappend  | 1 +
>  recipes-kernel/linux/linux-yocto_4.10.bbappend | 1 +
>  recipes-kernel/linux/linux-yocto_4.4.bbappend  | 1 +
>  recipes-kernel/linux/linux-yocto_4.9.bbappend  | 1 +
>  6 files changed, 9 insertions(+)
>  create mode 100644 recipes-kernel/linux/linux-yocto/docker.cfg
>  create mode 100644 recipes-kernel/linux/linux-yocto/docker.scc
>
> diff --git a/recipes-kernel/linux/linux-yocto/docker.cfg
> b/recipes-kernel/linux/linux-yocto/docker.cfg
> new file mode 100644
> index 0000000..d0ebb66
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/docker.cfg
> @@ -0,0 +1 @@
> +CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
>
>
>
>
>
> I could have sworn that I already ported and merged my docker fragment to
> meta-virt,
>
> but it looks like I only staged it and never actually did the patch.
>
>
>
> To make the fragment as standalone as possible, I'm running with this:
>
>
>
> ------------
>
> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
>
> CONFIG_IP_NF_FILTER=m
>
> CONFIG_NF_NAT=m
>
> CONFIG_NF_CONNTRACK_IPV4=y
>
> CONFIG_DM_THIN_PROVISIONING=m
>
> CONFIG_IP_NF_NAT=m
>
> CONFIG_IP_NF_TARGET_MASQUERADE=m
>
> CONFIG_OVERLAY_FS=y
>
> -------------
>
>
>
> I propose to update your fragment with those options and merge the changes
> that
>
> way.
>
>
>
> Any objections ?
>
>
>
> Bruce
>
>
>
> diff --git a/recipes-kernel/linux/linux-yocto/docker.scc
> b/recipes-kernel/linux/linux-yocto/docker.scc
> new file mode 100644
> index 0000000..e317456
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/docker.scc
> @@ -0,0 +1,4 @@
> +define KFEATURE_DESCRIPTION "Enable Features needed by docker in addition
> to LXC features"
> +define KFEATURE_COMPATIBILITY board
> +
> +kconf non-hardware docker.cfg
> diff --git a/recipes-kernel/linux/linux-yocto_4.1.bbappend
> b/recipes-kernel/linux/linux-yocto_4.1.bbappend
> index f3be89e..f163fdf 100644
> --- a/recipes-kernel/linux/linux-yocto_4.1.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_4.1.bbappend
> @@ -4,6 +4,7 @@ SRC_URI += "file://xt-checksum.scc \
>              file://ebtables.scc \
>             file://vswitch.scc \
>             file://lxc.scc \
> +            file://docker.scc \
>             "
>  KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>
> diff --git a/recipes-kernel/linux/linux-yocto_4.10.bbappend
> b/recipes-kernel/linux/linux-yocto_4.10.bbappend
> index f3be89e..f163fdf 100644
> --- a/recipes-kernel/linux/linux-yocto_4.10.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_4.10.bbappend
> @@ -4,6 +4,7 @@ SRC_URI += "file://xt-checksum.scc \
>              file://ebtables.scc \
>             file://vswitch.scc \
>             file://lxc.scc \
> +            file://docker.scc \
>             "
>  KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>
> diff --git a/recipes-kernel/linux/linux-yocto_4.4.bbappend
> b/recipes-kernel/linux/linux-yocto_4.4.bbappend
> index f3be89e..f163fdf 100644
> --- a/recipes-kernel/linux/linux-yocto_4.4.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_4.4.bbappend
> @@ -4,6 +4,7 @@ SRC_URI += "file://xt-checksum.scc \
>              file://ebtables.scc \
>             file://vswitch.scc \
>             file://lxc.scc \
> +            file://docker.scc \
>             "
>  KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>
> diff --git a/recipes-kernel/linux/linux-yocto_4.9.bbappend
> b/recipes-kernel/linux/linux-yocto_4.9.bbappend
> index f3be89e..f163fdf 100644
> --- a/recipes-kernel/linux/linux-yocto_4.9.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_4.9.bbappend
> @@ -4,6 +4,7 @@ SRC_URI += "file://xt-checksum.scc \
>              file://ebtables.scc \
>             file://vswitch.scc \
>             file://lxc.scc \
> +            file://docker.scc \
>             "
>  KERNEL_FEATURES_append = " features/kvm/qemu-kvm-enable.scc"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
>
> --
>
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f403045e9e0e6f86f30553f86ab3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jul 10, 2017 at 11:37 AM, Avery, Brian <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:brian.avery@intel.com" target=3D"_blank">brian.avery@intel.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">







<div bgcolor=3D"white" lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_7215229656221840721WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Calibri"=
>Works for me.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Calibri"=
>ty :)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Calibri"=
>-b<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Calibri"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Calibri"=
>p.s. working on this did hit bug
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8191" target=
=3D"_blank">https://bugzilla.yoctoproject.<wbr>org/show_bug.cgi?id=3D8191</=
a> when I tried to use linux-intel instead of linux-yocto.</span></p></div>=
</div></blockquote><div><br></div><div>Indeed. The requirement is still tha=
t linux-yocto&#39;s class is inherited. The new implementation</div><div>re=
moves that requirement but still has some issues.</div><div><br></div><div>=
Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"=
white" lang=3D"EN-US" link=3D"blue" vlink=3D"purple"><div class=3D"m_721522=
9656221840721WordSection1"><p class=3D"MsoNormal"><span style=3D"font-size:=
11.0pt;font-family:Calibri">
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Calibri"=
><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Calibri"=
><u></u>=C2=A0<u></u></span></p>
<div style=3D"border:none;border-top:solid #b5c4df 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><b><span style=3D"font-fa=
mily:Calibri;color:black">From:
</span></b><span style=3D"font-family:Calibri;color:black">Bruce Ashfield &=
lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashf=
ield@gmail.com</a>&gt;<br>
<b>Date: </b>Monday, July 10, 2017 at 8:24 AM<br>
<b>To: </b>&quot;Avery, Brian&quot; &lt;<a href=3D"mailto:brian.avery@intel=
.com" target=3D"_blank">brian.avery@intel.com</a>&gt;<br>
<b>Cc: </b>&quot;<a href=3D"mailto:meta-virtualization@yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@<wbr>yoctoproject.org</a>&quot; &lt;<a =
href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">meta=
-virtualization@<wbr>yoctoproject.org</a>&gt;<br>
<b>Subject: </b>Re: [meta-virtualization] [PATCH] docker: add NETFILTER_XT_=
MATCH_ADDRTYPE=3Dm<u></u><u></u></span></p>
</div><div><div class=3D"h5">
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">On Fri, Jul 7, 2017 at 7:=
38 PM, brian avery &lt;<a href=3D"mailto:brian.avery@intel.com" target=3D"_=
blank">brian.avery@intel.com</a>&gt; wrote:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Docker needs ths _NETFILT=
ER_XT_MATCH_ADDRTYPE module in order to start<br>
up successfully. This patch adds it to the supported kernels.<br>
<br>
Signed-off-by: brian avery &lt;<a href=3D"mailto:brian.avery@intel.com" tar=
get=3D"_blank">brian.avery@intel.com</a>&gt;<br>
---<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto/docker.cfg=C2=A0 =C2=A0 | 1 +<b=
r>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto/docker.scc=C2=A0 =C2=A0 | 4 +++=
+<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto_4.1.bbappend=C2=A0 | 1 +<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto_4.10.bbappend | 1 +<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto_4.4.bbappend=C2=A0 | 1 +<br>
=C2=A0recipes-kernel/linux/linux-<wbr>yocto_4.9.bbappend=C2=A0 | 1 +<br>
=C2=A06 files changed, 9 insertions(+)<br>
=C2=A0create mode 100644 recipes-kernel/linux/linux-<wbr>yocto/docker.cfg<b=
r>
=C2=A0create mode 100644 recipes-kernel/linux/linux-<wbr>yocto/docker.scc<b=
r>
<br>
diff --git a/recipes-kernel/linux/linux-<wbr>yocto/docker.cfg b/recipes-ker=
nel/linux/linux-<wbr>yocto/docker.cfg<br>
new file mode 100644<br>
index 0000000..d0ebb66<br>
--- /dev/null<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto/docker.cfg<br>
@@ -0,0 +1 @@<br>
+CONFIG_NETFILTER_XT_MATCH_<wbr>ADDRTYPE=3Dm<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">I could have sworn that I=
 already ported and merged my docker fragment to meta-virt,<u></u><u></u></=
p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">but it looks like I only =
staged it and never actually did the patch.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">To make the fragment as s=
tandalone as possible, I&#39;m running with this:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">------------<u></u><u></u=
></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">CONFIG_NETFILTER_XT_MATCH=
_<wbr>ADDRTYPE=3Dm<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">CONFIG_IP_NF_FILTER=3Dm<u=
></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">CONFIG_NF_NAT=3Dm<u></u><=
u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">CONFIG_NF_CONNTRACK_IPV4=
=3Dy<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">CONFIG_DM_THIN_PROVISIONI=
NG=3Dm<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">CONFIG_IP_NF_NAT=3Dm<u></=
u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">CONFIG_IP_NF_TARGET_<wbr>=
MASQUERADE=3Dm<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">CONFIG_OVERLAY_FS=3Dy<u><=
/u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">-------------<u></u><u></=
u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">I propose to update your =
fragment with those options and merge the changes that<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">way.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Any objections ?<u></u><u=
></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Bruce<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-left:.5in">diff --git a/recipes-kern=
el/linux/linux-<wbr>yocto/docker.scc b/recipes-kernel/linux/linux-<wbr>yoct=
o/docker.scc<br>
new file mode 100644<br>
index 0000000..e317456<br>
--- /dev/null<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto/docker.scc<br>
@@ -0,0 +1,4 @@<br>
+define KFEATURE_DESCRIPTION &quot;Enable Features needed by docker in addi=
tion to LXC features&quot;<br>
+define KFEATURE_COMPATIBILITY board<br>
+<br>
+kconf non-hardware docker.cfg<br>
diff --git a/recipes-kernel/linux/linux-<wbr>yocto_4.1.bbappend b/recipes-k=
ernel/linux/linux-<wbr>yocto_4.1.bbappend<br>
index f3be89e..f163fdf 100644<br>
--- a/recipes-kernel/linux/linux-<wbr>yocto_4.1.bbappend<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto_4.1.bbappend<br>
@@ -4,6 +4,7 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ebtables.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://vswitch.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc.scc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable.<wbr>s=
cc&quot;<br>
<br>
diff --git a/recipes-kernel/linux/linux-<wbr>yocto_4.10.bbappend b/recipes-=
kernel/linux/linux-<wbr>yocto_4.10.bbappend<br>
index f3be89e..f163fdf 100644<br>
--- a/recipes-kernel/linux/linux-<wbr>yocto_4.10.bbappend<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto_4.10.bbappend<br>
@@ -4,6 +4,7 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ebtables.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://vswitch.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc.scc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable.<wbr>s=
cc&quot;<br>
<br>
diff --git a/recipes-kernel/linux/linux-<wbr>yocto_4.4.bbappend b/recipes-k=
ernel/linux/linux-<wbr>yocto_4.4.bbappend<br>
index f3be89e..f163fdf 100644<br>
--- a/recipes-kernel/linux/linux-<wbr>yocto_4.4.bbappend<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto_4.4.bbappend<br>
@@ -4,6 +4,7 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ebtables.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://vswitch.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc.scc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable.<wbr>s=
cc&quot;<br>
<br>
diff --git a/recipes-kernel/linux/linux-<wbr>yocto_4.9.bbappend b/recipes-k=
ernel/linux/linux-<wbr>yocto_4.9.bbappend<br>
index f3be89e..f163fdf 100644<br>
--- a/recipes-kernel/linux/linux-<wbr>yocto_4.9.bbappend<br>
+++ b/recipes-kernel/linux/linux-<wbr>yocto_4.9.bbappend<br>
@@ -4,6 +4,7 @@ SRC_URI +=3D &quot;file://xt-checksum.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ebtables.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://vswitch.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://lxc.scc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker.scc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0KERNEL_FEATURES_append =3D &quot; features/kvm/qemu-kvm-enable.<wbr>s=
cc&quot;<br>
<span style=3D"color:#888888"><br>
<span class=3D"m_7215229656221840721gmail-hoenzb">--</span><br>
<span class=3D"m_7215229656221840721gmail-hoenzb">1.9.1</span><br>
<br>
<span class=3D"m_7215229656221840721gmail-hoenzb">--</span><br>
<span class=3D"m_7215229656221840721gmail-hoenzb">_________________________=
_____<wbr>_________________</span><br>
<span class=3D"m_7215229656221840721gmail-hoenzb">meta-virtualization maili=
ng list</span><br>
<span class=3D"m_7215229656221840721gmail-hoenzb"><a href=3D"mailto:meta-vi=
rtualization@yoctoproject.org" target=3D"_blank">meta-virtualization@<wbr>y=
octoproject.org</a></span><br>
<span class=3D"m_7215229656221840721gmail-hoenzb"><a href=3D"https://lists.=
yoctoproject.org/listinfo/meta-virtualization" target=3D"_blank">https://li=
sts.yoctoproject.<wbr>org/listinfo/meta-<wbr>virtualization</a></span></spa=
n><u></u><u></u></p>
</blockquote>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><br>
<br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">-- <u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&quot;Thou shalt not foll=
ow the NULL pointer, for chaos and madness await thee at its end&quot;<u></=
u><u></u></p>
</div>
</div>
</div>
</div></div></div>
</div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--f403045e9e0e6f86f30553f86ab3--
