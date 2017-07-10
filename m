Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CDD2AE00BC2; Mon, 10 Jul 2017 08:44:04 -0700 (PDT)
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
	*      [209.85.215.53 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36630E00B8B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 08:44:02 -0700 (PDT)
Received: by mail-lf0-f53.google.com with SMTP id b207so65118113lfg.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jul 2017 08:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Nrx0gjUQbQrvxps0okJJc/79wHai+QltknL9w9oOzyQ=;
	b=YS5J5s7eo5A3/DwzJGX8Jbs96qByyh9jv/Q3Okel0bhkW3aa/zyn91rLnG8fG8U1kU
	/7shZlssGez6M5jkTwWg87o5X8UkLLeBRLVdckMoH4PapWTpPz9afP/YHHNaaBQUbHhL
	GIWzSqGa1DF+ptLIKLK0IJsxv7p7GlHV8qOvefJTy3rTS4eqE44qezC07CZ29C5M/cUl
	2efbH1e1zO+FLBhsUZd0YFauza9G2sIv7F4y6Gq0238bOnBgnjS9chQzFRKEVb4fAzFq
	oV02uQB96P9oUDuaVTbzCMSH0SlKMlb3ZGWl/E4qXY3Cg8ERTTBraN4+4ReXBne/br+t
	h7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Nrx0gjUQbQrvxps0okJJc/79wHai+QltknL9w9oOzyQ=;
	b=Y3jIjd0a7VmpGVsWi1cg/cJzCAWbgtfqATGPOEaJG08Ixra1RfBLsCf3QbtmzqkyRO
	ZNxIrgJzUbUwF85kjBi8pP9szZUElSeCCKoVskAddOBrfb3NJk83aoXrVEEtTgACTsVm
	j2cmb+FgeUzA43NQ7OpegPOATS6A54MWiFfTbmRlfUGoSCgxDIJmjJ9UAyrf8AfiFdXB
	7UX0dabf3iSn1184EXR8K0Xv4keLg0KcYSK91Y7QbhFZFSYck8onTsaXlWLSaisJo7fB
	XWfmE++m52itUKwuhJG7yn+mmJT8aFv53siXbShbRMuBuGUtbFJG39MgCLxM4PaOFa+f
	pHkA==
X-Gm-Message-State: AIVw110MDKXYzXvgknbW/EnrBl2so5EOT9CPPUx0Z9YOidw/FO8fQGxL
	10m075tTTkxiWMbteq7eAbEHaomy+w==
X-Received: by 10.46.70.1 with SMTP id t1mr4696451lja.66.1499701441681; Mon,
	10 Jul 2017 08:44:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Mon, 10 Jul 2017 08:44:00 -0700 (PDT)
In-Reply-To: <CB9E7417-A7AD-45AC-AE41-8EFA8907B430@intel.com>
References: <1499470731-26466-1-git-send-email-brian.avery@intel.com>
	<CADkTA4OBvGKf5zaNxOu00s01QThL0DmhVUtLTr-nx9K69BpM5w@mail.gmail.com>
	<3CA7AF00-AEB9-46BC-9E5C-CB2586AAEA39@intel.com>
	<CB9E7417-A7AD-45AC-AE41-8EFA8907B430@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Jul 2017 11:44:00 -0400
Message-ID: <CADkTA4MACyFTkS-E6_zTa+pupwNG9k86NJupbXBw1NZEAb24yw@mail.gmail.com>
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
X-List-Received-Date: Mon, 10 Jul 2017 15:44:04 -0000
Content-Type: multipart/alternative; boundary="f403045f7486b36cf30553f87335"

--f403045f7486b36cf30553f87335
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 10, 2017 at 11:40 AM, Avery, Brian <brian.avery@intel.com>
wrote:

> One other thought/question: should we include the docker check-config
> tool? would make it easier for people to track these things down if it
> changes in the future.
>


It is currently in the docker-contrib package, since we didn't want it to
be always on target. Have you tried including that and it is otherwise
broken ?

Bruce


> -b
>
>
>
> *From: *<meta-virtualization-bounces@yoctoproject.org> on behalf of
> "Avery, Brian" <brian.avery@intel.com>
> *Date: *Monday, July 10, 2017 at 8:37 AM
> *To: *Bruce Ashfield <bruce.ashfield@gmail.com>
>
> *Cc: *"meta-virtualization@yoctoproject.org" <meta-virtualization@
> yoctoproject.org>
> *Subject: *Re: [meta-virtualization] [PATCH] docker: add
> NETFILTER_XT_MATCH_ADDRTYPE=m
>
>
>
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

--f403045f7486b36cf30553f87335
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jul 10, 2017 at 11:40 AM, Avery, Brian <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:brian.avery@intel.com" target=3D"_blank">brian.avery@intel.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">







<div bgcolor=3D"white" lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-1851879645393704427WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Calibri"=
>One other thought/question: should we include the docker check-config tool=
? would make it easier for people to track these things down if it changes =
in the future.</span></p></div></div></blockquote><div><br></div><div><br><=
/div><div>It is currently in the docker-contrib package, since we didn&#39;=
t want it to be always on target. Have you tried including that and it is o=
therwise broken ?</div><div><br></div><div>Bruce</div><div>=C2=A0<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div bgcolor=3D"white" lang=3D"EN-US" link=
=3D"blue" vlink=3D"purple"><div class=3D"m_-1851879645393704427WordSection1=
"><p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Calibr=
i"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Calibri"=
>-b<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:Calibri"=
><u></u>=C2=A0<u></u></span></p>
<div style=3D"border:none;border-top:solid #b5c4df 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><b><span style=3D"font-fa=
mily:Calibri;color:black">From:
</span></b><span style=3D"font-family:Calibri;color:black">&lt;<a href=3D"m=
ailto:meta-virtualization-bounces@yoctoproject.org" target=3D"_blank">meta-=
virtualization-bounces@<wbr>yoctoproject.org</a>&gt; on behalf of &quot;Ave=
ry, Brian&quot; &lt;<a href=3D"mailto:brian.avery@intel.com" target=3D"_bla=
nk">brian.avery@intel.com</a>&gt;<br>
<b>Date: </b>Monday, July 10, 2017 at 8:37 AM<br>
<b>To: </b>Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span></p><div><div class=
=3D"h5"><br>
<b>Cc: </b>&quot;<a href=3D"mailto:meta-virtualization@yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@<wbr>yoctoproject.org</a>&quot; &lt;<a =
href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">meta=
-virtualization@<wbr>yoctoproject.org</a>&gt;<br>
<b>Subject: </b>Re: [meta-virtualization] [PATCH] docker: add NETFILTER_XT_=
MATCH_ADDRTYPE=3Dm<u></u><u></u></div></div><p></p>
</div><div><div class=3D"h5">
<div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
11.0pt;font-family:Calibri">Works for me.</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
11.0pt;font-family:Calibri">ty :)</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
11.0pt;font-family:Calibri">-b</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
11.0pt;font-family:Calibri">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
11.0pt;font-family:Calibri">p.s. working on this did hit bug
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8191" target=
=3D"_blank">https://bugzilla.yoctoproject.<wbr>org/show_bug.cgi?id=3D8191</=
a> when I tried to use linux-intel instead of linux-yocto.
</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
11.0pt;font-family:Calibri">=C2=A0</span><u></u><u></u></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
11.0pt;font-family:Calibri">=C2=A0</span><u></u><u></u></p>
<div style=3D"border:none;border-top:solid #b5c4df 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal" style=3D"margin-left:1.0in"><b><span style=3D"font-f=
amily:Calibri;color:black">From:
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
MATCH_ADDRTYPE=3Dm</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">On Fri, Jul 7, 2017 at 7=
:38 PM, brian avery &lt;<a href=3D"mailto:brian.avery@intel.com" target=3D"=
_blank">brian.avery@intel.com</a>&gt; wrote:<u></u><u></u></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">Docker needs ths _NETFIL=
TER_XT_MATCH_ADDRTYPE module in order to start<br>
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
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">I could have sworn that =
I already ported and merged my docker fragment to meta-virt,<u></u><u></u><=
/p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">but it looks like I only=
 staged it and never actually did the patch.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">To make the fragment as =
standalone as possible, I&#39;m running with this:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">------------<u></u><u></=
u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">CONFIG_NETFILTER_XT_MATC=
H_<wbr>ADDRTYPE=3Dm<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">CONFIG_IP_NF_FILTER=3Dm<=
u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">CONFIG_NF_NAT=3Dm<u></u>=
<u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">CONFIG_NF_CONNTRACK_IPV4=
=3Dy<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">CONFIG_DM_THIN_PROVISION=
ING=3Dm<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">CONFIG_IP_NF_NAT=3Dm<u><=
/u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">CONFIG_IP_NF_TARGET_<wbr=
>MASQUERADE=3Dm<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">CONFIG_OVERLAY_FS=3Dy<u>=
</u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">-------------<u></u><u><=
/u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">I propose to update your=
 fragment with those options and merge the changes that<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">way.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">Any objections ?<u></u><=
u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">Bruce<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">diff --git a/recipes-ker=
nel/linux/linux-<wbr>yocto/docker.scc b/recipes-kernel/linux/linux-<wbr>yoc=
to/docker.scc<br>
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
<span class=3D"m_-1851879645393704427gmail-hoenzb">--</span><br>
<span class=3D"m_-1851879645393704427gmail-hoenzb">1.9.1</span><br>
<br>
<span class=3D"m_-1851879645393704427gmail-hoenzb">--</span><br>
<span class=3D"m_-1851879645393704427gmail-hoenzb">________________________=
______<wbr>_________________</span><br>
<span class=3D"m_-1851879645393704427gmail-hoenzb">meta-virtualization mail=
ing list</span><br>
<span class=3D"m_-1851879645393704427gmail-hoenzb"><a href=3D"mailto:meta-v=
irtualization@yoctoproject.org" target=3D"_blank">meta-virtualization@<wbr>=
yoctoproject.org</a></span><br>
<span class=3D"m_-1851879645393704427gmail-hoenzb"><a href=3D"https://lists=
.yoctoproject.org/listinfo/meta-virtualization" target=3D"_blank">https://l=
ists.yoctoproject.<wbr>org/listinfo/meta-<wbr>virtualization</a></span></sp=
an><u></u><u></u></p>
</blockquote>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in"><br>
<br clear=3D"all">
<u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">=C2=A0<u></u><u></u></p>
</div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">-- <u></u><u></u></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-left:1.0in">&quot;Thou shalt not fol=
low the NULL pointer, for chaos and madness await thee at its end&quot;<u><=
/u><u></u></p>
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

--f403045f7486b36cf30553f87335--
